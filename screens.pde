int timeend = 10*1000; // in milliseconds

void startscreen(){
  background(255);
  float h = (int)(background.height * ((float)width/(float)background.width));
  image(background,0,height-h,width,h);
  text("space to start",width/2,height/5);
}

void gamescreen(){
  background(255);
  float h = (int)(background.height * ((float)width/(float)background.width));
  image(background,0,height-h,width,h);
  
  text("please give us\nan equal number\nof peas, please!",width/2,height/2);
  
  text(str(counter[0]),width/4,height*2/3);
  text(str(counter[1]),width*3/4,height*2/3);
  
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
  
  text("you gave us "+str(counter[0])+" and "+str(counter[1])+" peas.",width/2,height/2);
}