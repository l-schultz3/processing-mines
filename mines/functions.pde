void drawShapes() {
  for (int x = 0; x * scale < width; x++) {
    line(x * scale, 0, x * scale, height);
  }
  for (int y = 0; y * scale < width; y++) {
    line(0, y * scale, width, y * scale);
  }
  
  for (int i = 0; i < segArray.length; i++) {
    for (int j = 0; j < segArray[i].length; j++) {
      if (segArray[i][j] != 0 && segArray[i][j] != 9) {
        text(str(segArray[i][j]), i * scale, j * scale, scale, scale);
      } else if (segArray[i][j] == 9) {
        image(mine, i * scale, j * scale, scale, scale);
      }
    }
  }
}

void checkSeg() {
  for (int x = 0; x * scale < width; x++) {
    for (int y = 0; y * scale < height; y++) {
      if ((mouseX > x * scale && mouseX < x * scale + scale) && (mouseY > y * scale && mouseY < y * scale + scale)) {
        if (segArray[x][y] == 0) {
          //segArray[x][y] = 1;
        } else {
          //segArray[x][y] = 0;
        }
      }
    }
  }
}

void setArrays() {
  for (int i = 0; i < width / scale; i++) {
    for (int j = 0; j < width / scale; j++) {
      segArray[i] = append(segArray[i], 0);
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
    if (tilex + 1 < 9) {
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

  if (tilex + 1 < 9) {
    if (segArray[tiley][tilex+1] == 9) {
      segArray[tiley][tilex] += 1;
    }
  }

  if (tiley + 1 < 9) {
    if (tilex - 1 >= 0) {
      if (segArray[tiley+1][tilex-1] == 9) {
        segArray[tiley][tilex] += 1;
      }
      if (segArray[tiley+1][tilex] == 9) {
        segArray[tiley][tilex] += 1;
      }
      if (tilex + 1 < 9) {
        if (segArray[tiley+1][tilex+1] == 9) {
          segArray[tiley][tilex] += 1;
        }
      }
    }
  }
  
  return tilex;
}