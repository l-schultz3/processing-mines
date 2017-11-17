int scale = 10;
boolean pressed = false;

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
    if (pressed == false) {
      checkSeg();
    }
    pressed = true;
  } else {
    pressed = false;
  }
  
  drawShapes();
}