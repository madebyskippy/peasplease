int timeend = 10*1000; // in milliseconds

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
  
  textFont(fontk,50);
  fill(0,0,0,100);
  text("Step on the platform\nto start!",375+3,875+3);
  text("You have a minute\nto deliver as many peas\nas you can.",375+3,650+3);
  fill(255);
  text("Step on the platform\nto start!",375,875);
  text("You have a minute\nto deliver as many peas\nas you can.",375,650);
  
  peadraw();
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
  
  fill(255);
  textFont(fonts,150);
  text(str(counter),width*1/4,height*1/4);
  
  timer = millis()-timestart;
  if (timer > timeend){
    mode = "end";
  }
  timerdraw((float)timeend);
  fill(0);
}

void endscreen(){
  background(255);
  image(background,width/2-background.width/2,0);
  
  text("you gave me "+str(counter)+"  peas.",width/2,height/2);
}