import processing.video.*;
import jp.nyatla.nyar4psg.*;
import jp.nyatla.nyar4psg.utils.*;


/*
漢字パズル
 部首を組み合わせて漢字を作って、画像を表示する。
 */
PImage[] img = new PImage[6];
Capture cam;
MultiMarker ar;

void setup() {
  size(640, 480, P3D);
  img[0] = loadImage("ike.jpg");
  img[1] = loadImage("ita.jpg");
  img[2] = loadImage("saka.jpg");
  img[3] = loadImage("sea.jpg");
  img[4] = loadImage("ume.jpg");
  img[5] = loadImage("ti.jpg");
  cam = new Capture(this, width, height);
  cam.start();
  ar = new MultiMarker(this, width, height, "camera_para.dat", NyAR4PsgConfig.CONFIG_PSG);
  ar.addARMarker("tree.pat", 80); //木
  ar.addARMarker("han.pat", 80); //反
  ar.addARMarker("mai.pat", 80); //毎
  ar.addARMarker("sanzui.pat", 80); //さんずい
  ar.addARMarker("nari.pat", 80); //也
  ar.addARMarker("tuti.pat", 80); //土
}

void draw() {
  if ( !cam.available() ) return;
  background(0);
  cam.read();
  ar.detect(cam);
  ar.drawBackground(cam);
  if ( ar.isExist(0) & ar.isExist(1) ) {
    PVector[] ap0, ap1;
    ap0 = ar.getMarkerVertex2D(0);
    ap1 = ar.getMarkerVertex2D(1);
    if (dist(ap0[0].x, ap0[0].y, ap1[0].x, ap1[0].y)<150) {
      if (ap0[0].x < ap1[0].x) {
        ar.beginTransform(0);
        fill(116, 163, 241, 100);
        translate(40, 40, 20);
        image(img[1], -80, -40, 80, 80);
        ar.endTransform();
      }
    }
  }

  if ( ar.isExist(0) & ar.isExist(2)) {
    PVector[] ap0, ap2;
    ap0 = ar.getMarkerVertex2D(0);
    ap2 = ar.getMarkerVertex2D(2);
    if (dist(ap0[0].x, ap0[0].y, ap2[0].x, ap2[0].y)<150) {
      if (ap0[0].x < ap2[0].x) {
        ar.beginTransform(0);
        fill(116, 163, 241, 100);
        translate(0, 0, 20);
        image(img[4], -80, -40, 80, 80);
        ar.endTransform();
      }
    }
  }

  if ( ar.isExist(5) & ar.isExist(1)) {
    PVector[] ap5, ap1;
    ap5 = ar.getMarkerVertex2D(5);
    ap1 = ar.getMarkerVertex2D(1);
    if (dist(ap5[0].x, ap5[0].y, ap1[0].x, ap1[0].y)<150) {
      if (ap5[0].x < ap1[0].x) {
        ar.beginTransform(5);
        fill(116, 163, 241, 100);
        translate(0, 0, 20);
        image(img[2], -80, -40, 80, 80);
        ar.endTransform();
      }
    }
  }

  if ( ar.isExist(3) & ar.isExist(2) ) {
    PVector[] ap3, ap2;
    ap3 = ar.getMarkerVertex2D(3);
    ap2 = ar.getMarkerVertex2D(2);
    if (dist(ap3[0].x, ap3[0].y, ap2[0].x, ap2[0].y)<150) {
      if (ap3[0].x < ap2[0].x) {
        ar.beginTransform(3);
        fill(116, 163, 241, 100);
        translate(0, 0, 20);
        image(img[3], -80, -40, 80, 80);
        ar.endTransform();
      }
    }
  }

  if ( ar.isExist(5) & ar.isExist(4) ) {
    PVector[] ap5, ap4;
    ap5 = ar.getMarkerVertex2D(5);
    ap4 = ar.getMarkerVertex2D(4);
    if (dist(ap5[0].x, ap5[0].y, ap4[0].x, ap4[0].y)<150) {
      if (ap5[0].x < ap4[0].x) {
        ar.beginTransform(5);
        fill(116, 163, 241, 100);
        translate(0, 0, 20);
        image(img[5], -80, -40, 80, 80);
        ar.endTransform();
      }
    }
  }

  if ( ar.isExist(3) & ar.isExist(4) ) {
    PVector[] ap3, ap4;
    ap3 = ar.getMarkerVertex2D(3);
    ap4 = ar.getMarkerVertex2D(4);
    if (dist(ap3[0].x, ap3[0].y, ap4[0].x, ap4[0].y)<150) {
      if (ap3[0].x < ap4[0].x) {
        ar.beginTransform(3);
        fill(116, 163, 241, 100);
        translate(0, 0, 20);
        image(img[0], -80, -40, 80, 80);
        ar.endTransform();
      }
    }
  }
} 