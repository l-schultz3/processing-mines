void drawShapes() { //function to draw shapes
  background(255); //resets the screen to be blank so that images and shapes aren't being placed over each other
  
  for (int x = 0; x * scale < width; x++) { //these two loops draw the grid of lines. They are kept separate so that the playing field doesn't have to be square all the time
    line(x * scale, 0, x * scale, height);
  }
  for (int y = 0; y * scale < width; y++) {
    line(0, y * scale, width, y * scale);
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
      } else { //if the segment has no adjacent mines
        fill(255); //display a white segment
        rect(i * scale, j * scale, scale, scale);
        fill(0);
      }
    }
  }
}

void checkSeg() {
  for (int x = 0; x * scale < width; x++) {
    for (int y = 0; y * scale < height; y++) {
      if ((mouseX > x * scale && mouseX < x * scale + scale) && (mouseY > y * scale && mouseY < y * scale + scale)) {
        if (start) {
          checkSegStart(x, y);
          checkSegNonStart(x, y);
        } else {
          checkSegNonStart(x, y);
        }
      }
    }
  }
}

int checkSegStart(int x, int y) {
  segArray[x][y] = 13;
  
  if (y - 1 >= 0) {
    if (x - 1 >= 0) {
      segArray[x - 1][y - 1] = 13;
    }
    if (x + 1 < width / scale) {
      segArray[x + 1][y - 1] = 13;
    }
    
    segArray[x][y - 1] = 13;
  }
  
  if (x - 1 >= 0) {
    segArray[x - 1][y] = 13;
  }
  if (x + 1 < width / scale) {
    segArray[x + 1][y] = 13;
  }
  
  if (y + 1 < height / scale) {
    if (x - 1 >= 0) {
      segArray[x - 1][y + 1] = 13;
    }
    if (x + 1 < width / scale) {
      segArray[x + 1][y + 1] = 13;
    }
    
    segArray[x][y + 1] = 13;
  }
  
  setMines();
  return x;
}

int checkSegNonStart(int x, int y) {
  if (mouseButton == LEFT) {
    currentClicks += 1;
    if (shownArray[x][y] != 11) {
      shownArray[x][y] = segArray[x][y];
      if (shownArray[x][y] == 12) {
        expandOnEmpty(x, y);
        checkEmpty();
      } else if (shownArray[x][y] == 9) {
        onLose();
      }
    }
  } else {
    if (shownArray[x][y] == 10) {
      shownArray[x][y] = 11;
    } else if (shownArray[x][y] == 11) {
      shownArray[x][y] = 10;
    }
  }
  return x;
}