void drawShapes() {
  for (int x = 0; x * scale < width; x++) {
    line(x * scale, 0, x * scale, height);
  }
  for (int y = 0; y * scale < width; y++) {
    line(0, y * scale, width, y * scale);
  }
  
  for (int i = 0; i < segArray.length; i++) {
    for (int j = 0; j < segArray[i].length; j++) {
      if (segArray[i][j] != 0) {
        rect(i * scale, j * scale, scale, scale);
      }
    }
  }
}

void checkSeg() {
  for (int x = 0; x * scale < width; x++) {
    for (int y = 0; y * scale < height; y++) {
      if ((mouseX > x * scale && mouseX < x * scale + scale) && (mouseY > y * scale && mouseY < y * scale + scale)) {
        segArray[x][y] = 1;
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