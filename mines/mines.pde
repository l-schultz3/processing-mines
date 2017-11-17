int scale = 10;

int[][] segArray = {{}, {}, {}, {}, {}, {}, {}, {}, {}, {}, {}, {}, {}, {}, {}, {}, {}, {}, {}, {}, {}, {}, {}, {}, {}, {}, {}, {}, {}, {}, {}, {}, {}, {}, {}, {}, {}, {}, {}, {}};

void setup() {
  size(400, 400);
  background(255);
  fill(0);

  setArrays();
}

void draw() {
  background(255);

  if (mousePressed) {
    checkSeg();
  }
  
  drawShapes();
}