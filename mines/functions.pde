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
  segArray[x - 1][y - 1] = 13;
  segArray[x][y - 1] = 13;
  segArray[x + 1][y - 1] = 13;
  segArray[x - 1][y] = 13;
  segArray[x][y] = 13;
  segArray[x + 1][y] = 13;
  segArray[x - 1][y + 1] = 13;
  segArray[x][y + 1] = 13;
  segArray[x + 1][y + 1] = 13;
  setMines();
  return x;
}

int checkSegNonStart(int x, int y) {
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
  return x;
}