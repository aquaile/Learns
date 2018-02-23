import org.apache.commons.math3.linear.*;

PImage original_img, transform_img;
int NUM_POINTS = 4;
int IMAGE_WIDTH = 282;
int IMAGE_HEIGHT = 500;
PVector setPoints[] = new PVector[NUM_POINTS];
PVector basePoints[] = {new PVector(0, 0), new PVector(IMAGE_WIDTH - 1, 0), new PVector(IMAGE_WIDTH - 1, IMAGE_HEIGHT - 1), new PVector(0, IMAGE_HEIGHT - 1)};
RealMatrix homographyMatrix;
RealVector homographyVector;
int count = 0;
void setup() {
  size(564, 1000);
  original_img = loadImage("photo_001.jpg");
  transform_img = new PImage(original_img.width, original_img.height, RGB);
}
void mousePressed() {
  int _x = mouseX;
  int _y = mouseY;
  float low_distance = 1000000;
  int number = -1;
  if (count < NUM_POINTS) {
    setPoints[count] = new PVector(_x, _y);
    count++;
  } else {
    for (int i=0; i<NUM_POINTS; i++) {
      if (dist(_x, _y, setPoints[i].x, setPoints[i].y)<low_distance) {
        low_distance = dist(_x, _y, setPoints[i].x, setPoints[i].y);
        number = i;
      } else {
      }
    }
    setPoints[number] = new PVector(_x, _y);
  }
}

void keyPressed() {
  if (key == ' ') {
    setPoints = new PVector[NUM_POINTS];
    count = 0;
  }
  if (keyCode == ENTER) {
    if (count == NUM_POINTS) {
      calculationMatrix(setPoints, basePoints);
      transform(original_img, transform_img, homographyVector);
    } else {
      println("Please Select 4 Points");
    }
  }
}
void draw() {
  image(original_img, 0, 0);
  drawSelectPoints(setPoints);
}

void drawSelectPoints(PVector[] _setPoints) {
  int r = 25;
  for (int i=0; i<NUM_POINTS; i++) {
    if (_setPoints[i] != null) {
      stroke(255, 255, 0);
      noFill();
      ellipse(_setPoints[i].x, _setPoints[i].y, r, r);
    }
  }
}

void calculationMatrix(PVector[] _setPoints, PVector[] _basePoints) {
  float x, y, X, Y;
  double[][] _matrix = new double[NUM_POINTS*2][NUM_POINTS*2];
  double[] _vector = new double[NUM_POINTS*2];
  for (int i=0; i<NUM_POINTS; i++) {
    //x = _setPoints[i].x;
    //y = _setPoints[i].y;
    //X = _basePoints[i].x;
    //Y = _basePoints[i].y;
    X = _setPoints[i].x;
    Y = _setPoints[i].y;
    x = _basePoints[i].x;
    y = _basePoints[i].y;
    float[] row_x = {x, y, 1, 0, 0, 0, -x*X, -y*X};
    float[] row_y = {0, 0, 0, x, y, 1, -x*Y, -y*Y};
    for (int j=0; j<NUM_POINTS*2; j++) {
      _matrix[2*i][j] = row_x[j];
      _matrix[2*i+1][j] = row_y[j];
    }
    _vector[2*i] = X;
    _vector[2*i+1] = Y;
  }

  RealVector _vec = MatrixUtils.createRealVector(_vector);
  RealMatrix _mat = MatrixUtils.createRealMatrix(_matrix);
  println(_vec);
  println(_mat);
  RealMatrix inverseMatrix =  MatrixUtils.inverse(_mat);
  println(inverseMatrix);
  RealVector outputVector = inverseMatrix.operate(_vec);
  println(outputVector);
  homographyVector = outputVector;
}

void transform(PImage input, PImage output, RealVector _homography) {
  println(_homography);
  for (int y=0; y<output.height; y++) {
    for (int x=0; x<output.width; x++) {
      double tmp = (double)x*_homography.getEntry(6) + (double)y*_homography.getEntry(7) + 1.0;
      double tmpX = ((double)x*_homography.getEntry(0) + (double)y*_homography.getEntry(1) + _homography.getEntry(2))/tmp;
      double tmpY = ((double)x*_homography.getEntry(3) + (double)y*_homography.getEntry(4) + _homography.getEntry(5))/tmp;

      int X = (int)tmpX;
      int Y = (int)tmpY;
      if (X >=0 && X < output.width && Y >=0 && Y < output.height) {
        color c = input.get(X, Y);
        output.set(x, y, c);
        //print("(X:" + X + ", x:" + x + ") (Y:" + Y + ", y:" + y + ")");
      }
    }
  }

  image(output, 0 + input.width, 0);
  //output.save("photo_003.png");
}