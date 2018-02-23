//ルービックキューブの面を描く関数
void drawSquare(float boxSize, float distance, float halfDis, int boxNum) {

  stroke(0);
  fill(255, 255, 255);

//赤い面の作成
  if (mode_active==2) {
    for (int x=0; x<boxNum; x++) {
      for (int y=0; y<boxNum; y++) {
        stroke(255, 100, 100);
        pushMatrix();
        rotateX(rotX[x][y][1]);
        rotateY(rotY[x][y][1]);
        rotateZ(rotZ[x][y][1]);
        translate(x*distance-halfDis, y*distance-halfDis, -1*distance-halfDis);
        if (x==4||x>=1&&x<=4&&y==0||x>=1&&x<=3&&y==3) {
          fill(0, 0, 55);
        } else {
          fill(255, 0, 0);
        }
        box(boxSize, boxSize, boxSize*0.5);    //20 x 20 x 20pxの立方体を描く
        popMatrix();
      }
    }
  } else {
    for (int x=0; x<2; x++) {
      for (int y=0; y<2; y++) {
        stroke(255, 100, 100);
        pushMatrix();
        rotateX(rotX[x][y][1]);
        rotateY(rotY[x][y][1]);
        rotateZ(rotZ[x][y][1]);
        translate(x*distance-halfDis, y*distance-halfDis, -1*distance-halfDis);
        if (mode_frag==0&&cube_w==0) {
          fill(70, 0, 0);
        } else if (mode_frag==1&&cube_h==0) {
          fill(70, 0, 0);
        } else {
          fill(255, 0, 0);
        }
        box(boxSize, boxSize, boxSize*0.5);    //20 x 20 x 20pxの立方体を描く
        popMatrix();
      }
    }

    for (int x=0; x<2; x++) {
      for (int y=2; y<4; y++) {
        pushMatrix();
        rotateX(rotX[x][y][1]);
        rotateY(rotY[x][y][1]);
        rotateZ(rotZ[x][y][1]);
        translate(x*distance-halfDis, y*distance-halfDis, -1*distance-halfDis);
        if (mode_frag==0&&cube_w==1) {
          fill(70, 0, 0);
        } else if (mode_frag==1&&cube_h==0) {
          fill(70, 0, 0);
        } else {
          fill(255, 0, 0);
        }
        box(boxSize, boxSize, boxSize*0.5);    //20 x 20 x 20pxの立方体を描く
        popMatrix();
      }
    }

    for (int x=0; x<2; x++) {
      for (int y=4; y<6; y++) {
        pushMatrix();
        rotateX(rotX[x][y][1]);
        rotateY(rotY[x][y][1]);
        rotateZ(rotZ[x][y][1]);
        translate(x*distance-halfDis, y*distance-halfDis, -1*distance-halfDis);
        if (mode_frag==0&&cube_w==2) {
          fill(70, 0, 0);
        } else if (mode_frag==1&&cube_h==0) {
          fill(70, 0, 0);
        } else {
          fill(255, 0, 0);
        }
        box(boxSize, boxSize, boxSize*0.5);    //20 x 20 x 20pxの立方体を描く
        popMatrix();
      }
    }

    for (int x=2; x<4; x++) {
      for (int y=0; y<2; y++) {
        pushMatrix();
        rotateX(rotX[x][y][1]);
        rotateY(rotY[x][y][1]);
        rotateZ(rotZ[x][y][1]);
        translate(x*distance-halfDis, y*distance-halfDis, -1*distance-halfDis);
        if (mode_frag==0&&cube_w==0) {
          fill(70, 0, 0);
        } else if (mode_frag==1&&cube_h==1) {
          fill(70, 0, 0);
        } else {
          fill(255, 0, 0);
        }
        box(boxSize, boxSize, boxSize*0.5);    //20 x 20 x 20pxの立方体を描く
        popMatrix();
      }
    }

    for (int x=2; x<4; x++) {
      for (int y=2; y<4; y++) {
        pushMatrix();
        rotateX(rotX[x][y][1]);
        rotateY(rotY[x][y][1]);
        rotateZ(rotZ[x][y][1]);
        translate(x*distance-halfDis, y*distance-halfDis, -1*distance-halfDis);
        if (mode_frag==0&&cube_w==1) {
          fill(70, 0, 0);
        } else if (mode_frag==1&&cube_h==1) {
          fill(70, 0, 0);
        } else {
          fill(255, 0, 0);
        }
        box(boxSize, boxSize, boxSize*0.5);    //20 x 20 x 20pxの立方体を描く
        popMatrix();
      }
    }

    for (int x=2; x<4; x++) {
      for (int y=4; y<6; y++) {
        pushMatrix();
        rotateX(rotX[x][y][1]);
        rotateY(rotY[x][y][1]);
        rotateZ(rotZ[x][y][1]);
        translate(x*distance-halfDis, y*distance-halfDis, -1*distance-halfDis);
        if (mode_frag==0&&cube_w==2) {
          fill(70, 0, 0);
        } else if (mode_frag==1&&cube_h==1) {
          fill(70, 0, 0);
        } else {
          fill(255, 0, 0);
        }
        box(boxSize, boxSize, boxSize*0.5);    //20 x 20 x 20pxの立方体を描く
        popMatrix();
      }
    }

    for (int x=4; x<6; x++) {
      for (int y=0; y<2; y++) {
        pushMatrix();
        rotateX(rotX[x][y][1]);
        rotateY(rotY[x][y][1]);
        rotateZ(rotZ[x][y][1]);
        translate(x*distance-halfDis, y*distance-halfDis, -1*distance-halfDis);
        if (mode_frag==0&&cube_w==0) {
          fill(70, 0, 0);
        } else if (mode_frag==1&&cube_h==2) {
          fill(70, 0, 0);
        } else {
          fill(255, 0, 0);
        }
        box(boxSize, boxSize, boxSize*0.5);    //20 x 20 x 20pxの立方体を描く
        popMatrix();
      }
    }

    for (int x=4; x<6; x++) {
      for (int y=2; y<4; y++) {
        pushMatrix();
        rotateX(rotX[x][y][1]);
        rotateY(rotY[x][y][1]);
        rotateZ(rotZ[x][y][1]);
        translate(x*distance-halfDis, y*distance-halfDis, -1*distance-halfDis);
        if (mode_frag==0&&cube_w==1) {
          fill(70, 0, 0);
        } else if (mode_frag==1&&cube_h==2) {
          fill(70, 0, 0);
        } else {
          fill(255, 0, 0);
        }
        box(boxSize, boxSize, boxSize*0.5);    //20 x 20 x 20pxの立方体を描く
        popMatrix();
      }
    }

    for (int x=4; x<6; x++) {
      for (int y=4; y<6; y++) {
        pushMatrix();
        rotateX(rotX[x][y][1]);
        rotateY(rotY[x][y][1]);
        rotateZ(rotZ[x][y][1]);
        translate(x*distance-halfDis, y*distance-halfDis, -1*distance-halfDis);
        if (mode_frag==0&&cube_w==2) {
          fill(70, 0, 0);
        } else if (mode_frag==1&&cube_h==2) {
          fill(70, 0, 0);
        } else {
          fill(255, 0, 0);
        }
        box(boxSize, boxSize, boxSize*0.5);    //20 x 20 x 20pxの立方体を描く
        popMatrix();
      }
    }
  }


//青い面の作成
  if (mode_active==2) {
    for (int x=0; x<boxNum; x++) {
      for (int y=0; y<boxNum; y++) {
        stroke(255, 100, 100);
        pushMatrix();
        rotateX(rotX[x][y][1]);
        rotateY(rotY[x][y][1]);
        rotateZ(rotZ[x][y][1]);
        translate(x*distance-halfDis, y*distance-halfDis, 6*distance-halfDis);
        if (x==4||x>=1&&x<=4&&y==5||x>=1&&x<=4&&y==2) {
          fill(55, 0, 0);
        } else {
          fill(0, 0, 255);
        }
        box(boxSize, boxSize, boxSize*0.5);    //20 x 20 x 20pxの立方体を描く
        popMatrix();
      }
    }
  } else {
    for (int x=0; x<2; x++) {
      for (int y=0; y<2; y++) {
        pushMatrix();
        rotateX(rotX[x][y][4]);
        rotateY(rotY[x][y][4]);
        rotateZ(rotZ[x][y][4]);
        translate(x*distance-halfDis, y*distance-halfDis, 6*distance-halfDis);
        if (mode_frag==0&&cube_w==0) {
          fill(0, 0, 70);
        } else if (mode_frag==1&&cube_h==0) {
          fill(0, 0, 70);
        } else {
          fill(0, 0, 255);
        }
        box(boxSize, boxSize, boxSize*0.5);    //20 x 20 x 20pxの立方体を描く
        popMatrix();
      }
    }

    for (int x=0; x<2; x++) {
      for (int y=2; y<4; y++) {
        pushMatrix();
        rotateX(rotX[x][y][4]);
        rotateY(rotY[x][y][4]);
        rotateZ(rotZ[x][y][4]);
        translate(x*distance-halfDis, y*distance-halfDis, 6*distance-halfDis);
        if (mode_frag==0&&cube_w==1) {
          fill(0, 0, 70);
        } else if (mode_frag==1&&cube_h==0) {
          fill(0, 0, 70);
        } else {
          fill(0, 0, 255);
        }
        box(boxSize, boxSize, boxSize*0.5);    //20 x 20 x 20pxの立方体を描く
        popMatrix();
      }
    }

    for (int x=0; x<2; x++) {
      for (int y=4; y<6; y++) {
        pushMatrix();
        rotateX(rotX[x][y][4]);
        rotateY(rotY[x][y][4]);
        rotateZ(rotZ[x][y][4]);
        translate(x*distance-halfDis, y*distance-halfDis, 6*distance-halfDis);
        if (mode_frag==0&&cube_w==2) {
          fill(0, 0, 70);
        } else if (mode_frag==1&&cube_h==0) {
          fill(0, 0, 70);
        } else {
          fill(0, 0, 255);
        }
        box(boxSize, boxSize, boxSize*0.5);    //20 x 20 x 20pxの立方体を描く
        popMatrix();
      }
    }

    for (int x=2; x<4; x++) {
      for (int y=0; y<2; y++) {
        pushMatrix();
        rotateX(rotX[x][y][4]);
        rotateY(rotY[x][y][4]);
        rotateZ(rotZ[x][y][4]);
        translate(x*distance-halfDis, y*distance-halfDis, 6*distance-halfDis);
        if (mode_frag==0&&cube_w==0) {
          fill(0, 0, 70);
        } else if (mode_frag==1&&cube_h==1) {
          fill(0, 0, 70);
        } else {
          fill(0, 0, 255);
        }
        box(boxSize, boxSize, boxSize*0.5);    //20 x 20 x 20pxの立方体を描く
        popMatrix();
      }
    }

    for (int x=2; x<4; x++) {
      for (int y=2; y<4; y++) {
        pushMatrix();
        rotateX(rotX[x][y][4]);
        rotateY(rotY[x][y][4]);
        rotateZ(rotZ[x][y][4]);
        translate(x*distance-halfDis, y*distance-halfDis, 6*distance-halfDis);
        if (mode_frag==0&&cube_w==1) {
          fill(0, 0, 70);
        } else if (mode_frag==1&&cube_h==1) {
          fill(0, 0, 70);
        } else {
          fill(0, 0, 255);
        }
        box(boxSize, boxSize, boxSize*0.5);    //20 x 20 x 20pxの立方体を描く
        popMatrix();
      }
    }

    for (int x=2; x<4; x++) {
      for (int y=4; y<6; y++) {
        pushMatrix();
        rotateX(rotX[x][y][4]);
        rotateY(rotY[x][y][4]);
        rotateZ(rotZ[x][y][4]);
        translate(x*distance-halfDis, y*distance-halfDis, 6*distance-halfDis);
        if (mode_frag==0&&cube_w==2) {
          fill(0, 0, 70);
        } else if (mode_frag==1&&cube_h==1) {
          fill(0, 0, 70);
        } else {
          fill(0, 0, 255);
        }
        box(boxSize, boxSize, boxSize*0.5);    //20 x 20 x 20pxの立方体を描く
        popMatrix();
      }
    }

    for (int x=4; x<6; x++) {
      for (int y=0; y<2; y++) {
        pushMatrix();
        rotateX(rotX[x][y][4]);
        rotateY(rotY[x][y][4]);
        rotateZ(rotZ[x][y][4]);
        translate(x*distance-halfDis, y*distance-halfDis, 6*distance-halfDis);
        if (mode_frag==0&&cube_w==0) {
          fill(0, 0, 70);
        } else if (mode_frag==1&&cube_h==2) {
          fill(0, 0, 70);
        } else {
          fill(0, 0, 255);
        }
        box(boxSize, boxSize, boxSize*0.5);    //20 x 20 x 20pxの立方体を描く
        popMatrix();
      }
    }

    for (int x=4; x<6; x++) {
      for (int y=2; y<4; y++) {
        pushMatrix();
        rotateX(rotX[x][y][4]);
        rotateY(rotY[x][y][4]);
        rotateZ(rotZ[x][y][4]);
        translate(x*distance-halfDis, y*distance-halfDis, 6*distance-halfDis);
        if (mode_frag==0&&cube_w==1) {
          fill(0, 0, 70);
        } else if (mode_frag==1&&cube_h==2) {
          fill(0, 0, 70);
        } else {
          fill(0, 0, 255);
        }
        box(boxSize, boxSize, boxSize*0.5);    //20 x 20 x 20pxの立方体を描く
        popMatrix();
      }
    }

    for (int x=4; x<6; x++) {
      for (int y=4; y<6; y++) {
        pushMatrix();
        rotateX(rotX[x][y][4]);
        rotateY(rotY[x][y][4]);
        rotateZ(rotZ[x][y][4]);
        translate(x*distance-halfDis, y*distance-halfDis, 6*distance-halfDis);
        if (mode_frag==0&&cube_w==2) {
          fill(0, 0, 70);
        } else if (mode_frag==1&&cube_h==2) {
          fill(0, 0, 70);
        } else {
          fill(0, 0, 255);
        }
        box(boxSize, boxSize, boxSize*0.5);    //20 x 20 x 20pxの立方体を描く
        popMatrix();
      }
    }
  }
//緑い面の作成
  if (mode_active==2) {
    for (int x=0; x<boxNum; x++) {
      for (int z=0; z<boxNum; z++) {
        stroke(255, 100, 100);
        pushMatrix();
        rotateX(rotX[x][z][2]);
        rotateY(rotY[x][z][2]);
        rotateZ(rotZ[x][z][2]);
        translate(x*distance-halfDis, -1*distance-halfDis, z*distance-halfDis);
        if (x==5||x==0||x==1&&z==4||x==2&&z==2||x==4&&z==4||x==2&&z==3||x==3&&z==3||x==3&&z==2) {
          fill(55, 55, 0);
        } else {
          fill(0, 255, 0);
        }
        box(boxSize, boxSize*0.5, boxSize);    //20 x 20 x 20pxの立方体を描く
        popMatrix();
      }
    }
  } else {
    for (int x=0; x<2; x++) {
      for (int z=0; z<2; z++) {
        pushMatrix();
        rotateX(rotX[x][z][2]);
        rotateY(rotY[x][z][2]);
        rotateZ(rotZ[x][z][2]);
        translate(x*distance-halfDis, -1*distance-halfDis, z*distance-halfDis);
        if (mode_frag==1&&cube_h==0) {
          fill(0, 70, 0);
        } else if (mode_frag==2&&cube_h==0) {
          fill(0, 70, 0);
        } else {
          fill(0, 255, 0);
        }
        box(boxSize, boxSize*0.5, boxSize);    //20 x 20 x 20pxの立方体を描く
        popMatrix();
      }
    }

    for (int x=0; x<2; x++) {
      for (int z=2; z<4; z++) {
        pushMatrix();
        rotateX(rotX[x][z][2]);
        rotateY(rotY[x][z][2]);
        rotateZ(rotZ[x][z][2]);
        translate(x*distance-halfDis, -1*distance-halfDis, z*distance-halfDis);
        if (mode_frag==1&&cube_h==0) {
          fill(0, 70, 0);
        } else if (mode_frag==2&&cube_h==1) {
          fill(0, 70, 0);
        } else {
          fill(0, 255, 0);
        }
        box(boxSize, boxSize*0.5, boxSize);    //20 x 20 x 20pxの立方体を描く
        popMatrix();
      }
    }

    for (int x=0; x<2; x++) {
      for (int z=4; z<6; z++) {
        pushMatrix();
        rotateX(rotX[x][z][2]);
        rotateY(rotY[x][z][2]);
        rotateZ(rotZ[x][z][2]);
        translate(x*distance-halfDis, -1*distance-halfDis, z*distance-halfDis);
        if (mode_frag==1&&cube_h==0) {
          fill(0, 70, 0);
        } else if (mode_frag==2&&cube_h==2) {
          fill(0, 70, 0);
        } else {
          fill(0, 255, 0);
        }
        box(boxSize, boxSize*0.5, boxSize);    //20 x 20 x 20pxの立方体を描く
        popMatrix();
      }
    }

    for (int x=2; x<4; x++) {
      for (int z=0; z<2; z++) {
        pushMatrix();
        rotateX(rotX[x][z][2]);
        rotateY(rotY[x][z][2]);
        rotateZ(rotZ[x][z][2]);
        translate(x*distance-halfDis, -1*distance-halfDis, z*distance-halfDis);
        if (mode_frag==1&&cube_h==1) {
          fill(0, 70, 0);
        } else if (mode_frag==2&&cube_h==0) {
          fill(0, 70, 0);
        } else {
          fill(0, 255, 0);
        }
        box(boxSize, boxSize*0.5, boxSize);    //20 x 20 x 20pxの立方体を描く
        popMatrix();
      }
    }

    for (int x=2; x<4; x++) {
      for (int z=2; z<4; z++) {
        pushMatrix();
        rotateX(rotX[x][z][2]);
        rotateY(rotY[x][z][2]);
        rotateZ(rotZ[x][z][2]);
        translate(x*distance-halfDis, -1*distance-halfDis, z*distance-halfDis);
        if (mode_frag==1&&cube_h==1) {
          fill(0, 70, 0);
        } else if (mode_frag==2&&cube_h==1) {
          fill(0, 70, 0);
        } else {
          fill(0, 255, 0);
        }
        box(boxSize, boxSize*0.5, boxSize);    //20 x 20 x 20pxの立方体を描く
        popMatrix();
      }
    }

    for (int x=2; x<4; x++) {
      for (int z=4; z<6; z++) {
        pushMatrix();
        rotateX(rotX[x][z][2]);
        rotateY(rotY[x][z][2]);
        rotateZ(rotZ[x][z][2]);
        translate(x*distance-halfDis, -1*distance-halfDis, z*distance-halfDis);
        if (mode_frag==1&&cube_h==1) {
          fill(0, 70, 0);
        } else if (mode_frag==2&&cube_h==2) {
          fill(0, 70, 0);
        } else {
          fill(0, 255, 0);
        }
        box(boxSize, boxSize*0.5, boxSize);    //20 x 20 x 20pxの立方体を描く
        popMatrix();
      }
    }

    for (int x=4; x<6; x++) {
      for (int z=0; z<2; z++) {
        pushMatrix();
        rotateX(rotX[x][z][2]);
        rotateY(rotY[x][z][2]);
        rotateZ(rotZ[x][z][2]);
        translate(x*distance-halfDis, -1*distance-halfDis, z*distance-halfDis);
        if (mode_frag==1&&cube_h==2) {
          fill(0, 70, 0);
        } else if (mode_frag==2&&cube_h==0) {
          fill(0, 70, 0);
        } else {
          fill(0, 255, 0);
        }
        box(boxSize, boxSize*0.5, boxSize);    //20 x 20 x 20pxの立方体を描く
        popMatrix();
      }
    }

    for (int x=4; x<6; x++) {
      for (int z=2; z<4; z++) {
        pushMatrix();
        rotateX(rotX[x][z][2]);
        rotateY(rotY[x][z][2]);
        rotateZ(rotZ[x][z][2]);
        translate(x*distance-halfDis, -1*distance-halfDis, z*distance-halfDis);
        if (mode_frag==1&&cube_h==2) {
          fill(0, 70, 0);
        } else if (mode_frag==2&&cube_h==1) {
          fill(0, 70, 0);
        } else {
          fill(0, 255, 0);
        }
        box(boxSize, boxSize*0.5, boxSize);    //20 x 20 x 20pxの立方体を描く
        popMatrix();
      }
    }

    for (int x=4; x<6; x++) {
      for (int z=4; z<6; z++) {
        pushMatrix();
        rotateX(rotX[x][z][2]);
        rotateY(rotY[x][z][2]);
        rotateZ(rotZ[x][z][2]);
        translate(x*distance-halfDis, -1*distance-halfDis, z*distance-halfDis);
        if (mode_frag==1&&cube_h==2) {
          fill(0, 70, 0);
        } else if (mode_frag==2&&cube_h==2) {
          fill(0, 70, 0);
        } else {
          fill(0, 255, 0);
        }
        box(boxSize, boxSize*0.5, boxSize);    //20 x 20 x 20pxの立方体を描く
        popMatrix();
      }
    }
  }

//黄い面の作成
  if (mode_active==2) {
    for (int x=0; x<boxNum; x++) {
      for (int z=0; z<boxNum; z++) {
        stroke(255, 100, 100);
        pushMatrix();
        rotateX(rotX[x][z][2]);
        rotateY(rotY[x][z][2]);
        rotateZ(rotZ[x][z][2]);
        translate(x*distance-halfDis, 6*distance-halfDis, z*distance-halfDis);
        if (x==5||x==0||x==1&&z==1||x==2&&z==2||x==4&&z==1||x==2&&z==3||x==3&&z==3||x==3&&z==2) {
          fill(0, 55, 0);
        } else {
          fill(255, 255, 0);
        }
        box(boxSize, boxSize*0.5, boxSize);    //20 x 20 x 20pxの立方体を描く
        popMatrix();
      }
    }
  } else {
    for (int x=0; x<2; x++) {
      for (int z=0; z<2; z++) {
        pushMatrix();
        rotateX(rotX[x][z][5]);
        rotateY(rotY[x][z][5]);
        rotateZ(rotZ[x][z][5]);
        translate(x*distance-halfDis, 6*distance-halfDis, z*distance-halfDis);
        if (mode_frag==1&&cube_h==0) {
          fill(70, 70, 0);
        } else if (mode_frag==2&&cube_h==0) {
          fill(70, 70, 0);
        } else {
          fill(255, 255, 0);
        }
        box(boxSize, boxSize*0.5, boxSize);    //20 x 20 x 20pxの立方体を描く
        popMatrix();
      }
    }

    for (int x=0; x<2; x++) {
      for (int z=2; z<4; z++) {
        pushMatrix();
        rotateX(rotX[x][z][5]);
        rotateY(rotY[x][z][5]);
        rotateZ(rotZ[x][z][5]);
        translate(x*distance-halfDis, 6*distance-halfDis, z*distance-halfDis);
        if (mode_frag==1&&cube_h==0) {
          fill(70, 70, 0);
        } else if (mode_frag==2&&cube_h==1) {
          fill(70, 70, 0);
        } else {
          fill(255, 255, 0);
        }
        box(boxSize, boxSize*0.5, boxSize);    //20 x 20 x 20pxの立方体を描く
        popMatrix();
      }
    }

    for (int x=0; x<2; x++) {
      for (int z=4; z<6; z++) {
        pushMatrix();
        rotateX(rotX[x][z][5]);
        rotateY(rotY[x][z][5]);
        rotateZ(rotZ[x][z][5]);
        translate(x*distance-halfDis, 6*distance-halfDis, z*distance-halfDis);
        if (mode_frag==1&&cube_h==0) {
          fill(70, 70, 0);
        } else if (mode_frag==2&&cube_h==2) {
          fill(70, 70, 0);
        } else {
          fill(255, 255, 0);
        }
        box(boxSize, boxSize*0.5, boxSize);    //20 x 20 x 20pxの立方体を描く
        popMatrix();
      }
    }

    for (int x=2; x<4; x++) {
      for (int z=0; z<2; z++) {
        pushMatrix();
        rotateX(rotX[x][z][5]);
        rotateY(rotY[x][z][5]);
        rotateZ(rotZ[x][z][5]);
        translate(x*distance-halfDis, 6*distance-halfDis, z*distance-halfDis);
        if (mode_frag==1&&cube_h==1) {
          fill(70, 70, 0);
        } else if (mode_frag==2&&cube_h==0) {
          fill(70, 70, 0);
        } else {
          fill(255, 255, 0);
        }
        box(boxSize, boxSize*0.5, boxSize);    //20 x 20 x 20pxの立方体を描く
        popMatrix();
      }
    }

    for (int x=2; x<4; x++) {
      for (int z=2; z<4; z++) {
        pushMatrix();
        rotateX(rotX[x][z][5]);
        rotateY(rotY[x][z][5]);
        rotateZ(rotZ[x][z][5]);
        translate(x*distance-halfDis, 6*distance-halfDis, z*distance-halfDis);
        if (mode_frag==1&&cube_h==1) {
          fill(70, 70, 0);
        } else if (mode_frag==2&&cube_h==1) {
          fill(70, 70, 0);
        } else {
          fill(255, 255, 0);
        }
        box(boxSize, boxSize*0.5, boxSize);    //20 x 20 x 20pxの立方体を描く
        popMatrix();
      }
    }

    for (int x=2; x<4; x++) {
      for (int z=4; z<6; z++) {
        pushMatrix();
        rotateX(rotX[x][z][5]);
        rotateY(rotY[x][z][5]);
        rotateZ(rotZ[x][z][5]);
        translate(x*distance-halfDis, 6*distance-halfDis, z*distance-halfDis);
        if (mode_frag==1&&cube_h==1) {
          fill(70, 70, 0);
        } else if (mode_frag==2&&cube_h==2) {
          fill(70, 70, 0);
        } else {
          fill(255, 255, 0);
        }
        box(boxSize, boxSize*0.5, boxSize);    //20 x 20 x 20pxの立方体を描く
        popMatrix();
      }
    }

    for (int x=4; x<6; x++) {
      for (int z=0; z<2; z++) {
        pushMatrix();
        rotateX(rotX[x][z][5]);
        rotateY(rotY[x][z][5]);
        rotateZ(rotZ[x][z][5]);
        translate(x*distance-halfDis, 6*distance-halfDis, z*distance-halfDis);
        if (mode_frag==1&&cube_h==2) {
          fill(70, 70, 0);
        } else if (mode_frag==2&&cube_h==0) {
          fill(70, 70, 0);
        } else {
          fill(255, 255, 0);
        }
        box(boxSize, boxSize*0.5, boxSize);    //20 x 20 x 20pxの立方体を描く
        popMatrix();
      }
    }

    for (int x=4; x<6; x++) {
      for (int z=2; z<4; z++) {
        pushMatrix();
        rotateX(rotX[x][z][5]);
        rotateY(rotY[x][z][5]);
        rotateZ(rotZ[x][z][5]);
        translate(x*distance-halfDis, 6*distance-halfDis, z*distance-halfDis);
        if (mode_frag==1&&cube_h==2) {
          fill(70, 70, 0);
        } else if (mode_frag==2&&cube_h==1) {
          fill(70, 70, 0);
        } else {
          fill(255, 255, 0);
        }
        box(boxSize, boxSize*0.5, boxSize);    //20 x 20 x 20pxの立方体を描く
        popMatrix();
      }
    }

    for (int x=4; x<6; x++) {
      for (int z=4; z<6; z++) {
        pushMatrix();
        rotateX(rotX[x][z][5]);
        rotateY(rotY[x][z][5]);
        rotateZ(rotZ[x][z][5]);
        translate(x*distance-halfDis, 6*distance-halfDis, z*distance-halfDis);
        if (mode_frag==1&&cube_h==2) {
          fill(70, 70, 0);
        } else if (mode_frag==2&&cube_h==2) {
          fill(70, 70, 0);
        } else {
          fill(255, 255, 0);
        }
        box(boxSize, boxSize*0.5, boxSize);    //20 x 20 x 20pxの立方体を描く
        popMatrix();
      }
    }
  }
//紫い面の作成
  if (mode_active==2) {
    for (int y=0; y<boxNum; y++) {
      for (int z=0; z<boxNum; z++) {
        stroke(255, 100, 100);
        pushMatrix();
        rotateX(rotX[y][z][3]);
        rotateY(rotY[y][z][3]);
        rotateZ(rotZ[y][z][3]);
        translate(-1*distance-halfDis, y*distance-halfDis, z*distance-halfDis);
        if (z==0&&y>=1&&y<=4||z==5&&y>=1&&y<=4||z==1&&y==1||z==1&&y==4||z==4&&y==1||z==4&&y==4||z==3&&y>=1&&y<=2||z==2&&y>=3&&y<=4) {
          fill(55, 55, 55);
        } else {
          fill(255, 0, 255);
        }
        box(boxSize*0.5, boxSize, boxSize);    //20 x 20 x 20pxの立方体を描く
        popMatrix();
      }
    }
  } else {
    for (int y=0; y<2; y++) {
      for (int z=0; z<2; z++) {
        pushMatrix();
        rotateX(rotX[y][z][0]);
        rotateY(rotY[y][z][0]);
        rotateZ(rotZ[y][z][0]);
        translate(-1*distance-halfDis, y*distance-halfDis, z*distance-halfDis);
        if (mode_frag==0&&cube_w==0) {
          fill(70, 0, 70);
        } else if (mode_frag==2&&cube_h==0) {
          fill(70, 0, 70);
        } else {
          fill(255, 0, 255);
        }
        box(boxSize*0.5, boxSize, boxSize);    //20 x 20 x 20pxの立方体を描く
        popMatrix();
      }
    }

    for (int y=0; y<2; y++) {
      for (int z=2; z<4; z++) {
        pushMatrix();      
        rotateX(rotX[y][z][0]);
        rotateY(rotY[y][z][0]);
        rotateZ(rotZ[y][z][0]);
        translate(-1*distance-halfDis, y*distance-halfDis, z*distance-halfDis);
        if (mode_frag==0&&cube_w==0) {
          fill(70, 0, 70);
        } else if (mode_frag==2&&cube_h==1) {
          fill(70, 0, 70);
        } else {
          fill(255, 0, 255);
        }
        box(boxSize*0.5, boxSize, boxSize);    //20 x 20 x 20pxの立方体を描く
        popMatrix();
      }
    }

    for (int y=0; y<2; y++) {
      for (int z=4; z<6; z++) {
        pushMatrix();
        rotateX(rotX[y][z][0]);
        rotateY(rotY[y][z][0]);
        rotateZ(rotZ[y][z][0]);
        translate(-1*distance-halfDis, y*distance-halfDis, z*distance-halfDis);
        if (mode_frag==0&&cube_w==0) {
          fill(70, 0, 70);
        } else if (mode_frag==2&&cube_h==2) {
          fill(70, 0, 70);
        } else {
          fill(255, 0, 255);
        }
        box(boxSize*0.5, boxSize, boxSize);    //20 x 20 x 20pxの立方体を描く
        popMatrix();
      }
    }

    for (int y=2; y<4; y++) {
      for (int z=0; z<2; z++) {
        pushMatrix();
        rotateX(rotX[y][z][0]);
        rotateY(rotY[y][z][0]);
        rotateZ(rotZ[y][z][0]);
        translate(-1*distance-halfDis, y*distance-halfDis, z*distance-halfDis);
        if (mode_frag==0&&cube_w==1) {
          fill(70, 0, 70);
        } else if (mode_frag==2&&cube_h==0) {
          fill(70, 0, 70);
        } else {
          fill(255, 0, 255);
        }
        box(boxSize*0.5, boxSize, boxSize);    //20 x 20 x 20pxの立方体を描く
        popMatrix();
      }
    }

    for (int y=2; y<4; y++) {
      for (int z=2; z<4; z++) {
        pushMatrix();
        rotateX(rotX[y][z][0]);
        rotateY(rotY[y][z][0]);
        rotateZ(rotZ[y][z][0]);
        translate(-1*distance-halfDis, y*distance-halfDis, z*distance-halfDis);
        if (mode_frag==0&&cube_w==1) {
          fill(70, 0, 70);
        } else if (mode_frag==2&&cube_h==1) {
          fill(70, 0, 70);
        } else {
          fill(255, 0, 255);
        }
        box(boxSize*0.5, boxSize, boxSize);    //20 x 20 x 20pxの立方体を描く
        popMatrix();
      }
    }

    for (int y=2; y<4; y++) {
      for (int z=4; z<6; z++) {
        pushMatrix();
        rotateX(rotX[y][z][0]);
        rotateY(rotY[y][z][0]);
        rotateZ(rotZ[y][z][0]);
        translate(-1*distance-halfDis, y*distance-halfDis, z*distance-halfDis);
        if (mode_frag==0&&cube_w==1) {
          fill(70, 0, 70);
        } else if (mode_frag==2&&cube_h==2) {
          fill(70, 0, 70);
        } else {
          fill(255, 0, 255);
        }
        box(boxSize*0.5, boxSize, boxSize);    //20 x 20 x 20pxの立方体を描く
        popMatrix();
      }
    }

    for (int y=4; y<6; y++) {
      for (int z=0; z<2; z++) {
        pushMatrix();
        rotateX(rotX[y][z][0]);
        rotateY(rotY[y][z][0]);
        rotateZ(rotZ[y][z][0]);
        translate(-1*distance-halfDis, y*distance-halfDis, z*distance-halfDis);
        if (mode_frag==0&&cube_w==2) {
          fill(70, 0, 70);
        } else if (mode_frag==2&&cube_h==0) {
          fill(70, 0, 70);
        } else {
          fill(255, 0, 255);
        }
        box(boxSize*0.5, boxSize, boxSize);    //20 x 20 x 20pxの立方体を描く
        popMatrix();
      }
    }

    for (int y=4; y<6; y++) {
      for (int z=2; z<4; z++) {
        pushMatrix();
        rotateX(rotX[y][z][0]);
        rotateY(rotY[y][z][0]);
        rotateZ(rotZ[y][z][0]);
        translate(-1*distance-halfDis, y*distance-halfDis, z*distance-halfDis);
        if (mode_frag==0&&cube_w==2) {
          fill(70, 0, 70);
        } else if (mode_frag==2&&cube_h==1) {
          fill(70, 0, 70);
        } else {
          fill(255, 0, 255);
        }
        box(boxSize*0.5, boxSize, boxSize);    //20 x 20 x 20pxの立方体を描く
        popMatrix();
      }
    }

    for (int y=4; y<6; y++) {
      for (int z=4; z<6; z++) {
        pushMatrix();
        rotateX(rotX[y][z][0]);
        rotateY(rotY[y][z][0]);
        rotateZ(rotZ[y][z][0]);
        translate(-1*distance-halfDis, y*distance-halfDis, z*distance-halfDis);
        if (mode_frag==0&&cube_w==2) {
          fill(70, 0, 70);
        } else if (mode_frag==2&&cube_h==2) {
          fill(70, 0, 70);
        } else {
          fill(255, 0, 255);
        }
        box(boxSize*0.5, boxSize, boxSize);    //20 x 20 x 20pxの立方体を描く
        popMatrix();
      }
    }
  }

//白い面の作成
  if (mode_active==2) {
    for (int y=0; y<boxNum; y++) {
      for (int z=0; z<boxNum; z++) {
        stroke(255, 100, 100);
        pushMatrix();
        rotateX(rotX[y][z][3]);
        rotateY(rotY[y][z][3]);
        rotateZ(rotZ[y][z][3]);
        translate(6*distance-halfDis, y*distance-halfDis, z*distance-halfDis);
        if (z==0&&y>=1&&y<=4||z==5&&y>=1&&y<=4||z==1&&y==1||z==1&&y==4||z==4&&y==1||z==4&&y==4||z==2&&y>=1&&y<=2||z==3&&y>=3&&y<=4) {
          fill(55, 0, 55);
        } else {
          fill(255, 255, 255);
        }
        box(boxSize*0.5, boxSize, boxSize);    //20 x 20 x 20pxの立方体を描く
        popMatrix();
      }
    }
  } else {
    for (int y=0; y<2; y++) {
      for (int z=0; z<2; z++) {
        pushMatrix();
        rotateX(rotX[y][z][3]);
        rotateY(rotY[y][z][3]);
        rotateZ(rotZ[y][z][3]);
        translate(6*distance-halfDis, y*distance-halfDis, z*distance-halfDis);
        if (mode_frag==0&&cube_w==0) {
          fill(70);
        } else if (mode_frag==2&&cube_h==0) {
          fill(70);
        } else {
          fill(255);
        }
        box(boxSize*0.5, boxSize, boxSize);    //20 x 20 x 20pxの立方体を描く
        popMatrix();
      }
    }

    for (int y=0; y<2; y++) {
      for (int z=2; z<4; z++) {
        pushMatrix();
        rotateX(rotX[y][z][3]);
        rotateY(rotY[y][z][3]);
        rotateZ(rotZ[y][z][3]);
        translate(6*distance-halfDis, y*distance-halfDis, z*distance-halfDis);
        if (mode_frag==0&&cube_w==0) {
          fill(70);
        } else if (mode_frag==2&&cube_h==1) {
          fill(70);
        } else {
          fill(255);
        }
        box(boxSize*0.5, boxSize, boxSize);    //20 x 20 x 20pxの立方体を描く
        popMatrix();
      }
    }

    for (int y=0; y<2; y++) {
      for (int z=4; z<6; z++) {
        pushMatrix();
        rotateX(rotX[y][z][3]);
        rotateY(rotY[y][z][3]);
        rotateZ(rotZ[y][z][3]);
        translate(6*distance-halfDis, y*distance-halfDis, z*distance-halfDis);
        if (mode_frag==0&&cube_w==0) {
          fill(70);
        } else if (mode_frag==2&&cube_h==2) {
          fill(70);
        } else {
          fill(255);
        }      
        box(boxSize*0.5, boxSize, boxSize);    //20 x 20 x 20pxの立方体を描く
        popMatrix();
      }
    }

    for (int y=2; y<4; y++) {
      for (int z=0; z<2; z++) {
        pushMatrix();
        rotateX(rotX[y][z][3]);
        rotateY(rotY[y][z][3]);
        rotateZ(rotZ[y][z][3]);
        translate(6*distance-halfDis, y*distance-halfDis, z*distance-halfDis);
        if (mode_frag==0&&cube_w==1) {
          fill(70);
        } else if (mode_frag==2&&cube_h==0) {
          fill(70);
        } else {
          fill(255);
        }  
        box(boxSize*0.5, boxSize, boxSize);    //20 x 20 x 20pxの立方体を描く
        popMatrix();
      }
    }

    for (int y=2; y<4; y++) {
      for (int z=2; z<4; z++) {
        pushMatrix();
        rotateX(rotX[y][z][3]);
        rotateY(rotY[y][z][3]);
        rotateZ(rotZ[y][z][3]);
        translate(6*distance-halfDis, y*distance-halfDis, z*distance-halfDis);
        if (mode_frag==0&&cube_w==1) {
          fill(70);
        } else if (mode_frag==2&&cube_h==1) {
          fill(70);
        } else {
          fill(255);
        }  
        box(boxSize*0.5, boxSize, boxSize);    //20 x 20 x 20pxの立方体を描く
        popMatrix();
      }
    }

    for (int y=2; y<4; y++) {
      for (int z=4; z<6; z++) {
        pushMatrix();
        rotateX(rotX[y][z][3]);
        rotateY(rotY[y][z][3]);
        rotateZ(rotZ[y][z][3]);
        translate(6*distance-halfDis, y*distance-halfDis, z*distance-halfDis);
        if (mode_frag==0&&cube_w==1) {
          fill(70);
        } else if (mode_frag==2&&cube_h==2) {
          fill(70);
        } else {
          fill(255);
        }  
        box(boxSize*0.5, boxSize, boxSize);    //20 x 20 x 20pxの立方体を描く
        popMatrix();
      }
    }

    for (int y=4; y<6; y++) {
      for (int z=0; z<2; z++) {
        pushMatrix();
        rotateX(rotX[y][z][3]);
        rotateY(rotY[y][z][3]);
        rotateZ(rotZ[y][z][3]);
        translate(6*distance-halfDis, y*distance-halfDis, z*distance-halfDis);
        if (mode_frag==0&&cube_w==2) {
          fill(70);
        } else if (mode_frag==2&&cube_h==0) {
          fill(70);
        } else {
          fill(255);
        }  
        box(boxSize*0.5, boxSize, boxSize);    //20 x 20 x 20pxの立方体を描く
        popMatrix();
      }
    }

    for (int y=4; y<6; y++) {
      for (int z=2; z<4; z++) {
        pushMatrix();
        rotateX(rotX[y][z][3]);
        rotateY(rotY[y][z][3]);
        rotateZ(rotZ[y][z][3]);
        translate(6*distance-halfDis, y*distance-halfDis, z*distance-halfDis);
        if (mode_frag==0&&cube_w==2) {
          fill(70);
        } else if (mode_frag==2&&cube_h==1) {
          fill(70);
        } else {
          fill(255);
        }  
        box(boxSize*0.5, boxSize, boxSize);    //20 x 20 x 20pxの立方体を描く
        popMatrix();
      }
    }

    for (int y=4; y<6; y++) {
      for (int z=4; z<6; z++) {
        pushMatrix();
        rotateX(rotX[y][z][3]);
        rotateY(rotY[y][z][3]);
        rotateZ(rotZ[y][z][3]);
        translate(6*distance-halfDis, y*distance-halfDis, z*distance-halfDis);
        if (mode_frag==0&&cube_w==2) {
          fill(70);
        } else if (mode_frag==2&&cube_h==2) {
          fill(70);
        } else {
          fill(255);
        }  
        box(boxSize*0.5, boxSize, boxSize);    //20 x 20 x 20pxの立方体を描く
        popMatrix();
      }
    }
  }
}
