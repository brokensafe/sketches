//recreated from Daniel Schiffman's Coding Train
// Coding Challenge 11: 3D Terrain Generation with Perlin Noise in Processing
//https://www.youtube.com/watch?v=IKB1hWWedMk

//num of cols, rows and the scale between them
int cols, rows;
int scl = 20;

//w, h used for mesh width and height
int w = 3000;
int h = 3000;

float flying = 0;

float [][] terrain;

void setup() {
  size(900, 900, P3D);

  cols = w / scl;
  rows = h / scl;
  terrain = new float[cols][rows];
}

void draw() {
  background(45);
  stroke(255);
  noFill();
  //used to make it look like it's moving
  flying -= 0.05;

  //creating an offset to allow the mesh to move
  float yoff=flying;
  //generating height values using perlin noise
  for (int y = 0; y < rows; y++) {
    float xoff = 0;
    for (int x = 0; x < cols; x++) {
      //noise instead of random to use perlin noise to keep things smoother
      terrain[x][y] = map(noise(xoff, yoff), 0, 1, -125, 125);
      xoff += 0.10;
    }
    yoff += 0.10;
  }

  // move the mesh origin to center screen 
  translate(width/2, height/2);
  // Rotate on the X axis
  rotateX(PI/3);
  //align mesh better now it's rotated
  translate(-w/2, -h/2);
  //Draw triangle mesh
  for (int y = 0; y < rows-1; y++) {
    //important to tell what time of shape to draw
    beginShape(TRIANGLE_STRIP);
    for (int x = 0; x < cols; x++) {
      vertex(x*scl, y*scl, terrain[x][y]);
      vertex(x*scl, (y+1)*scl, terrain[x][y+1]);
    }
    endShape();
  }
}
