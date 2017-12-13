import ketai.ui.*;

void setup() {
  print(str(width / 16));
  
  setArrays();
  setVariablesOnStart();
  
  //size(300, 500); //segArray.length * scale + 1 it adds the one so that you can see the last line on the right
  //orientation(PORTRAIT);
  //fullScreen();
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

void resetGame() { //function to theck if the player wants to play a new game
  if (mousePressed) { //if the space key is pressed
    if (endGameClick) {
      resetVariables(); //resets the variables so that the game can be restarted
      drawShapes();
    }
  }
}

void mouseReleased() {
  if (win || lose) {
    endGameClick = true;
  }
}