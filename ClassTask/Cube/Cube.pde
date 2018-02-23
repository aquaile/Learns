


//ルービックキューブ
//2014/07/22
//4-43 Fukuchi Tsubasa

//音楽
import ddf.minim.*;
Minim minim;
AudioPlayer bgm;



//立方体の変数
float boxSize = 20;    //立方体のサイズ
float distance1 = 30;    //立方体同士の距離
float distance2 = 60;
float distance3 = 25;
float distance = 30;
float halfDis;    //立方体同士の一辺の全体の距離の半分
float halfDis1;
float halfDis2;
float halfDis3;
int boxNum = 6;    //立方体の数

//立方体のそれぞれのマスの回転量を保存する変数
float [][][] rotX = new float [6][6][6];
float [][][] rotY = new float [6][6][6];
float [][][] rotZ = new float [6][6][6];
float [][][] rotXtemp = new float [6][6][6];
float [][][] rotYtemp = new float [6][6][6];
float [][][] rotZtemp = new float [6][6][6];

/*回転軸の変更と表示の変更をするフラグの設定*/
int cube_w = 0;
int cube_h = 0;
int mode_frag = 0;
int mode_active = 1;

//背景の変数
long  time;  

//particle の変数
final int MAX_PARTICLE = 10;  //  パーティクルの個数
Particle[] p = new Particle[MAX_PARTICLE];

final int LIGHT_FORCE_RATIO = 5;  //  輝き具体の抑制値
final int LIGHT_DISTANCE= 75 * 75;  //  光が届く距離
final int BORDER = 75;  //  光の計算する矩形範囲（高速化のため）

float baseRed, baseGreen, baseBlue;  //  光の色
float baseRedAdd, baseGreenAdd, baseBlueAdd;  //  光の色の加算量
final float RED_ADD = 1.2;    //  赤色の加算値
final float GREEN_ADD = 1.7;  //  緑色の加算値
final float BLUE_ADD = 2.3;   //  青色の加算値

void setup() {
  size(displayWidth, displayHeight, P3D);
//音楽（BGM）追加：ここから→http://dova-s.jp/
  minim = new Minim(this);
  bgm = minim.loadFile("bgm.mp3");
  bgm.loop();
//立方体変数の初期化
  halfDis = distance*(boxNum-1)/2;    //6個並んだ際の距離の半分
  halfDis2 = distance2*(boxNum-1)/2;
  halfDis1 = distance1*(boxNum-1)/2;
  halfDis3 = distance3*(boxNum-1)/2;
  for (int i=0; i<6; i++) {
    for (int j=0; j<6; j++) {
      for (int n=0; n<2; n++) {
        rotX[i][j][n] = 0;
        rotY[i][j][n] = 0;
        rotZ[i][j][n] = 0;
      }
    }
  }
  cursor(CROSS);

  //  パーティクルの初期化
  for (int i = 0; i < MAX_PARTICLE; i++) {
    p[i] = new Particle();
  }

  //  光の色の初期化
  baseRed = 0;
  baseRedAdd = RED_ADD;

  baseGreen = 0;
  baseGreenAdd = GREEN_ADD;

  baseBlue = 0;
  baseBlueAdd = BLUE_ADD;
}

void draw() {
  if (mode_active==1) {
  }
  if (mode_active==1&&frameCount%2==0) {
    if (distance1<100) {
      distance1 += 5;
    }

    boxSize = random(15, 25);
    distance3 = boxSize + 5;


    halfDis1 = distance1*(boxNum-1)/2;
    halfDis3 = distance3*(boxNum-1)/2;
  } else if (mode_active==0&&frameCount%2==0||mode_active==2&&frameCount%2==0) {
    if (distance1>=30) {
      distance1 -= 5;
    }

    boxSize = 20;
    distance3 = boxSize + 5;

    halfDis1 = distance1*(boxNum-1)/2;
    halfDis3 = distance3*(boxNum-1)/2;
  }
//パーティクルの詳細設定
  lights();
  ambientLight(63, 31, 31);
  directionalLight(255, 255, 255, -1, 0, 0);
  pointLight(63, 127, 255, mouseX, mouseY, 200);
  spotLight(100, 100, 100, mouseX, mouseY, 200, 0, 0, -1, PI, 2);
  pushMatrix();
//原点を真ん中に持ってくる
  translate(width/2, height/2);
  rotateY(radians(mouseX));
  rotateX(radians(mouseY));
  noFill();
  box(width, height, -700);
  popMatrix();
  stroke(255, 0, 0, 100);
  line(width/2, 0, width/2, height);
  line(0, height/2, width, height/2);

  translate(width/2, height/2);    //立体の中心を画面中央に移動 
  drawBingo();  
  rotateY(radians(mouseX));
  rotateX(radians(mouseY));

  stroke(0);
  fill(255, 255, 255);
//ルービックキューブを描く
  drawBox(boxSize, distance3, halfDis3, boxNum, mode_active);
  drawSquare(boxSize, distance1, halfDis1, boxNum);
  drawPoint(boxSize, distance, halfDis, boxNum, mode_active);
  drawPoint(boxSize, distance2, halfDis2, boxNum, mode_active);
  drawParticle();
//立体をテンポよく動かす
  if (frameCount%3==0) {
    distance2 = distance2 + 3;
    halfDis2 = distance2*(boxNum-1)/2;
    if (distance2>=75) {
      distance2 = 60;
      halfDis2 = distance2*(boxNum-1)/2;
    }
  }
  if (frameCount%3==0) {
    distance = distance + 2;
    halfDis = distance*(boxNum-1)/2;
    if (distance>=40) {
      distance = 30;
      halfDis = distance*(boxNum-1)/2;
    }
  }
}
//キー操作の詳細設定
void keyPressed() {
  switch(keyCode) {
    //回したいブロックの選択
  case UP:
    cube_w++;
    if (cube_w>=3) {
      cube_w = 2;
    }
    break;

  case RIGHT:
    cube_h++;
    if (cube_h>=3) {
      cube_h = 2;
    }
    break;

  case LEFT:
    cube_h--;
    if (cube_h<0) {

      cube_h = 0;
    }
    break;

  case DOWN:
    cube_w--;
    if (cube_w<0) {
      cube_w = 0;
    }
    break;
    //ブロックを回す
  case ENTER:
    if (mode_frag==0) {
      //rotateX();
      if (cube_w==0) {
        for (int i=0; i<2; i++) {
          for (int j=0; j<6; j++) {

            rotY[i][j][0]+=0.1;
            rotY[i][j][3]+=0.1;
          }
        }
        for (int i=0; i<6; i++) {
          for (int j=0; j<2; j++) {
            rotY[i][j][1]+=0.1;
            rotY[i][j][4]+=0.1;
          }
        }
        for (int i=0; i<6; i++) {
          for (int j=0; j<6; j++) {
            rotY[i][j][2]+=0.1;
          }
        }
      }
      if (cube_w==1) {
        for (int i=2; i<4; i++) {
          for (int j=0; j<6; j++) {
            rotY[i][j][0]+=0.1;
            rotY[i][j][3]+=0.1;
          }
        }
        for (int i=0; i<6; i++) {
          for (int j=2; j<4; j++) {
            rotY[i][j][1]+=0.1;
            rotY[i][j][4]+=0.1;
          }
        }
      }
      if (cube_w==2) {
        for (int i=4; i<6; i++) {
          for (int j=0; j<6; j++) {
            rotY[i][j][0]+=0.1;
            rotY[i][j][3]+=0.1;
          }
        }
        for (int i=0; i<6; i++) {
          for (int j=4; j<6; j++) {
            rotY[i][j][1]+=0.1;
            rotY[i][j][4]+=0.1;
          }
        }
        for (int i=0; i<6; i++) {
          for (int j=0; j<6; j++) {
            rotY[i][j][5]+=0.1;
          }
        }
      }
    } else if (mode_frag==1) {
      //rotateY();
      if (cube_h==0) {
        for (int i=0; i<6; i++) {
          for (int j=0; j<6; j++) {

            rotX[i][j][0]+=0.1;
          }
        }
        for (int i=0; i<2; i++) {
          for (int j=0; j<6; j++) {
            rotX[i][j][1]+=0.1;
            rotX[i][j][4]+=0.1;
          }
        }
        for (int i=0; i<2; i++) {
          for (int j=0; j<6; j++) {
            rotX[i][j][2]+=0.1;
            rotX[i][j][5]+=0.1;
          }
        }
      }
      if (cube_h==1) {
        for (int i=2; i<4; i++) {
          for (int j=0; j<6; j++) {
            rotX[i][j][1]+=0.1;
            rotX[i][j][4]+=0.1;
          }
        }
        for (int i=2; i<4; i++) {
          for (int j=0; j<6; j++) {
            rotX[i][j][2]+=0.1;
            rotX[i][j][5]+=0.1;
          }
        }
      }
      if (cube_h==2) {
        for (int i=0; i<6; i++) {
          for (int j=0; j<6; j++) {

            rotX[i][j][3]+=0.1;
          }
        }
        for (int i=4; i<6; i++) {
          for (int j=0; j<6; j++) {
            rotX[i][j][1]+=0.1;
            rotX[i][j][4]+=0.1;
          }
        }
        for (int i=4; i<6; i++) {
          for (int j=0; j<6; j++) {
            rotX[i][j][2]+=0.1;
            rotX[i][j][5]+=0.1;
          }
        }
      }
    } else if (mode_frag==2) {
      //rotateZ();
      if (cube_h==0) {
        for (int i=0; i<6; i++) {
          for (int j=0; j<6; j++) {

            rotZ[i][j][1]+=0.1;
          }
        }
        for (int i=0; i<6; i++) {
          for (int j=0; j<2; j++) {
            rotZ[i][j][0]+=0.1;
            rotZ[i][j][3]+=0.1;
          }
        }
        for (int i=0; i<6; i++) {
          for (int j=0; j<2; j++) {
            rotZ[i][j][2]+=0.1;
            rotZ[i][j][5]+=0.1;
          }
        }
      }
      if (cube_h==1) {
        for (int i=0; i<6; i++) {
          for (int j=2; j<4; j++) {
            rotZ[i][j][0]+=0.1;
            rotZ[i][j][3]+=0.1;
          }
        }
        for (int i=0; i<6; i++) {
          for (int j=2; j<4; j++) {
            rotZ[i][j][2]+=0.1;
            rotZ[i][j][5]+=0.1;
          }
        }
      }
      if (cube_h==2) {
        for (int i=0; i<6; i++) {
          for (int j=0; j<6; j++) {

            rotZ[i][j][4]+=0.1;
          }
        }
        for (int i=0; i<6; i++) {
          for (int j=4; j<6; j++) {
            rotZ[i][j][0]+=0.1;
            rotZ[i][j][3]+=0.1;
          }
        }
        for (int i=0; i<6; i++) {
          for (int j=4; j<6; j++) {
            rotZ[i][j][2]+=0.1;
            rotZ[i][j][5]+=0.1;
          }
        }
      }
    }
    break;

  case BACKSPACE:
    if (mode_frag==0) {
      //rotateX();
      if (cube_w==0) {
        for (int i=0; i<2; i++) {
          for (int j=0; j<6; j++) {

            rotY[i][j][0]-=0.1;
            rotY[i][j][3]-=0.1;
          }
        }
        for (int i=0; i<6; i++) {
          for (int j=0; j<2; j++) {
            rotY[i][j][1]-=0.1;
            rotY[i][j][4]-=0.1;
          }
        }
        for (int i=0; i<6; i++) {
          for (int j=0; j<6; j++) {
            rotY[i][j][2]-=0.1;
          }
        }
      }
      if (cube_w==1) {
        for (int i=2; i<4; i++) {
          for (int j=0; j<6; j++) {
            rotY[i][j][0]-=0.1;
            rotY[i][j][3]-=0.1;
          }
        }
        for (int i=0; i<6; i++) {
          for (int j=2; j<4; j++) {
            rotY[i][j][1]-=0.1;
            rotY[i][j][4]-=0.1;
          }
        }
      }
      if (cube_w==2) {
        for (int i=4; i<6; i++) {
          for (int j=0; j<6; j++) {
            rotY[i][j][0]-=0.1;
            rotY[i][j][3]-=0.1;
          }
        }
        for (int i=0; i<6; i++) {
          for (int j=4; j<6; j++) {
            rotY[i][j][1]-=0.1;
            rotY[i][j][4]-=0.1;
          }
        }
        for (int i=0; i<6; i++) {
          for (int j=0; j<6; j++) {
            rotY[i][j][5]-=0.1;
          }
        }
      }
    } else if (mode_frag==1) {
      //rotateY();
      if (cube_h==0) {
        for (int i=0; i<6; i++) {
          for (int j=0; j<6; j++) {

            rotX[i][j][0]-=0.1;
          }
        }
        for (int i=0; i<2; i++) {
          for (int j=0; j<6; j++) {
            rotX[i][j][1]-=0.1;
            rotX[i][j][4]-=0.1;
          }
        }
        for (int i=0; i<2; i++) {
          for (int j=0; j<6; j++) {
            rotX[i][j][2]-=0.1;
            rotX[i][j][5]-=0.1;
          }
        }
      }
      if (cube_h==1) {
        for (int i=2; i<4; i++) {
          for (int j=0; j<6; j++) {
            rotX[i][j][1]-=0.1;
            rotX[i][j][4]-=0.1;
          }
        }
        for (int i=2; i<4; i++) {
          for (int j=0; j<6; j++) {
            rotX[i][j][2]-=0.1;
            rotX[i][j][5]-=0.1;
          }
        }
      }
      if (cube_h==2) {
        for (int i=0; i<6; i++) {
          for (int j=0; j<6; j++) {

            rotX[i][j][3]-=0.1;
          }
        }
        for (int i=4; i<6; i++) {
          for (int j=0; j<6; j++) {
            rotX[i][j][1]-=0.1;
            rotX[i][j][4]-=0.1;
          }
        }
        for (int i=4; i<6; i++) {
          for (int j=0; j<6; j++) {
            rotX[i][j][2]-=0.1;
            rotX[i][j][5]-=0.1;
          }
        }
      }
    } else if (mode_frag==2) {
      //rotateZ();
      if (cube_h==0) {
        for (int i=0; i<6; i++) {
          for (int j=0; j<6; j++) {

            rotZ[i][j][1]-=0.1;
          }
        }
        for (int i=0; i<6; i++) {
          for (int j=0; j<2; j++) {
            rotZ[i][j][0]-=0.1;
            rotZ[i][j][3]-=0.1;
          }
        }
        for (int i=0; i<6; i++) {
          for (int j=0; j<2; j++) {
            rotZ[i][j][2]-=0.1;
            rotZ[i][j][5]-=0.1;
          }
        }
      }
      if (cube_h==1) {
        for (int i=0; i<6; i++) {
          for (int j=2; j<4; j++) {
            rotZ[i][j][0]-=0.1;
            rotZ[i][j][3]-=0.1;
          }
        }
        for (int i=0; i<6; i++) {
          for (int j=2; j<4; j++) {
            rotZ[i][j][2]-=0.1;
            rotZ[i][j][5]-=0.1;
          }
        }
      }
      if (cube_h==2) {
        for (int i=0; i<6; i++) {
          for (int j=0; j<6; j++) {

            rotZ[i][j][4]-=0.1;
          }
        }
        for (int i=0; i<6; i++) {
          for (int j=4; j<6; j++) {
            rotZ[i][j][0]-=0.1;
            rotZ[i][j][3]-=0.1;
          }
        }
        for (int i=0; i<6; i++) {
          for (int j=4; j<6; j++) {
            rotZ[i][j][2]-=0.1;
            rotZ[i][j][5]-=0.1;
          }
        }
      }
    }
    break;
//回転軸の変更
  case CONTROL:
    if (mode_frag==0) {
      mode_frag = 1;
    } else if (mode_frag==1) {
      mode_frag = 2;
    } else if (mode_frag==2) {
      mode_frag = 0;
    }
    break;
//表示の変更
  case TAB:
    if (mode_active==1) {
      mode_active = 0;
    } else if (mode_active==0) {
      mode_active = 2;
    } else if (mode_active==2) {
      mode_active = 0;
    }

    break;

  case SHIFT:
    for (int x=0; x<6; x++) {
      for (int y=0; y<6; y++) {
        for (int z=0; z<6; z++) {
          rotX[x][y][z] = 0;
          rotY[x][y][z] = 0;
          rotZ[x][y][z] = 0;
        }
      }
    }
    break;


  default:
    break;
  }
}
//音楽ストップ
void stop() {
  bgm.close();
  minim.stop();
  super.stop();
}
