// Create a random bellcurve like distribution

//need to import Java Utils to get Random() class
import java.util.*;
Random generator;

void setup(){
  
   size(700,300);
   generator = new Random();
}

void draw(){
  //designates the type of distribution
  float num = (float) generator.nextGaussian();
  float sd = 60;
  float mean = width/2;
  
  float x = sd*num+mean;
  
  noStroke();
  // just having fun with the output.
  float es = constrain(1*(millis()/100),1,100);
  fill(0,10);
  ellipse(x,height/2,es,es);
}
