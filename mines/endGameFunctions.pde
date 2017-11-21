void checkWin() {
  int mineCount = 0;
  
  for (int x = 0; x < shownArray.length; x++) {
    for (int y = 0; y < shownArray[x].length; y++) {
      if (shownArray[x][y] == segArray[x][y]) {
          
      } else {
        if (segArray[x][y] != 9) {
          break;
        } else {
          mineCount += 1;
        }
      }
    }
  }
  
  if (mineCount == currentMines) {
    onWin();
  }
}

void onWin() {
  fill(255, 0, 0);
  rect(0, 0, width, height);
}

void onLose() {
  for (int x = 0; x < shownArray.length; x++) {
    for (int y = 0; y < shownArray.length; y++) {
      if (shownArray[x][y] == 11 && segArray[x][y] != 9) {
        shownArray[x][y] = 14;
      } else if (shownArray[x][y] != 11) {
        shownArray[x][y] = segArray[x][y];
      }
    }
  }
}