//
//
//prcessing 公式サイトから引用＆改変

//ルービックキューブを描く関数
void drawBox(float boxSize, float distance, float halfDis, int boxNum, int mode_active) {
  fill(50);
  for (int z = 0; z < boxNum; z ++) {   
    //立方体を、z軸方向に30ピクセルごとに並べて6個生成  
    for (int y = 0; y < boxNum; y ++) {    
      //立方体を、y軸方向に30ピクセルごとに並べて6個生成  
      for (int x = 0; x < boxNum; x ++) {   
        //立方体を、x軸方向に30ピクセルごとに並べて6個生成
        pushMatrix();
        translate(x*distance-halfDis, y*distance-halfDis, z*distance-halfDis);
        if (mode_active==1) {
          fill(random(150, 255), random(150, 255), random(150, 255));
        } else if (mode_active==0) {
          fill(50);
        }
        box(boxSize, boxSize, boxSize);    //20 x 20 x 20pxの立方体を描く
        popMatrix();
      }
    }
  }
}

//
//外の枠を描く関数
void drawBackground() {
  loadPixels();
  int n = ((int)random(10, width/40)* 5);
  float w = 16.0;
  float h = 16.0;
  float dx = w/width;
  float dy = h/height;
  float x = -w/2;
  for (int i=0; i<width; i++) {
    float y = -h/2;
    for (int j=0; j<height; j++) {
      float r = sqrt((x*x)+(y*y));
      float theta = atan2(y, x);

      float val = sin(n*cos(r)+5*theta);

      pixels[i+j*width] = color(0, 0, (val+1.0)*255.0/2.0);
      y+= dy;
    }
    x+= dx;
  }
  updatePixels();
}


//
//外枠の頂点を描く関数

void drawPoint(float boxSize, float distance, float halfDis, int boxNum, int mode_active) {

  for (int x = 0; x < boxNum; x ++) {
    fill(100);
    stroke(255);
    if (mode_active==1) {
      fill(random(255), 255, 255);
    }

    // 
    pushMatrix();
    translate(x*distance-halfDis, -1*distance-halfDis, -1*distance-halfDis);
    box(boxSize, boxSize*0.5, boxSize*0.5);    //20 x 20 x 20pxの立方体を描く
    popMatrix();

    //    
    pushMatrix();
    translate(x*distance-halfDis, 6*distance-halfDis, 6*distance-halfDis);
    box(boxSize, boxSize*0.5, boxSize*0.5);    //20 x 20 x 20pxの立方体を描く
    popMatrix();

    //    
    pushMatrix();
    translate(x*distance-halfDis, -1*distance-halfDis, 6*distance-halfDis);
    box(boxSize, boxSize*0.5, boxSize*0.5);    //20 x 20 x 20pxの立方体を描く
    popMatrix();

    //    
    pushMatrix();
    translate(x*distance-halfDis, 6*distance-halfDis, -1*distance-halfDis);
    box(boxSize, boxSize*0.5, boxSize*0.5);    //20 x 20 x 20pxの立方体を描く
    popMatrix();
  }

  for (int y = 0; y < boxNum; y ++) {

    if (mode_active==1) {
      fill(255, 255, random(255));
    }

    //
    pushMatrix();
    translate(-1*distance-halfDis, y*distance-halfDis, -1*distance-halfDis);
    box(boxSize*0.5, boxSize, boxSize*0.5);    //20 x 20 x 20pxの立方体を描く
    popMatrix();

    //
    pushMatrix();
    translate(6*distance-halfDis, y*distance-halfDis, 6*distance-halfDis);
    box(boxSize*0.5, boxSize, boxSize*0.5);    //20 x 20 x 20pxの立方体を描く
    popMatrix();

    //
    pushMatrix();
    translate(-1*distance-halfDis, y*distance-halfDis, 6*distance-halfDis);
    box(boxSize*0.5, boxSize, boxSize*0.5);    //20 x 20 x 20pxの立方体を描く
    popMatrix();

    //
    pushMatrix();
    translate(6*distance-halfDis, y*distance-halfDis, -1*distance-halfDis);
    box(boxSize*0.5, boxSize, boxSize*0.5);    //20 x 20 x 20pxの立方体を描く
    popMatrix();
  }

  for (int z = 0; z < boxNum; z ++) {
    if (mode_active==1) {
      fill(255, random(255), 255);
    }

    //
    pushMatrix();
    translate(-1*distance-halfDis, -1*distance-halfDis, z*distance-halfDis);
    box(boxSize*0.5, boxSize*0.5, boxSize);    //20 x 20 x 20pxの立方体を描く
    popMatrix();

    //
    pushMatrix();
    translate(6*distance-halfDis, 6*distance-halfDis, z*distance-halfDis);
    box(boxSize*0.5, boxSize*0.5, boxSize);    //20 x 20 x 20pxの立方体を描く
    popMatrix();

    //
    pushMatrix();
    translate(-1*distance-halfDis, 6*distance-halfDis, z*distance-halfDis);
    box(boxSize*0.5, boxSize*0.5, boxSize);    //20 x 20 x 20pxの立方体を描く
    popMatrix();

    //
    pushMatrix();
    translate(6*distance-halfDis, -1*distance-halfDis, z*distance-halfDis);
    box(boxSize*0.5, boxSize*0.5, boxSize);    //20 x 20 x 20pxの立方体を描く
    popMatrix();
  }

  //頂点を作成

  //
  pushMatrix();
  translate(6*distance-halfDis, -1*distance-halfDis, -1*distance-halfDis);
  box(boxSize*0.5, boxSize*0.5, boxSize*0.5);    //20 x 20 x 20pxの立方体を描く
  popMatrix();

  //
  pushMatrix();
  translate(6*distance-halfDis, -1*distance-halfDis, 6*distance-halfDis);
  box(boxSize*0.5, boxSize*0.5, boxSize*0.5);    //20 x 20 x 20pxの立方体を描く
  popMatrix();

  //
  pushMatrix();
  translate(6*distance-halfDis, 6*distance-halfDis, -1*distance-halfDis);
  box(boxSize*0.5, boxSize*0.5, boxSize*0.5);    //20 x 20 x 20pxの立方体を描く
  popMatrix();

  //
  pushMatrix();
  translate(-1*distance-halfDis, 6*distance-halfDis, 6*distance-halfDis);
  box(boxSize*0.5, boxSize*0.5, boxSize*0.5);    //20 x 20 x 20pxの立方体を描く
  popMatrix();

  //
  pushMatrix();
  translate(-1*distance-halfDis, 6*distance-halfDis, -1*distance-halfDis);
  box(boxSize*0.5, boxSize*0.5, boxSize*0.5);    //20 x 20 x 20pxの立方体を描く
  popMatrix();

  //
  pushMatrix();
  translate(-1*distance-halfDis, -1*distance-halfDis, 6*distance-halfDis);
  box(boxSize*0.5, boxSize*0.5, boxSize*0.5);    //20 x 20 x 20pxの立方体を描く
  popMatrix();

  //
  pushMatrix();
  translate(-1*distance-halfDis, -1*distance-halfDis, -1*distance-halfDis);
  box(boxSize*0.5, boxSize*0.5, boxSize*0.5);    //20 x 20 x 20pxの立方体を描く
  popMatrix();

  //
  pushMatrix();
  translate(6*distance-halfDis, 6*distance-halfDis, 6*distance-halfDis);
  box(boxSize*0.5, boxSize*0.5, boxSize*0.5);    //20 x 20 x 20pxの立方体を描く
  popMatrix();
}

//背景を描く関数
//
void drawBingo() {  
  background(0);  


  /* カメラを適当に設定 */
  float angle = 0.5f * radians(time);  

  camera(0, -300*sin(angle), -400, 
  0, 0, 0, 
  0, 1, 0);  
  rotateY(angle);  // ちょっと回す  


  /* ビルボーディング */
  pushMatrix();  
  translate(100, 0, 0);  // 物体を並進（ローカル座標系）  

  // モデル-ビュー行列を取得  
  PMatrix3D builboardMat = (PMatrix3D)g.getMatrix();  
  // 回転成分を単位行列に  
  builboardMat.m00 = builboardMat.m11 = builboardMat.m22 = 1;  
  builboardMat.m01 = builboardMat.m02 =   
    builboardMat.m10 = builboardMat.m12 =   
    builboardMat.m20 = builboardMat.m21 = 0;  

  resetMatrix();  
  applyMatrix(builboardMat);  

  popMatrix();  

  /* 地面とかの描画 */
  pushStyle();  
  // 地面の描画   
  stroke(0, 255, 0);  
  for (int x = -1000; x <= 1000; x += 100)  
    line(x, 0, -1000, x, 0, 1000);   
  for (int z = -1000; z <= 1000; z += 100)  
    line(-1000, 0, z, 1000, 0, z);   
  for (int y = -1000; y <= 1000; y += 100)  
    line(0, y, -1000, 0, y, 1000);
  for (int z = -1000; z <= 1000; z += 100)  
    line(0, -1000, z, 0, 1000, z);   
  for (int x = -1000; x <= 1000; x += 100)  
    line(x, -1000, 0, x, 1000, 0);
  for (int y = -1000; y <= 1000; y += 100)  
    line(-1000, y, 0, 1000, y, 0); 


  popStyle();  

  time++;
}  
