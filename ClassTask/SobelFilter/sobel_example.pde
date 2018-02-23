PImage image;
boolean windowResized = false;

void setup() {
  size(100, 100);
  image = loadImage("test.jpg");
  image.loadPixels();
}

void draw() {
  if (!windowResized) {
    // resize the main window to the size fo the image.
    surface.setSize(image.width, image.height);
    windowResized = true;
    return;
  }

  noLoop(); //prevent unexpected draw loop.

  size(image.width, image.height);
  background(0);

  int[][] result = sobel(image);

  loadPixels();

  for (int y=1; y<height-1; y++) {
    for (int x=1; x<width-1; x++) {
      int s = result[x][y];
      color c = color(s, s, s);
      pixels[y * width + x] = c;
    }
  }

  updatePixels();
  save("output.jpg");
}
