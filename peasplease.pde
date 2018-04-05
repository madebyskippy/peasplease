import processing.serial.*;
import ddf.minim.*;

Serial myPort;  // Create object from Serial class
int val;      // Data received from the serial port

// ------------------------- make this true when the arduino is connected
boolean arduino = false;
// -------------------------

boolean onPlatform;

boolean isPaused;
int timepause;
int timepausestart;

int timestart;
int timer;
int counter;

boolean btnstate;
boolean hasanim;

int balltimer;

String mode = "start"; //start, play, end

//
PImage background;
PImage background_title;
PImage title;
PImage[] mrpea = new PImage[4];
PImage[] peas = new PImage[3];
PImage basket;
PImage basket_top;
PImage[] sprouts = new PImage[4];
PImage[] clouds = new PImage[4];

PFont fontk;
PFont fonts;

void setup() {
  if (arduino) {
    println(Serial.list());
    String portName = Serial.list()[9];
    myPort = new Serial(this, portName, 9600);
  }

  frameRate(60);

  background = loadImage("background.png");
  background_title = loadImage("background_title.png");
  title = loadImage("title.png");
  basket = loadImage("basket.png");
  basket_top = loadImage("basket_top.png");
  for (int i=0; i<mrpea.length; i++) {
    mrpea[i]=loadImage("mrpea"+str(i)+".png");
    sprouts[i] = loadImage("sprout"+str(i)+".png");
    clouds[i] = loadImage("cloud"+str(i)+".png");
    if (i<3) {
      peas[i] = loadImage("peas"+str(i)+".png");
    }
  }

  fonts = loadFont("DKSnippitySnap-150.vlw");
  fontk = loadFont("Kiddish-100.vlw");
  textFont(fontk, 50);
  textAlign(CENTER, CENTER);

  //size (1920,1080);
  fullScreen();
  reset();
  resetstats();
}

void resetstats(){
  balltimer = millis();
  timestart = millis();
  counter = 0;
  timer = 0;
  timepause = 0;
}

void reset() {
  onPlatform = false;
  isPaused = false;
  mode = "start";
  btnstate = false;
  hasanim=false;
  frame = 3;
  IntList rowpos = new IntList(6);
  rowpos.append(0);
  rowpos.append(1);
  rowpos.append(2);
  rowpos.append(3);
  rowpos.append(4);
  rowpos.append(5);
  for (int i=0; i<peapos.length; i++) {
    if (i%6==0) {
      rowpos.shuffle();
    }
    peapos[i] = new PVector(325+35*rowpos.get(i%6), 840-40*((int)(i/6))-random(0, 40));
    peaangle[i] = random(0, 3.14);
    peaframe[i] = (int)random(3);
  }

  fill(0);
}

void draw() {
  if (arduino) {
    if ( myPort.available() > 0) {  // If data is available,
      val = myPort.read();         // read it and store it in val
      //val = 1, carrot up
      //val = 2, carrot down
      //val = 3, daikon up
      //val = 4, daikon down
      switch(val) {
      case 1:
        ballout();
        break;
      case 2:
        ballin();
        break;
      case 3:
        platformoff();
        break;
      case 4:
        platformon();
        break;
      }
      println(val);
    }
  }

  if (mode=="start") {
    //intro game and show instructions
    startscreen();
  } else if (mode == "play") {
    //gameplay!
    gamescreen();
  } else if (mode == "end") {
    //results
    endscreen();
  }
}

void keyPressed() {
  if (key == 'a' || key == 'A') {
    ballin();
  }
  if (key == 'l' || key == 'L') {
  }

  if (key == ' ') {
    if (onPlatform){
      platformoff();
    }else{
      platformon();
    }
  } 
  if (key == 'r') {
    //reset
    reset();
    resetstats();
  }
}
void keyReleased() {
  if (key == 'a' || key == 'A') {
    ballout();
  }
  if (key == 'l' || key == 'L') {
  }
}

void ballin() {
  if (!btnstate) {
    btnstate = true;
    if (mode == "play") {
      if (!isPaused){
        if ((millis() - balltimer) > 1000) {
          //1 second between ball entries
          counter ++ ;
          balltimer= millis();
          hasanim = true;
        }
      }
    }
  }
}
void ballout() {
  btnstate = false;
}

void platformon(){
  onPlatform = true;
  if (mode == "play"){
    isPaused = false;
    timepause += millis()-timepausestart;
    println("unpausing "+str(timepause));
  }
  if (mode == "start" || mode == "end"){
    resetstats();
    mode = "play";
  }
}

void platformoff(){
  onPlatform = false;
  if (mode == "play"){
    println("pausing");
    isPaused = true;
    timepausestart = millis();
  }
}
