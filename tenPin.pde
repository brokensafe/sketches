float space = 5;

void setup() {
  background(120);
  size(700, 700);
  
  smooth(4);
  stroke(255);
  strokeWeight(1);
}

void draw() {

  for (float x=0; x< width; x+=space) {
    for (float y=0; y<height; y+=space) {
      float ran=random(1);
      if (ran <.5) {
        // Draw line, top left to bottom right
        line(x, y, x+space, y+space);
      } else {
        // Draw line, bottom left to top right
        line(x, y+space, x+space, y);
      }
    }
  }
  noLoop();
}
