PImage mine;
PImage flag;

int scale = 20;
boolean pressed = false;
boolean start = true;

int maxMines = 40;
int currentMines = 0;
int adjacent = 0;

int[][] segArray = {{}, {}, {}, {}, {}, {}, {}, {}, {}, {}, {}, {}, {}, {}, {}, {}};
int[][] shownArray = {{}, {}, {}, {}, {}, {}, {}, {}, {}, {}, {}, {}, {}, {}, {}, {}};

void setup() {
  mine = loadImage("mine.png");
  flag = loadImage("flag.png");
  
  size(321, 321);
  background(255);
  fill(0);
  textAlign(CENTER);
  
  setArrays();
  
  drawShapes();
}

void draw() {
  if (start) {
    if (mousePressed && (mouseButton == LEFT)) {
      if (!pressed) {
        checkSeg();
        
        drawShapes();
      }
      pressed = true;
      start = false;
    }
  } else {
    activeGameDraw();
  }
}

void activeGameDraw() {
  if (mousePressed && (mouseButton == LEFT)) {
    if (!pressed) {
      checkSeg();
        
      drawShapes();
    }
    pressed = true;
  } else if (mousePressed && (mouseButton == RIGHT)) {
    if (!pressed) {
      checkSeg();
      
      drawShapes();
    }
    pressed = true;
  } else {
    pressed = false;
  }
  
  checkEmpty();
}