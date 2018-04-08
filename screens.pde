int timeend = 10*1000; // in milliseconds
int startTextY = 875; //dynamic position of start text
int startTextAbs = 875; //static position of start text
int startTextVel = 1; 

void startscreen(){
  background(255);
  //image(background_title,width/2-background.width/2,0);
  image(background_blank,width/2-background.width/2,0);
  clouddraw();
  
  tint(0,0,0,100);
  image(title,width/2-title.width-125+10,130+10);
  tint(255);
  image(title,width/2-title.width-125,130);
  sproutdraw();
  bushdraw();
  playerdraw();
  
  image(instructions, width/2-title.width-125, 470);
  
  if( startTextY < startTextAbs - 2 || startTextY > startTextAbs + 2) startTextVel *= -1;
  startTextY += startTextVel;
  textdraw("Step on the platform to start!",width/2,startTextY,80,fontk,3);
  textdraw("You have one minute\nto deliver as many peas\nas you can.",410,600,50,fontk,3);
  
  if (counter>0){
    textdraw("You last gave",width*3/4,height/5,90,fontk,5);
    textdraw(str(counter),width*3/4+25,height/5+90,150,fonts,5);
    textdraw("peas.",width*3/4+160,height/5+80,90,fontk,5);
  }
}

void gamescreen(){
  background(255);
  //image(background_title,width/2-background.width/2,0);
  image(background_blank,width/2-background.width/2,0);
  clouddraw();
  sproutdraw();
  bushdraw();
  
  fill(unhex("ff3f893c"));
  noStroke();
  ellipse(width*3/5+280,860,200,50);
  playerdraw();
  
  ellipse(width/4,850,300,100);
  image(basket,width/4-basket.width/2 ,890-basket.height);
  
  peadraw();
  
  tint(255,255,255,100);
  image(basket_top,width/4-basket.width/2 ,890-basket.height);
  tint(255);
  
  textdraw(str(counter),width*1/4,height*1/4,150,fonts,7);
  
  if (!isPaused){
    timer = millis()-timestart-timepause;
  }else{
    textdraw("Paused!",width/2,height/2-150,150,fonts,5);
    textdraw("Get back on\nthe platform!",width/2,height/2+50,100,fontk,5);
  }
  if (timer > timeend){
    reset();
    //mode = "start";
  }
  timerdraw((float)timeend);
  fill(0);
}

void endscreen(){
  background(255);
  image(background,width/2-background.width/2,0);
  
  textFont(fonts,90);
  text("you gave\n"+str(counter)+"  peas.",width/2,height/2);
}