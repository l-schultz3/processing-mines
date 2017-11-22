PImage mine;
PImage flag;
PImage wrongFlag;

int scale = 20;
boolean pressed = false;
boolean start = true;
boolean win = false;

int maxMines = 1;
int currentMines = 0;
int adjacent = 0;

int[][] segArray = {{}, {}, {}, {}, {}, {}, {}, {}, {}, {}, {}, {}, {}, {}, {}, {}};
int[][] shownArray = {{}, {}, {}, {}, {}, {}, {}, {}, {}, {}, {}, {}, {}, {}, {}, {}};

int totalArea;
int totalClicks;
int currentClicks = 0;

void setup() {
  mine = loadImage("mine.png");
  flag = loadImage("flag.png");
  wrongFlag = loadImage("wrongFlag.png");
  
  size(321, 321);
  background(255);
  fill(0);
  textAlign(CENTER);
  
  setArrays();
  drawShapes();
  
  totalArea = segArray.length * segArray[0].length;
  totalClicks = totalArea - maxMines;
  
}

void draw() {
  print("\ntotalClicks = ", str(totalClicks), "\ncurrentClicks = ", str(currentClicks));
  
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
      
      //print("\ncurrentMines = ", str(currentMines));
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
  checkWin();
  
  if (win) {
    onWin();
  }
}