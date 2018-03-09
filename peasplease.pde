import processing.serial.*;
import ddf.minim.*;

Serial myPort;  // Create object from Serial class
int val;      // Data received from the serial port

// ------------------------- make this true when the arduino is connected
boolean arduino = false;
// -------------------------

int timestart;
int timer;
int[] counter;

boolean[] btnstate;

int[] balltimer;

String mode = "start"; //start, play, end

//
PImage background;

void setup(){
  if (arduino){
    println(Serial.list());
    String portName = Serial.list()[8];
    myPort = new Serial(this, portName, 9600);
  }
  
  frameRate(60);
  
  background = loadImage("background.png");
  
  PFont font;
  font = loadFont("Kiddish-48.vlw");
  textFont(font, 30);
  textAlign(CENTER,CENTER);
  
  size (900,500);
  reset();
}

void reset(){
  mode = "start";
  btnstate = new boolean[]{false,false};
  counter = new int[]{0,0};
  balltimer = new int[]{millis(),millis()};
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
          ballout(0);
          break;
        case 2:
          //carrotIn();
          ballin(0);
          break;
        case 3:
          ballout(1);
          break;
        case 4:
          ballin(1);
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
    ballin(0);
  }if (key == 'l' || key == 'L'){
    ballin(1);
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
    ballout(0);
  }if (key == 'l' || key == 'L'){
    ballout(1);
  }
}

void ballin(int bucket){
  if (!btnstate[bucket]){
    btnstate[bucket] = true;
    if (mode == "play"){
      if ((millis() - balltimer[bucket]) > 1000){
        //1 second between ball entries
        println(millis());
        println(balltimer);
        counter[bucket] ++ ;
        balltimer[bucket] = millis();
      }
    }
  }
}
void ballout(int bucket){
  btnstate[bucket] = false;
}