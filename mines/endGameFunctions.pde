void checkWin() {
  int currentClicks = 0; //local variable used to see how many non-mine segments have been activated, or "clicked"
  
  for (int x = 0; x < shownArray.length; x++) {
    for (int y = 0; y < shownArray[x].length; y++) { //loops through every segment
      if (shownArray[x][y] == segArray[x][y]) { //if the shown segment is equal to the master field, meaning that it has been activated or "clicked"
        currentClicks += 1; //add one to the currentClicks variable
      }
    }
  }
  
  if (currentClicks == totalClicks) { //if every non-mine segment has been activated
    win = true;
  }
}

void onWin() { //function to display win message
  onEndDisplay();

  fill(0, 255, 0, 67);
  rect(0, 0, fieldWidth, fieldHeight); //draw a semi-transparent green rectangle over entire screen
  fill(0, 0, 0, 255);
  
  textSize(scale * 2.8);
  text("YOU\nWIN!\nSPACE TO\nREPLAY", 0, 0, fieldWidth, fieldHeight); //shows text
  textSize(scale * 0.75);
}

void onLose() { //function to display message and entire board when the player loses
  onEndDisplay();
  
  fill(255, 0, 0, 67);
  rect(0, 0, fieldWidth, fieldHeight); //draw a semi-transparent red rectangle over entire screen
  fill(0, 0, 0, 255);
  
  textSize(scale * 3.45);
  text("SPACE\nTO\nRESTART", 0, 0, fieldWidth, fieldHeight); //shows text
  textSize(scale * 0.75);
}

void onEndDisplay() {
  for (int x = 0; x < shownArray.length; x++) {
    for (int y = 0; y < shownArray.length; y++) { //loops through every segment
      if (shownArray[x][y] == 11 && segArray[x][y] != 9) { //if the play flagged a segment that wasn't a mine
        shownArray[x][y] = 14; //change that segment to the wrong flag image
      } else if (shownArray[x][y] != 14 && shownArray[x][y] != 15 ) { //if that segment isn't showing the wrong flag image
        shownArray[x][y] = segArray[x][y]; //set that segment to the master
      }
    }
  }
}