void setArrays() {
  for (int i = 0; i < width / scale; i++) {
    for (int j = 0; j < width / scale; j++) {
      segArray[i] = append(segArray[i], 0);
      shownArray[i] = append(shownArray[i], 10);
    }
  }
}

void setMines() {
  while (currentMines < maxMines) {
    for (int i = 0; i < segArray.length; i++) {
      for (int j = 0; j < segArray[i].length; j++) {
        if (segArray[i][j] == 0) {
          float posMines = random(10);
          if (posMines < 1.0) {
            segArray[i][j] = 9;
            currentMines += 1;
          }
        }
      }
    }
  }
  
  for (int i = 0; i < segArray.length; i++) {
    for (int j = 0; j < segArray[i].length; j++) {
      if (segArray[i][j] == 13) {
        segArray[i][j] = 0;
      }
      if (segArray[i][j] != 9) {
        checkAdjacent(i, j);
      }
    }
  }
}

int checkAdjacent(int tiley, int tilex) {
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
}