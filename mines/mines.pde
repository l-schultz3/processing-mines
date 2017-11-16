int scale = 100;

int[][] segArrayOLD = {{0, 0, 0, 0},
 {0, 0, 0, 0},
 {0, 0, 0, 0},
 {0, 0, 0, 0}};

int[][] segArray = {{}, {}, {}, {}};

void setup() {
  size(400, 400);

  background(255);
  fill(0);

  /*for (int i = 0; i < width / scale; i++) {
   xSegArray = append(xSegArray, 0);
   }
   for (int j = 0; j < height / scale; j++) {
   ySegArray = append(ySegArray, 0);
   }*/

  setArrays();

  //print("\n" + str(segArray));

  for (int x = 0; x * scale < width; x++) {
    line(x * scale, 0, x * scale, height);
  }
  for (int y = 0; y * scale < width; y++) {
    line(0, y * scale, width, y * scale);
  }
}

void draw() {
  //background(255);

  if (mousePressed) {
    checkSeg();
  }

  for (int i = 0; i < segArray.length; i++) {
    for (int j = 0; j < segArray[i].length; j++) {
      if (segArray[i][j] == 1) {
        rect(i * scale, j * scale, scale, scale);
      }
    }
  }
}

void checkSeg() {
  for (int x = 0; x * scale < width; x++) {
    for (int y = 0; y * scale < height; y++) {
      if ((mouseX > x * scale && mouseX < x * scale + scale) && (mouseY > y * scale && mouseY < y * scale + scale)) {
        print("\ni = " + x * scale + " j = " + y * scale);
        segArray[x][y] = 1;
      }
    }
  }
}

void setArrays() {
  int[] second = {};

  for (int j = 0; j < height / scale; j++) {
    second = append(second, 0);
  }

  /*for (int i = 0; i < width / scale; i++) {
   segArray[i] = append(segArray[i], second);
   }*/

  for (int i = 0; i < width / scale; i++) {
    segArray[i] = second;
    print(str(segArray[i]));
  }
}