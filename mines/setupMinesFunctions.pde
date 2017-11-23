void setArrays() { //function to set segArray and shownArray to the width and height of the play area (divided by scale, so it's the number of segments needed to fill play area)
  for (int i = 0; i < width / scale; i++) {
    for (int j = 0; j < width / scale; j++) { //loops through every segment
      segArray[i] = append(segArray[i], 0);
      shownArray[i] = append(shownArray[i], 10); //appened with 10 so that when the segments are drawn, they're dark grey to indicate they haven't been pressed
    }
  }
}

void setMines() { //function to fill segArray with mines
  while (currentMines < maxMines) { //repeat until all the mines that are needed are placed
    for (int i = 0; i < segArray.length; i++) {
      for (int j = 0; j < segArray[i].length; j++) { //loops through every segment
        if (segArray[i][j] == 0) { //if that segment is empty (at this point it's only going to be 0, 9, or 13 so it's only checking if there's a mine placed in that segment, or if it's been reserved)
          float posMines = random(10); //creates a random number so that mines are placed in different places each game
          if (posMines < 1.0 && currentMines < maxMines) { //gives a one in ten chance of a mine being placed in that segment. The second statement is there to prevent the function from placing too many mines
            segArray[i][j] = 9; //9 represents mines
            currentMines += 1; //add one to the placed mines counter
          }
        }
      }
    }
  }
  
  for (int x = 0; x < segArray.length; x++) {
    for (int y = 0; y < segArray[x].length; y++) { //loops through every segment
      if (segArray[x][y] == 13) { //if the segment has been reserved (segments are reserved around and including the segment that was first pressed so that you don't start the game by losing
        segArray[x][y] = 0; //set it to 0 because it doesn't need to be reserved anymore
      }
      if (segArray[x][y] != 9) {
        checkAdjacent(x, y); //for every segment that isn't a mine, check how many mines are around that segment
      }
    }
  }
}

int checkAdjacent(int tiley, int tilex) { //function to check how many mines are around a given segment
  if (tiley - 1 >= 0) {
    if (tilex - 1 >= 0) {
      if (segArray[tiley-1][tilex-1] == 9) {
        segArray[tiley][tilex] += 1;
      }
    }
    if (segArray[tiley-1][tilex] == 9) {
      segArray[tiley][tilex] += 1;
    }
    if (tilex + 1 < width / scale) {
      if (segArray[tiley-1][tilex+1] == 9) {
        segArray[tiley][tilex] += 1;
      }
    }
  }

  if (tilex - 1 >= 0) {
    if (segArray[tiley][tilex-1] == 9) {
      segArray[tiley][tilex] += 1;
    }
  }

  if (tilex + 1 < width / scale) {
    if (segArray[tiley][tilex+1] == 9) {
      segArray[tiley][tilex] += 1;
    }
  }

  if (tiley + 1 < height / scale) {
    if (tilex - 1 >= 0) {
      if (segArray[tiley+1][tilex-1] == 9) {
        segArray[tiley][tilex] += 1;
      }
    }
    if (segArray[tiley+1][tilex] == 9) {
      segArray[tiley][tilex] += 1;
    }
    if (tilex + 1 < width / scale) {
      if (segArray[tiley+1][tilex+1] == 9) {
        segArray[tiley][tilex] += 1;
      }
    }
  }
  
  if (segArray[tiley][tilex] == 0) {
    segArray[tiley][tilex] = 12;
  }
  
  return tilex;
  
  //the reason for all of these if statement is because if the segment is on an edge the program crashes because it called an array out of bounds
}