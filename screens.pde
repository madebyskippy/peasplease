int timeend = 10*1000; // in milliseconds

void startscreen(){
  background(255);
  float h = (int)(background.height * ((float)width/(float)background.width));
  image(background,0,height-h,width,h);
  text("step on the platform to start!",width/2,height/5);
  text("i need peas!",width/2,height*3/5);
}

void gamescreen(){
  background(255);
  float h = (int)(background.height * ((float)width/(float)background.width));
  image(background,0,height-h,width,h);
  
  text("give me\npeas, please!",width/2,height/2);
  
  text(str(counter),width/2,height*2/3);
  
  timer = millis()-timestart;
  if (timer > timeend){
    mode = "end";
  }
  timerdraw((float)timeend);
  fill(0);
}

void endscreen(){
  background(255);
  float h = (int)(background.height * ((float)width/(float)background.width));
  image(background,0,height-h,width,h);
  
  text("you gave me "+str(counter)+"  peas.",width/2,height/2);
}