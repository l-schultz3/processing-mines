void setup() {
  setArrays();
  setVariablesOnStart();
  
  size(321, 321);
  background(255);
  fill(0);
  textAlign(CENTER);
  
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