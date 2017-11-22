PImage mine;
PImage flag;
PImage wrongFlag;

int scale = 40;
boolean pressed = false;
boolean start = true;

boolean win = false;
boolean lose = false;

boolean checkForEmpty = false;

int maxMines = 40;
int currentMines = 0;
int adjacent = 0;

int[][] segArray = {{}, {}, {}, {}, {}, {}, {}, {}, {}, {}, {}, {}, {}, {}, {}, {}};
int[][] shownArray = {{}, {}, {}, {}, {}, {}, {}, {}, {}, {}, {}, {}, {}, {}, {}, {}};

int totalArea;
int totalClicks;
int currentClicks;

void setVariablesOnStart() { 
  mine = loadImage("mine.png");
  flag = loadImage("flag.png");
  wrongFlag = loadImage("wrongFlag.png");
  
  totalArea = segArray.length * segArray[0].length;
  print(str(totalArea));
  totalClicks = totalArea - maxMines;
}

void resetVariables() {
  pressed = false;
  start = true;

  win = false;
  lose = false;

  currentMines = 0;
  adjacent = 0;

  currentClicks = 0;
  
  for (int x = 0; x < segArray.length; x++) {
    for (int y = 0; y < segArray.length; y++) {
      segArray[x][y] = 0;
      shownArray[x][y] = 10;
    }
  }
}