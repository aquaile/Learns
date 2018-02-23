int[][] sobel(PImage image) {
  int[][] kernel = {
    {-1, 0, 1}, 
    {-2, 0, 2}, 
    {-1, 0, 1}
  };

  image.loadPixels();

  int[][] grayimage = new int[image.width][image.height];
  int[][] result = new int[image.width][image.height];

  for (int y=0; y<height; y++) {
    for (int x=0; x<width; x++) {
      grayimage[x][y] = (int)brightness(image.pixels[y*width + x]);
    }
  }

  for (int y=1; y<height-1; y++) {
    for (int x=1; x<width-1; x++) {
      int u = 0;
      int v = 0;
      for (int i=-1; i<2; i++) {
        for (int j=-1; j<2; j++) {
          u += kernel[i + 1][j + 1] * grayimage[x + i][y + j];
          v += kernel[j + 1][i + 1] * grayimage[x + i][y + j];
        }
      }

      result[x][y] = (abs(u) + abs(v)) / 4;
    }
  }
  
  return result;
}