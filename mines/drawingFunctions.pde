void startGameDraw() {
  if (mousePressed && (mouseButton == LEFT)) {
    if (!pressed) {
      checkSeg();
      drawShapes();
    }
    pressed = true;
    start = false;
  }
}

void activeGameDraw() {
  if (mousePressed) {
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
  
  if (lose) {
    win = false; //prevents bug where both the lose and the win screen display when the player has lost
    
    onLose();
    
    resetGame();
  }
  
  if (win) {
    onWin();
    
    resetGame();
  }
}

void drawShapes() { //function to draw shapes
  background(255); //resets the screen to be blank so that images and shapes aren't being placed over each other
  
  for (int x = 0; x * scale < fieldWidth; x++) { //these two loops draw the grid of lines. They are kept separate so that the playing field doesn't have to be square all the time
    line(x * scale, 0, x * scale, fieldHeight);
  }
  for (int y = 0; y * scale < fieldHeight; y++) {
    line(0, y * scale, fieldWidth, y * scale);
  }
  
  for (int i = 0; i < shownArray.length; i++) {
    for (int j = 0; j < shownArray[i].length; j++) { //loops through every segment
      if (shownArray[i][j] != 0 && shownArray[i][j] < 9) { //if that segment displays a number of adjacent mines
        text(str(shownArray[i][j]), i * scale, j * scale, scale, scale); //display the number of adjacent mines
      } else if (shownArray[i][j] == 9) { //if that segment is a mines
        image(mine, i * scale, j * scale, scale, scale); //display an image of a mine
      } else if (shownArray[i][j] == 10) { //if that segment hasn't been activated yet
        fill(200); //display a dark grey segment
        rect(i * scale, j * scale, scale, scale);
        fill(0);
      } else if (shownArray[i][j] == 11) { //if that segment has been flaged
        fill(200); //display a dark grey segment
        rect(i * scale, j * scale, scale, scale);
        fill(0);
        image(flag, i * scale, j * scale, scale, scale); //display an image of a flag
      } else if (shownArray[i][j] == 14) { //if that segment has been flaged, when it's a mine (only activated at the end of the game)
        fill(200); //display a dark grey segment
        rect(i * scale, j * scale, scale, scale);
        fill(0);
        image(wrongFlag, i * scale, j * scale, scale, scale); //display an image of a flag with an X over it
      } else if (shownArray[i][j] == 15) { //if that segment has been clicked, and is a mine
        image(clickedMine, i * scale, j * scale, scale, scale); //display an image of a mine, with a red background
      } else if (shownArray[i][j] == 0) { //sometimes the program leaves segments as 0, when they're supposed to 12 for the checkWin() function, this fixes that
        shownArray[i][j] = 12;
      } else { //if the segment has no adjacent mines
        fill(255); //display a white segment
        rect(i * scale, j * scale, scale, scale);
        fill(0);
      }
    }
  }
}