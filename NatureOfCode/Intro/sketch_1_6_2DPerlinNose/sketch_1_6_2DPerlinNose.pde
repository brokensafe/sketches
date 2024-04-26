void setup() {
  size(538, 538);

  loadPixels();
  float xOff=0.0;
  for (int x=0; x<width; x++) {
    float yOff=0.0;
    for (int y=0; y<height; y++) {
      //float bright = random(255);
      float bright = map(noise(xOff,yOff),0,1,0,255);
      pixels[x+y*width]=color(bright);
      yOff+=0.01;
    }
    xOff+=0.01;
  }
  updatePixels();
}
