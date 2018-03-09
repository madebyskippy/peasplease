int timeend = 10*1000; // in milliseconds

void startscreen(){
  background(255);
}

void gamescreen(){
  if (timer < timeend*2/3){
    background(200,255,200);
  }else if(timer > timeend){
    background(255,225,225);
  }else{
    background(255,255,200);
  }
  
  float h = (int)(background.height * ((float)width/(float)background.width));
  image(background,0,height-h,width,h);
  
  if (!playing)
    text("space to start",width/2,height/5);
  text("please give us\nan equal number\nof peas, please!",width/2,height/2);
  //text("give me\npeas, please!",width/2,height/2);
  
  text(str(counter[0]),width/4,height*2/3);
  text(str(counter[1]),width*3/4,height*2/3);
  //text(str(counter[0])+" peas given",width/2,height*2/3);
  
  if (playing){
    timer = millis()-timestart;
    if (timer > timeend){
      text("done!!!",width/2,height*3/4);
      playing = false;
    }else{
      textSize(50);
      text("you have "+round((timeend-timer)/1000)+" secs left",width/2,height*4/5);
      textSize(30);
    }
  }
  timerdraw((float)timeend);
}

void endscreen(){
  background(255);
}