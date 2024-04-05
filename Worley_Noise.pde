// recreated from Daniel Schiffman's Coding Train
// Coding Worley Noise
// https://www.youtube.com/watch?v=4066MndcyCk


PVector[] points = new PVector[100];

void setup() {
  size(400, 400);
  for (int i = 0; i <points.length; i++) {
    points[i] = new PVector(random(width), random(height), random(width));
  }
}

void draw() {
  loadPixels();
  for (int x = 0; x<width; x++) {
    for (int y = 0; y<height; y++) {

      float[] distances = new float[points.length];
      for (int i=0; i< points.length; i++) {
        PVector v = points[i];
        float z = frameCount % width;
        float d = dist(x, y, z, v.x, v.y, v.z);
        distances[i] = d;
      }
      int n=0;
      float[] sorted = sort(distances);
      float r = map(sorted[0], 0, 150, 255, 0);
      float g = map(sorted[1], 0, width/2, 255, 0);
      float b = map(sorted[2], 0, 200, 0, 255);

      int index = x+y * width;
      pixels[index] = color(r,g,b);
    }
  }
  updatePixels();
  //noLoop();
  //for (PVector v:points){
  //  stroke(0,255,0);
  //  strokeWeight(8);
  //  point(v.x, v.y);
  // }
}
