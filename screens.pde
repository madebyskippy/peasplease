int timeend = 10*1000; // in milliseconds

void startscreen(){
  background(255);
  image(background,width/2-background.width/2,0);
  
  image(mrpea[3],width*3/5,745-mrpea[3].height);
  
  fill(0);
  text("step on the platform to start!",width/2,height/5);
  text("i need peas!",width/2,height*3/5);
}

void gamescreen(){
  background(255);
  image(background,width/2-background.width/2,0);
  
  fill(unhex("ff3f893c"));
  noStroke();
  ellipse(width*3/5+280,710,200,50);
  image(mrpea[0],width*3/5,745-mrpea[3].height);
  
  ellipse(width/4,710,300,100);
  image(basket,width/4-basket.width/2 ,750-basket.height);
  
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
  image(background,width/2-background.width/2,0);
  
  text("you gave me "+str(counter)+"  peas.",width/2,height/2);
}