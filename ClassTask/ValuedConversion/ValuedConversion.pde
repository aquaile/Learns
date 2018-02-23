PImage image;
boolean windowResized = false;
int n = 10;
float[] model;



void setup() {
  size(100, 100);
  image = loadImage("me.jpg");
  image.loadPixels();
}

void draw() {
  if (!windowResized) {
    // resize the main window to the size fo the image.
    surface.setSize(image.width, image.height);
    windowResized = true;
    return;
  }
  background(0);
  noLoop();
  loadPixels();

  valued(n);

  for (int y=0; y<height; y++) {
    for (int x=0; x<width; x++) {
      float b = brightness(image.pixels[y*width + x]);
      float rnd = random(-10,10);
      for (int i=0; i<n-1; i++) {
        float sep = (model[i]+model[i+1])/2.0;
        if (b + rnd>model[i]&& + rnd<sep) {
          pixels[y*image.width + x] = color(model[i]);
        } else if (b + rnd>=sep&& + rnd<=model[i+1]) {
          pixels[y*image.width + x] = color(model[i+1]);
        }
      }
    }
  }

  updatePixels();
  save("output.jpg");
}

//n valued
void valued(int n) {
  model = new float[n];
  for (int i=0; i<n; i++) {
    if (i==0) {
      model[i] = 0.0*255.0;
    } else if (i==n-1) {
      model[i] = 1.0*255.0;
    } else {
      model[i] = (2.0*i-1.0)/(2.0*n-2.0)*255.0;
    }
    println(model[i]);
  }
}

void keyReleased(){
  if(keyCode==UP){
    n++;
    valued(n);
  }
  if(keyCode==DOWN){
    n--;
    valued(n);
  }
  loop();
}