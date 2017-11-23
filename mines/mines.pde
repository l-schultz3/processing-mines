void setup() {
  setArrays();
  setVariablesOnStart();
  
  size(321, 321);
  background(255);
  fill(0);
  textAlign(CENTER);
  textSize(scale * 0.75);
  
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
  checkWin();
  
  checkEmpty();
  
  
  if (win) {
    onWin();
    
    if (keyPressed && key == ' ') {
      resetGame();
    }
  }
  
  if (lose) {
    onLose();
    
    if (keyPressed && key == ' ') {
      resetGame();
    }
  }
}

void resetGame() {
  resetVariables();
  drawShapes();
}