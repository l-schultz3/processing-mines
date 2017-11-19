PImage mine;

int scale = 20;
boolean pressed = false;

int maxMines = 40;
int currentMines = 0;
int adjacent = 0;

int[][] segArray = {{}, {}, {}, {}, {}, {}, {}, {}, {}, {}, {}, {}, {}, {}, {}, {}};
int[][] shownArray = {{}, {}, {}, {}, {}, {}, {}, {}, {}, {}, {}, {}, {}, {}, {}, {}};

void setup() {
  mine = loadImage("mine.png");
  
  size(321, 321);
  background(255);
  fill(0);
  textAlign(CENTER);
  
  setArrays();
  
  while (currentMines < maxMines) {
    for (int i = 0; i < segArray.length; i++) {
      for (int j = 0; j < segArray[i].length; j++) {
        if (segArray[i][j] == 0) {
          float posMines = random(10);
          if (posMines < 1.0) {
            segArray[i][j] = 9;
            currentMines += 1;
          }
        }
      }
    }
  }
  
  for (int i = 0; i < segArray.length; i++) {
    for (int j = 0; j < segArray[i].length; j++) {
      if (segArray[i][j] != 9) {
        checkAdjacent(i, j);
      }
    }
  }
  
  drawShapes();
}

void draw() {
  if (mousePressed) {
    if (pressed == false) {
      checkSeg();
        
      background(255);
      drawShapes();
    }
    pressed = true;
  } else {
    pressed = false;
  }
}