int rows = 8;
int cols = 11;
int mult = 85;  //  pixel coordinate scale for x and y
int off = 50;    // offset between rows and cols
float wid = 25;  // width of shape
float hgt = 25;  // height of shape
float inc = .2;   // amount of inc for each frame
float min = 20.0;    // min size when breathing
float max = 30.0;    //  max size when breathing
boolean grow = true;  // breathe in first!
float r, g, b, a;  //red, green, blue, alpha

void changeColor() {
  r = (int)(Math.random()*256);
  g = (int)(Math.random()*256);
  b = (int)(Math.random()*256);
  //a = 255;
}

void mouseClicked() {
  changeColor();
}

void setup() {
  size(500, 400);
  rows = height / 50;
  cols = width / 25;
  r = (int)(Math.random()*256);
  g = (int)(Math.random()*256);
  b = (int)(Math.random()*256);
  a = 255;
}

void draw() {
  background(255);
  for (int x = 0; x < cols; x++) {    // x coordinate for rows loop
    for (int y = 0; y < rows; y++) {  // y coordinate for cols loop
      draw_shape(x*50, y*50);  // draw shapes in rows and cols
    }
  }
  for (int x = 0; x < cols; x++) {    // x coordinate for rows loop
    for (int y = 0; y < rows; y++) {  // y coordinate for cols loop
      draw_shape(x*50+25, y*50+25);  // draw shapes in rows and cols
    }
  }
  breathe();
  incr_size_color();

  if (wid >= max||wid <= min) {   // toggle phases
    grow = !grow;
  }
}

void breathe() {
  if (grow) {     // grow phase
    wid += inc;
    hgt += inc;
    a -= 255/(max - min)*inc;
  } else {        // shrink phase
    wid -= inc;
    hgt -= inc;
    a += 255/(max - min)*inc;
  }
}

void incr_size_color() {
  if (grow) {     // grow phase
    wid += inc;
    hgt += inc;
    a -= 255/(max-min);
  } else {        // shrink phase
    wid -= inc;
    hgt -= inc;
    a += 255/(max-min);
  }
}

void draw_shape(float x, float y) {
  fill(r, g, b, a);
  stroke(0, 0, 0);
  strokeWeight(3);
  triangle(x+wid, y+hgt, x-wid, y+hgt, x, y-50);
  ellipse(x, y+25, wid+25, hgt+25);
  //triangle(x+wid+off, y+hgt+off, x-wid+off, y+hgt+off, x, y-50+off);
  //ellipse(x+25, y, wid+25, hgt+25);
}
