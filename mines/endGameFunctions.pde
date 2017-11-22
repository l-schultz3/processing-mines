void checkWin() {
  /*int mineCount = 0;
  
  for (int x = 0; x < shownArray.length; x++) {
    for (int y = 0; y < shownArray[x].length; y++) {
      if (shownArray[x][y] == segArray[x][y]) {
          
      } else {
        if (segArray[x][y] != 9) {
          //print("\n x = ", x, "\n y = ", y);
          break;
        } else {
          mineCount += 1;
          print("\nmineCount = ", str(mineCount));
          
          if (mineCount == currentMines) {
            win = true;
          }
        }
      }
    }
  }*/
  
  currentClicks = 0;
  
  for (int x = 0; x < shownArray.length; x++) {
    for (int y = 0; y < shownArray[x].length; y++) {
      if (shownArray[x][y] == segArray[x][y]) {
        //print("\nshownArray[x][y] = ", str(shownArray[x][y]));
        currentClicks += 1;
      }
    }
  }
  
  //print("\ncurrentClicks = ", str(currentClicks));
  
  if (currentClicks == totalClicks) {
    win = true;
  }
}

void onWin() {
  fill(255, 0, 0);
  rect(0, 0, width, height);
  print("True");
}

void onLose() {
  for (int x = 0; x < shownArray.length; x++) {
    for (int y = 0; y < shownArray.length; y++) {
      if (shownArray[x][y] == 11 && segArray[x][y] != 9) {
        shownArray[x][y] = 14;
      } else if (shownArray[x][y] != 14) {
        shownArray[x][y] = segArray[x][y];
      }
    }
  }
  
  fill(255, 0, 0, 67);
  rect(0, 0, width, height);
  fill(0, 0, 0, 255);
  
  textSize(scale * 3.45);
  text("SPACE\nTO\nRESTART", 0, 0, width, height);
  textSize(scale * 0.75);
}