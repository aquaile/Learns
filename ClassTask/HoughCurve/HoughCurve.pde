int canvas_size = 500;
PGraphics canvas;
PGraphics rhotheta;
HoughField houghfield;

boolean isDrawing = false;
boolean isUpdated = false;

//---------------------------------------
PImage image;
//---------------------------------------

void setup() {
  canvas = createGraphics(canvas_size, canvas_size);
  houghfield = new HoughField(canvas_size, canvas_size, canvas);
  rhotheta = createGraphics(houghfield.field_theta, houghfield.field_rho);

  //---------------------------------------
  image = loadImage("test.jpg");
  //---------------------------------------

  size(1000, 500); 

  canvas.beginDraw();
  canvas.background(0);
  canvas.endDraw();

  rhotheta.beginDraw();
  rhotheta.background(255);
  rhotheta.endDraw();
}

void draw() {
  if (isDrawing) {
    canvas.beginDraw();
    canvas.stroke(255);
    //canvas.image(image,0,0);
    canvas.line(pmouseX, pmouseY, mouseX, mouseY);
    canvas.endDraw();
  }

  if (isUpdated) {
    houghfield.update(canvas);
    houghfield.draw(rhotheta);
  }

  image(canvas, 0, 0);

  if (mouseX >= canvas_size) {
    int irho = mouseY;
    int itheta = mouseX - canvas_size;
    Line l = houghfield.restoreLine(irho, itheta);
    if (l != null) {
      line(l.x1, l.y1, l.x2, l.y2);
    }
  }


  //---------------------------------------------------------------------------------
  for (int i=0; i<20; i++) {
    Line l = houghfield.restoreLine(houghfield.vote_top20_rho[i], houghfield.vote_top20_theta[i]);
    stroke(255, 0, 0);
    line(l.x1, l.y1, l.x2, l.y2);
  }
  //---------------------------------------------------------------------------------


  image(rhotheta, canvas_size, 0);
  stroke(255);
  line(canvas_size, 0, canvas_size, canvas_size);

  isUpdated = false;
}

void mousePressed() {
  isDrawing = true;
}

void mouseReleased() {
  isDrawing = false;
  isUpdated = true;
}

void keyPressed() {
  if (key == 'c') {
    save("output.jpg");
    canvas.beginDraw();
    canvas.background(0);
    canvas.endDraw();
    houghfield.clear();
    isUpdated = true;
  }
}