int timeend = 60*1000; // in milliseconds

void startscreen(){
  background(255);
  image(background_title,width/2-background.width/2,0);
  tint(0,0,0,100);
  image(title,width/2-title.width-125+10,100+10);
  tint(255);
  image(title,width/2-title.width-125,100);
  sproutdraw();
  clouddraw();
  playerdraw();
  
  textdraw("Step on the platform to start!",625,875,80,fontk,3);
  textdraw("You have a minute\nto deliver as many peas\nas you can.",375,650,50,fontk,3);
  
  if (counter>0){
    textdraw("You last gave",width*3/4,height/5,90,fontk,5);
    textdraw(str(counter),width*3/4+25,height/5+90,150,fonts,5);
    textdraw("peas.",width*3/4+160,height/5+80,90,fontk,5);
  }
}

void gamescreen(){
  background(255);
  image(background_title,width/2-background.width/2,0);
  
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
