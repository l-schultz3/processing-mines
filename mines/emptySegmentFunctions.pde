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

void checkEmpty() { //function to activate all the segments around empty segments
  for (int x = 0; x * scale < width - scale; x++) {
    for (int y = 0; y * scale < height - scale; y++) { //loops through every segment
      if (shownArray[x][y] == 12) { //if that segment is empty
        expandOnEmpty(x, y);
        shownArray[x][y] = 0;
      }
    }
  }
}