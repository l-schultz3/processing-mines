PImage mine;
PImage clickedMine;
PImage flag;
PImage wrongFlag;

//int scale = 20;
boolean pressed = false;
boolean start = true;

boolean win = false;
boolean lose = false;
boolean endGameClick = false;

int maxMines = 40;
int currentMines = 0;

int[][] segArray = {{}, {}, {}, {}, {}, {}, {}, {}, {}, {}, {}, {}, {}, {}, {}, {}};
int[][] shownArray = {{}, {}, {}, {}, {}, {}, {}, {}, {}, {}, {}, {}, {}, {}, {}, {}};

int totalArea;
int totalClicks;

int scale = 50;

int fieldWidth = 16 * scale;
int fieldHeight = 16 * scale;
int fieldX0;
int fieldY0;

void setVariablesOnStart() { 
  
  mine = loadImage("mine.png");
  clickedMine = loadImage("clickedMine.png");
  flag = loadImage("flag.png");
  wrongFlag = loadImage("wrongFlag.png");
  
  totalArea = segArray.length * segArray[0].length;
  totalClicks = totalArea - maxMines;
  
  scale = width / 16;
  
  fieldWidth = 16 * scale;
  fieldHeight = 16 * scale;
}

void resetVariables() { //function to reset the variables back to their defaults when the player wants to restart a game
  pressed = false;
  start = true;

  win = false;
  lose = false;
  endGameClick = false;

  currentMines = 0;
  
  for (int x = 0; x < segArray.length; x++) {
    for (int y = 0; y < segArray.length; y++) { //loops through every segment
      segArray[x][y] = 0; //resets both arrays to their default value
      shownArray[x][y] = 10; //this is different than the setArrays() function because that appends to the arrays to fill the arrays, and this just resets their values
    }
  }
}