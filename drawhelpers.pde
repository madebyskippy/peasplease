int frametime = (int)(1000/9);
int frametimer;
int frame;
void playerdraw(){
  if (mode == "play"){
    if (frame == 3){
      frame = 2;
    }
    if (hasanim){
      hasanim = false;
      frame = 0;
      frametimer = millis();
      println("ok starting anim");
    }
    if (frame != 2){
      if (millis()-frametimer > frametime){
        println("next frame");
        frametimer = millis();
        frame ++;
      }
    }
  }
  image(mrpea[frame],width*3/5,895-mrpea[3].height);
}

int[] peaframe = new int[36];
PVector[] peapos = new PVector[36];
float[] peaangle = new float[36];
void peadraw(){
  imageMode(CENTER);
  for (int i=0; i<counter; i++){
    pushMatrix();
    translate(peapos[i].x,peapos[i].y);
    rotate(peaangle[i]);
    image(peas[peaframe[i]],0,0);
    popMatrix();
  }
  imageMode(CORNER);
}

void sproutdraw(){
  //image(sprouts[0],91,928);
  //image(sprouts[1],447,1000);
  //image(sprouts[2],950,900);
  //image(sprouts[3],1335,1000);
  //image(sprouts[3],1770,878);
}

void clouddraw(){
}

void timerdraw(float total){
  int size = 300;
  float x=width/2;
  float y=0;
  
  noStroke();
  fill(255);
  arc(x,y,size,size,0,PI,OPEN);
  
  float left = (float)timer/total;
  if (left > 0.9f){
    fill(255,150,150);
  }else if (left > 0.7f){
    fill(255,222,50);
  }else{
    fill(175);
  }
  arc (x,y, size,size,0,left*PI);
  
  noFill();
  stroke(0);
  strokeWeight(5);
  arc(x,y,size,size,0,PI,OPEN);
  
  float angle = TWO_PI/20;
  stroke(0);
  for (int i=0; i<11; i++){
    //circumference...
    line(size/2*sin(angle*i-PI/2)+x,size/2*cos(angle*i-PI/2)+y,
        size/2*0.9f*sin(angle*i-PI/2)+x,size/2*0.9f*cos(angle*i-PI/2)+y);
  }
}