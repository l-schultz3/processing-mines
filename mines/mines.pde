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
    startGameDraw();
  } else {
    activeGameDraw();
  }
}

void resetGame() {
  if (keyPressed && key == ' ') {
    resetVariables();
    drawShapes();
  }
}