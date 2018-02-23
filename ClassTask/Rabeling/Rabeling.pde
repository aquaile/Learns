import processing.video.*;

Movie movie;

PImage img_bg;  // 背景画像
PImage img_result; // 結果画像
PImage img_sub;   // 差分画像
PImage img_bin;  // 2値画像

PImage img_tmp1;  // 膨張収縮処理中のデータを入れる変数
PImage img_tmp2;  // 膨張収縮処理中のデータを入れる変数
PImage img_lab; //ラベリング

color WHITE = color(255);  // 白画素
color BLACK = color(0);    // 黒画素

PVector saveAreaPointMax[];
PVector saveAreaPointMin[];


void setup() {
  size(1280, 720 );
  movie = new Movie(this, "cup.mp4");
  movie.loop();

  img_bg = createImage( 640, 360, RGB );
  img_result = createImage( 640, 360, RGB );
  img_sub = createImage( 640, 360, RGB );
  img_bin = createImage( 640, 360, RGB );

  img_tmp1= createImage( 640, 360, RGB );
  img_tmp2 = createImage( 640, 360, RGB );
  img_lab = createImage( 640, 360, RGB );
}


void draw() {
  background(0);
  noStroke();
  PImage img_live = movie.copy();

  subtraction( img_live, img_bg, img_sub ); // 背景差分
  binarization( img_sub, img_bin, 21 ); // ２値化処理

  // クロージング
  dilation( img_bin, img_tmp1 );  // 膨張処理
  erosion( img_tmp1, img_tmp2 );  // 収縮処理

  // オープニング
  erosion( img_tmp2, img_tmp1 );  // 収縮処理
  dilation( img_tmp1, img_tmp2 );  // 膨張処理
  //img_lab = img_tmp2;

  labeling(img_tmp2, img_lab);

  // 結果表示
  image(img_live, 0, 0);
  image(img_tmp2, img_tmp2.width, 0 );
  image(img_bin, 0, img_live.height );
  image(img_lab, img_tmp2.width, img_live.height );

  for (int i=2; i<saveAreaPointMax.length; i++) {
    float max_x = saveAreaPointMax[i].x;
    float max_y = saveAreaPointMax[i].y;
    float min_x = saveAreaPointMin[i].x;
    float min_y = saveAreaPointMin[i].y;
    rectMode(CORNERS);
    noFill();
    stroke(255, 255, 0);
    rect(max_x, max_y, min_x, min_y);
  }
}

void movieEvent(Movie m) {
  m.read();
}

void mousePressed() {
  if ( mouseButton == LEFT ) {
    movie.pause();
  }
  if ( mouseButton == RIGHT ) {
    movie.play();
  }
}

void keyPressed() {
  if (key == ' ') {
    img_bg = movie.copy();
  }
}


// 収縮
void erosion(PImage img_in, PImage img_out) {

  // 入力画像と同じデータを出力画像にコピー
  for (int y=0; y<img_in.height; y++) {
    for (int x=0; x<img_in.width; x++) {
      img_out.set( x, y, img_in.get(x, y) );
    }
  }

  for (int y=0; y<img_in.height; y++) {
    for (int x=0; x<img_in.width; x++) {

      // 注目画素（x,y）の左上が黒（背景）画素だったら
      if ( img_in.get(x-1, y-1) == BLACK ) {
        img_out.set( x, y, BLACK );
      } else if ( img_in.get(x, y-1) == BLACK ) {
        img_out.set( x, y, BLACK );
      } else if ( img_in.get(x+1, y-1) == BLACK ) {
        img_out.set( x, y, BLACK );
      } else if ( img_in.get(x-1, y) == BLACK ) {
        img_out.set( x, y, BLACK );
      } else if ( img_in.get(x+1, y) == BLACK ) {
        img_out.set( x, y, BLACK );
      } else if ( img_in.get(x-1, y+1) == BLACK ) {
        img_out.set( x, y, BLACK );
      } else if ( img_in.get(x, y+1) == BLACK ) {
        img_out.set( x, y, BLACK );
      } else if ( img_in.get(x+1, y+1) == BLACK ) {
        img_out.set( x, y, BLACK );
      }
    }
  }
}



// 膨張
void dilation(PImage img_in, PImage img_out) {

  // 入力画像と同じデータを出力画像にコピー
  for (int y=0; y<img_in.height; y++) {
    for (int x=0; x<img_in.width; x++) {
      img_out.set( x, y, img_in.get(x, y) );
    }
  }

  for (int y=0; y<img_in.height; y++) {
    for (int x=0; x<img_in.width; x++) {

      // 注目画素: (x,y)

      // 注目画素の左上が白（物体領域）画素だったら
      if ( img_in.get(x-1, y-1) == WHITE ) {
        img_out.set( x, y, WHITE );
      } else if ( img_in.get(x, y-1) == WHITE ) {
        img_out.set( x, y, WHITE );
      } else if ( img_in.get(x+1, y-1) == WHITE ) {
        img_out.set( x, y, WHITE );
      } else if ( img_in.get(x-1, y) == WHITE ) {
        img_out.set( x, y, WHITE );
      } else if ( img_in.get(x+1, y) == WHITE ) {
        img_out.set( x, y, WHITE );
      } else if ( img_in.get(x-1, y+1) == WHITE ) {
        img_out.set( x, y, WHITE );
      } else if ( img_in.get(x, y+1) == WHITE ) {
        img_out.set( x, y, WHITE );
      } else if ( img_in.get(x+1, y+1) == WHITE ) {
        img_out.set( x, y, WHITE );
      }
    }
  }
}



// ２値化処理
// img_in : 入力画像
// img_out : 出力画像（2値画像）
// threshold : 閾値
void binarization(PImage img_in, PImage img_out, int threshold) {

  for (int y=0; y<img_in.height; y++) {
    for (int x=0; x<img_in.width; x++) {
      color c = img_in.get(x, y);

      // 輝度値の計算
      float I = 0.299 * red(c) + 0.587*green(c) + 0.114*blue(c);

      // 閾値を越えていたら
      if ( I > threshold ) {
        img_out.set(x, y, color(255) );  // 白にする
      } else {
        img_out.set(x, y, color(0) );  // 黒にする
      }
    }
  }
}



// 差分処理
// img_fr : 物体が写った画像
// img_bg : 背景画像
// img_out : 結果画像（差分画像）
void subtraction(PImage img_fr, PImage img_bg, PImage img_out) {

  for (int y=0; y<img_fr.height; y++) {
    for (int x=0; x<img_fr.width; x++) {

      color c1 = img_fr.get(x, y);
      color c2 = img_bg.get(x, y);

      float r = abs( red(c1) - red(c2) );
      float g = abs( green(c1) - green(c2) );
      float b = abs( blue(c1) - blue(c2) );

      color c = color(r, g, b);
      img_out.set(x, y, c);
    }
  }
}

void labeling(PImage labelImg, PImage imgDst) {
  color target = color(255, 255, 255);
  int label_array[][] = new int[labelImg.width][labelImg.height];
  int label = 1;
  IntList classifer = new IntList();
  IntList lookUpTable = new IntList();
  lookUpTable.append(0);
  classifer.append(0);
  int count = 0;

  for (int y=0; y<labelImg.height; y++) {
    for (int x=0; x<labelImg.width; x++) {
      label_array[x][y] = 0;
    }
  }
  for (int y=0; y<labelImg.height; y++) {
    for (int x=0; x<labelImg.width; x++) {
      color c = labelImg.get(x, y);
      if (c == target && label_array[x][y] == 0) {
        count++;
        if (x != 0 && y != 0) {
          if (label_array[x-1][y] == 0 && label_array[x][y-1] == 0) {
            label_array[x][y] = label;
            lookUpTable.append(label);
            label++;
          } else if (label_array[x-1][y] != 0 && label_array[x][y-1] == 0) {
            label_array[x][y] = label_array[x-1][y];
          } else if (label_array[x][y-1] != 0) {
            label_array[x][y] = label_array[x][y-1];
            if (label_array[x-1][y] != 0 &&label_array[x][y] != label_array[x-1][y]) {
              if (label_array[x][y] > label_array[x-1][y]) {
                label_array[x][y] = label_array[x-1][y];
                lookUpTable.set(label_array[x][y], label_array[x-1][y]);
              } else if (label_array[x][y] < label_array[x-1][y]) {
                label_array[x][y] = label_array[x][y];
                lookUpTable.set(label_array[x-1][y], label_array[x][y]);
              }
            }
          }
        }
      }
    }
  }
  for (int i=0; i<lookUpTable.size(); i++) {
    int temp;
    while (true) {
      temp = lookUpTable.get(i);
      if (temp == lookUpTable.get(temp)) {
        break;
      } else {
        lookUpTable.set(i, lookUpTable.get(temp));
      }
    }
  }

  for (int i=0; i<lookUpTable.size(); i++) {
    if (i == lookUpTable.get(i)) {
      classifer.append(i);
    }
  }
  //print(classifer);
  for (int y=0; y<labelImg.height; y++) {
    for (int x=0; x<labelImg.width; x++) {
      label_array[x][y] = lookUpTable.get(label_array[x][y]);
    }
  }
  for (int y=0; y<labelImg.height; y++) {
    for (int x=0; x<labelImg.width; x++) {
      //print(label_array[x][y] + ",");
      for (int i=2; i<classifer.size(); i++) {
        if (label_array[x][y] == classifer.get(i)) {
          imgDst.set(x, y, color(0, 0, (255/classifer.size())*i));
        } else if (label_array[x][y] == 0) {
          imgDst.set(x, y, color(0, 0, 0));
        }
      }
    }
    //print(count + ",");
  }
  saveAreaPointMax = new PVector[classifer.size()];
  saveAreaPointMin = new PVector[classifer.size()];
  for (int i=2; i<classifer.size(); i++) {
    int max_x = 0;
    int max_y = 0;
    int min_x = 1000000;
    int min_y = 1000000;
    for (int y=0; y<labelImg.height; y++) {
      for (int x=0; x<labelImg.width; x++) {
        if (label_array[x][y] == classifer.get(i)) {
          if (x > max_x) {
            max_x = x;
          }
          if (y > max_y) {
            max_y = y;
          }
          if (x < min_x) {
            min_x = x;
          }
          if (y < min_y) {
            min_y = y;
          }
        }
      }
    }
    saveAreaPointMax[i] = new PVector(max_x, max_y);
    saveAreaPointMin[i] = new PVector(min_x, min_y);
  }
  //println(saveAreaPointMax);
  //println(saveAreaPointMin);
  //print(lookUpTable);
}