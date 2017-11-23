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
    if (shownArray[x][y] != 11) {
      shownArray[x][y] = segArray[x][y];
      if (shownArray[x][y] == 12) {
        expandOnEmpty(x, y);
        checkEmpty();
      } else if (shownArray[x][y] == 9) {
        lose = true;
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