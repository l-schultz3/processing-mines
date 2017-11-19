PImage mine;

int scale = 20;
boolean pressed = false;

int maxMines = 10;
int currentMines = 0;
int adjacent = 0;

int[][] segArray = {{}, {}, {}, {}, {}, {}, {}, {}, {}};

void setup() {
  mine = loadImage("mine.png");
  
  size(180, 180);
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