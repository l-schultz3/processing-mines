PImage mine;
PImage flag;
PImage wrongFlag;

int scale = 20;
boolean pressed = false;
boolean start = true;

boolean win = false;
boolean lose = false;

int maxMines = 20;
int currentMines = 0;

int[][] segArray = {{}, {}, {}, {}, {}, {}, {}, {}, {}, {}, {}, {}, {}, {}, {}, {}};
int[][] shownArray = {{}, {}, {}, {}, {}, {}, {}, {}, {}, {}, {}, {}, {}, {}, {}, {}};

int totalArea;
int totalClicks;

void setVariablesOnStart() { 
  mine = loadImage("mine.png");
  flag = loadImage("flag.png");
  wrongFlag = loadImage("wrongFlag.png");
  
  totalArea = segArray.length * segArray[0].length;
  totalClicks = totalArea - maxMines;
}

void resetVariables() {
  pressed = false;
  start = true;

  win = false;
  lose = false;

  currentMines = 0;
  
  for (int x = 0; x < segArray.length; x++) {
    for (int y = 0; y < segArray.length; y++) {
      segArray[x][y] = 0;
      shownArray[x][y] = 10;
    }
  }
}