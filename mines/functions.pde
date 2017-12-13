void checkSeg() { //function to check which segment has been pressed
  for (int x = 0; x * scale < fieldWidth; x++) {
    for (int y = 0; y * scale < fieldHeight; y++) { //loops through every segment
      if ((mouseX > x * scale && mouseX < x * scale + scale) && (mouseY > y * scale && mouseY < y * scale + scale)) { //if that segment has the mouse over it (if that segment has been pressed)
        if (start) { //if the player hasn't pressed any segments yet (if the game has just started)
          checkSegStart(x, y);
          checkSegNonStart(x, y);
        } else { //if the player is in the middle of the game
          checkSegNonStart(x, y);
        }
      }
    }
  }
}

int checkSegStart(int x, int y) { //function that sets up the field on the first pressed
  segArray[x][y] = 13;
  
  if (y - 1 >= 0) {
    if (x - 1 >= 0) {
      segArray[x - 1][y - 1] = 13;
    }
    if (x + 1 < fieldWidth / scale) {
      segArray[x + 1][y - 1] = 13;
    }
    
    segArray[x][y - 1] = 13;
  }
  
  if (x - 1 >= 0) {
    segArray[x - 1][y] = 13;
  }
  if (x + 1 < fieldWidth / scale) {
    segArray[x + 1][y] = 13;
  }
  
  if (y + 1 < fieldHeight / scale) {
    if (x - 1 >= 0) {
      segArray[x - 1][y + 1] = 13;
    }
    if (x + 1 < fieldWidth / scale) {
      segArray[x + 1][y + 1] = 13;
    }
    
    segArray[x][y + 1] = 13;
  }
  
  //this function sets the the segment that has been pressed, and the eight around it, to a place holder value, then sets the mines
  //that ensures that on the first pressed, the player will be hitting a blank tile, to start the game off well
  
  setMines();
  return x;
}

int checkSegNonStart(int x, int y) { //function to run when a segment has been pressed, and the field has been setup
  //if (mouseButton == LEFT) { //if the left button has been pressed, meaning they want to reveal that segment
    if (shownArray[x][y] != 11) { //if that tile hasn't been flagged
      shownArray[x][y] = segArray[x][y]; //set the displayed segment to the master
      if (shownArray[x][y] == 12) { //if that segment is empty run the functions to deal with it
        expandOnEmpty(x, y);
        checkEmpty();
      } else if (shownArray[x][y] == 9) { //if that segment is a mine
        shownArray[x][y] = 15; //sets that segment to display an image of a mine outlined in red
        lose = true; //set the game to the lose state
      }
    }
  /*} else { //if the right button has been pressed, meaning they want to flag that statement
    if (shownArray[x][y] == 10) { //if that segment hasn't been revealed
      shownArray[x][y] = 11; //flag that segment
    } else if (shownArray[x][y] == 11) { //if that segment has been flagged
      shownArray[x][y] = 10; //unflag that segment
    }
  }*/
  return x;
}