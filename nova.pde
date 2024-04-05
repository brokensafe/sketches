void setup() {
  size(700,700);
  background(0);
  smooth(4);
}

void draw() {
  stroke(255,60);
  strokeWeight(1);
  noFill();
  
  translate(width/2,height/2);
  
  for(int i=0; i < 500; i++) {
    float a1 = random(TAU);
    float a2 = random(TAU);
    
    float x1 = cos(a1)*width/2.1;
    float y1 = sin(a1)*width/2.1;
    
    float x2 = cos(a2)*width/5;
    float y2 = sin(a2)*width/5;
    
    curve(0,0,x1,y1,x2,y2,0,0);
  }
  
  filter(ERODE);
  
  if(frameCount % 3 == 0) {
    saveFrame(frameCount/3 + ".png");
  }
}