void setup() {
  setArrays();
  setVariablesOnStart();
  
  size(321, 321); //segArray.length * scale + 1 it adds the one so that you can see the last line on the right
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
  if (keyPressed && key == ' ') { //if the space key is pressed
    resetVariables(); //resets the variables so that the game can be restarted
    drawShapes();
  }
}

void checkError() {
  print("\n\n\n\n");
  
  for (int i = 0; i < segArray.length; i++) {
    for (int j = 0; j < segArray[i].length; j++) { //loops through every segment
      if ((shownArray[i][j] == 12 || shownArray[i][j] == 0)) {
        
      } else {
        print("\nbreak");
        
        break;
      }
    }
      
    if (i == segArray.length) {
      print("ERROR");
    }
  }
}