import processing.serial.*;
import ddf.minim.*;

Serial myPort;  // Create object from Serial class
int val;      // Data received from the serial port

// ------------------------- make this true when the arduino is connected
boolean arduino = false;
// -------------------------

int timestart;
int timer;
int counter;

boolean btnstate;

int balltimer;

String mode = "start"; //start, play, end

//
PImage background;
PImage[] mrpea = new PImage[4];
PImage basket;

void setup(){
  if (arduino){
    println(Serial.list());
    String portName = Serial.list()[9];
    myPort = new Serial(this, portName, 9600);
  }
  
  frameRate(60);
  
  background = loadImage("background.png");
  basket = loadImage("basket.png");
  for (int i=0; i<mrpea.length; i++){
    mrpea[i]=loadImage("mrpea"+str(i)+".png");
  }
  
  PFont font;
  font = loadFont("Kiddish-48.vlw");
  textFont(font, 30);
  textAlign(CENTER,CENTER);
  
  //size (1920,1080);
  fullScreen();
  reset();
}

void reset(){
  mode = "start";
  btnstate = false;
  counter = 0;
  balltimer = millis();
  timer = 0;
  timestart = millis();
  
  fill(0);
}

void draw(){
  if (arduino){
    if ( myPort.available() > 0) {  // If data is available,
      val = myPort.read();         // read it and store it in val
      //val = 1, carrot up
      //val = 2, carrot down
      //val = 3, daikon up
      //val = 4, daikon down
      switch(val){
        case 1:
          ballout();
          break;
        case 2:
          ballin();
          break;
        case 3:
          break;
        case 4:
          break;
      }
      println(val);
    }
  }
  
  if (mode=="start"){
    //intro game and show instructions
    startscreen();
  }else if (mode == "play"){
    //gameplay!
    gamescreen();
  }else if (mode == "end"){
    //results
    endscreen();
  }
}

void keyPressed(){
  if (key == 'a' || key == 'A'){
    ballin();
  }if (key == 'l' || key == 'L'){
  }
  
  if (key == ' '){
    if (mode != "play"){
      reset();
      mode = "play";
    }
  } if (key == 'r'){
   //reset
   reset();
 }
}
void keyReleased(){
  if (key == 'a' || key == 'A'){
    ballout();
  }if (key == 'l' || key == 'L'){
  }
}

void ballin(){
  if (!btnstate){
    btnstate = true;
    if (mode == "play"){
      if ((millis() - balltimer) > 1000){
        //1 second between ball entries
        println(millis());
        println(balltimer);
        counter ++ ;
        balltimer= millis();
      }
    }
  }
}
void ballout(){
  btnstate = false;
}