void setup() {
  setArrays();
  setVariablesOnStart();
  
  size(641, 641);
  background(255);
  fill(0);
  textAlign(CENTER);
  textSize(scale * 0.75);
  
  drawShapes();
}

void draw() {
  //print("\ntotalClicks = ", str(totalClicks), "\ncurrentClicks = ", str(currentClicks));
  
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
      checkForEmpty = true;
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
  checkWin();
  
  if (checkForEmpty) {
    checkEmpty();
  }
  
  if (win) {
    onWin();
  }
  
  if (lose) {
    onLose();
    
    if (keyPressed && key == ' ') {
      resetGame();
    }
  }
  
  checkForEmpty = false;
}

void resetGame() {
  resetVariables();
  drawShapes();
}