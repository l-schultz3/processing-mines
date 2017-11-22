int expandOnEmpty(int x, int y) {
  if (y - 1 >= 0) {
    shownArray[x][y - 1] = segArray[x][y - 1];
    
    if (x - 1 >= 0) {
      shownArray[x - 1][y - 1] = segArray[x - 1][y - 1];
    }
    
    if (x + 1 < width / scale) {
      shownArray[x + 1][y - 1] = segArray[x + 1][y - 1];
    }
  }
  
  if (x - 1 >= 0) {
    shownArray[x - 1][y] = segArray[x - 1][y];
  }
  
  if (x + 1 < width / scale) {
    shownArray[x + 1][y] = segArray[x + 1][y];
  }
  
  if (y + 1 < height / scale) {
    shownArray[x][y + 1] = segArray[x][y + 1];
    
    if (x - 1 >= 0) {
      shownArray[x - 1][y + 1] = segArray[x - 1][y + 1];
    }
    
    if (x + 1 < width / scale) {
      shownArray[x + 1][y + 1] = segArray[x + 1][y + 1];
    }
  }
  
  drawShapes();
  return x;
}

void checkEmpty() {
  for (int i = 0; i <= 5; i++) {
    for (int x = 0; x * scale < width - scale; x++) {
      for (int y = 0; y * scale < height - scale; y++) {
        if (shownArray[x][y] == 12) {
          expandOnEmpty(x, y);
          shownArray[x][y] = 0;
        }
      }
    }
  }
}