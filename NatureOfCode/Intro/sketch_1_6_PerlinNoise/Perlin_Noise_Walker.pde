Walker w;

void setup() {
  size(609, 609);
  background(20);
  stroke(255, 10);

  w = new Walker();
}

void draw() {
  w.step();
  w.display();
}
