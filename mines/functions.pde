void drawShapes() {
  background(255);
  
  for (int x = 0; x * scale < width; x++) {
    line(x * scale, 0, x * scale, height);
  }
  for (int y = 0; y * scale < width; y++) {
    line(0, y * scale, width, y * scale);
  }
  
  for (int i = 0; i < shownArray.length; i++) {
    for (int j = 0; j < shownArray[i].length; j++) {
      if (shownArray[i][j] != 0 && shownArray[i][j] < 9) {
        text(str(shownArray[i][j]), i * scale, j * scale, scale, scale);
      } else if (shownArray[i][j] == 9) {
        image(mine, i * scale, j * scale, scale, scale);
      } else if (shownArray[i][j] == 10) {
        fill(200);
        rect(i * scale, j * scale, scale, scale);
        fill(0);
      } else if (shownArray[i][j] == 11) {
        image(flag, i * scale, j * scale, scale, scale);
      } else {
        fill(255);
        rect(i * scale, j * scale, scale, scale);
        fill(0);
      }
    }
  }
}

int expandOnEmpty(int x, int y) {
  if (y - 1 > 0) {
    shownArray[x][y - 1] = segArray[x][y - 1];
    
    if (x - 1 > 0) {
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
  
  if (y + 1 < width / scale) {
    shownArray[x][y + 1] = segArray[x][y + 1];
    
    if (x - 1 > 0) {
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
  for (int x = 0; x * scale < width - scale; x++) {
    for (int y = 0; y * scale < height - scale; y++) {
      if (shownArray[x][y] == 12) {
        expandOnEmpty(x, y);
        shownArray[x][y] = 0;
      }
    }
  }
}

void checkSeg() {
  for (int x = 0; x * scale < width; x++) {
    for (int y = 0; y * scale < height; y++) {
      if ((mouseX > x * scale && mouseX < x * scale + scale) && (mouseY > y * scale && mouseY < y * scale + scale)) {
        if (mouseButton == LEFT) {
          shownArray[x][y] = segArray[x][y];
          if (shownArray[x][y] == 12) {
            expandOnEmpty(x, y);
            checkEmpty();
          }
        } else {
          if (shownArray[x][y] == 10) {
            shownArray[x][y] = 11;
          } else if (shownArray[x][y] == 11) {
            shownArray[x][y] = 10;
          }
        }
      }
    }
  }
}

void setArrays() {
  for (int i = 0; i < width / scale; i++) {
    for (int j = 0; j < width / scale; j++) {
      segArray[i] = append(segArray[i], 0);
      shownArray[i] = append(shownArray[i], 10);
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

  if (tiley + 1 < width / scale) {
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