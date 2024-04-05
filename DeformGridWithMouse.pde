// deform field of points with the mouse
// from LaPuissanceDuYaourt on Reddit r/processing
// code from https://020406.org/processing/pde/DeformGridWithMouse.pde


ArrayList<PVector> points = new ArrayList<PVector>();
int n = 60;
int margin = 0;
ArrayList<ArrayList<PVector>> grid = new ArrayList<ArrayList<PVector>>();
boolean attract = false;
PGraphics pg;

void setup() {
  size(900, 900, P2D);
  pg = createGraphics(1080, 1080, P2D);
  pg.smooth(8);
  float inc = (pg.width - margin * 2.0) / n;
  for (int i = -n; i <= n * 2; i++) {
    ArrayList<PVector> list = new ArrayList<PVector>();
    float y = margin + i * inc;
    for (int j = -n; j <= n * 2; j++) {
      float x = margin + j * inc;
      PVector p = new PVector(x, y);
      list.add(p);
      points.add(p);
    }
    grid.add(list);
  }
}

boolean onScreen(PVector p) {
  return p.x >= margin && p.x <= pg.width - margin && p.y >= margin && p.y <= pg.height - margin;
}

void draw() {
  if (mousePressed) {
    boolean attract = mouseButton == LEFT;
    deform(points, attract);
  }
  pg.beginDraw();
  pg.background(0, 0, 75);
  pg.stroke(175, 125, 255);
  pg.strokeWeight(1.5);

  for (int j = 0; j < grid.size() - 1; j++) {
    ArrayList<PVector> row = grid.get(j);
    for (int i = 0; i < row.size() - 1; i++) {
      PVector p = row.get(i);
      PVector p2 = row.get(i + 1);
      PVector p3 = grid.get(j + 1).get(i);
      if (onScreen(p) || onScreen(p2) || onScreen(p3)) {
        pg.line(p.x, p.y, p2.x, p2.y);
        pg.line(p.x, p.y, p3.x, p3.y);
      }
    }
  }
  for (PVector p : points) {
    if (onScreen(p)) {
      pg.point(p.x, p.y);
    }
  }
  pg.noStroke();
  pg.fill(255, 200, 200);
  pg.circle(map(mouseX, 0, width, 0, pg.width), map(mouseY, 0, height, 0, pg.height), 16);
  pg.endDraw();
  image(pg, 0, 0, width, height);
  println(frameCount);
  //if (frameCount == 1800) {
  //  saveFrame("output.png");
  //}
}

void deform(ArrayList<PVector> set, boolean attract) {
  PVector c = new PVector(map(mouseX, 0, width, 0, pg.width), map(mouseY, 0, height, 0, pg.height)); // new PVector(width / 2, height / 2);
  float maxDiagonal = getMaxDist(c, set); // dist(margin, margin, width / 2, height / 2);
  for (PVector p : set) {
    float d = dist(p.x, p.y, c.x, c.y);
    float dFactor = attract ? 1 - 0.03 * pow(1 - d / maxDiagonal, 15) : 1 + 0.03 * pow(1 - d / maxDiagonal, 15);
    PVector temp = p.copy();
    temp.sub(c);
    temp.mult(dFactor);
    temp.add(c);
    p.x = temp.x;
    p.y = temp.y;
  }
}

float getMaxDist(PVector p, ArrayList<PVector> set) {
  if (set.isEmpty()) {
    return 0;
  }
  float maxDistSq = Float.MIN_VALUE;
  for (PVector v : set) {
    float dSq = v.copy().sub(p).magSq();
    if (dSq > maxDistSq) {
      maxDistSq = dSq;
    }
  }
  return sqrt(maxDistSq);
}
