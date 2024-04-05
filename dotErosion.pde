void setup(){
  size(500,500);
  background(128);
  smooth(4);
  frameRate(15);
  
}

int time = 0;
int alpha = 0;
int born = 0;

void draw() {
  
  drawDots();
  filter(ERODE);
}

void drawDots() {
  
  fill(255,100);
  
  float[] spotx = new float[50];
  float[] spoty = new float[50];
  float[] spotw = new float[50];
  float[] spotz = new float[50];
  
  for(int as=0; as<11; as++){
    spotx[as] = random(0,width);
    spoty[as] = random(0,height);
    spotw[as] = random(0,width);
    spotz[as]= random(0,height);
    
    if(as==10){
      while (born<frameCount){
        for(int reps=1; reps<=10; reps++){
          noStroke();
          
          if(reps==1){
            ellipse(spotx[(reps-1)], spoty[(reps-1)], 10,10);
            ellipse(spotw[(reps-1)], spotz[(reps-1)], 10,10);
          }
          ellipse(spotx[reps], spoty[reps], 10,10);
          ellipse(spotw[reps], spotz[reps], 10,10);
          stroke(255,50);
          strokeWeight(2);
          line(spotx[reps], spoty[reps], spotx[(reps-1)], spoty[(reps-1)]);
          line(spotw[reps], spotz[reps], spotw[(reps-1)], spotz[(reps-1)]);
          
          born=frameCount;
      }
      }
    }
     //noLoop(); 
  }
   
}
  
    
//}

  