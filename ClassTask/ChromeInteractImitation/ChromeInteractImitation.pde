float x;
float y;
float heigh;

float menu_x;
float menu_y;
float heigh_m;

int type=0;
void setup() {
  fullScreen();
  background(255);
  noStroke();
  rectMode(CENTER);
  heigh = 20;
  x = width/2;
  y = -heigh/2;

  heigh_m = 100;
  menu_x = width/2;
  menu_y = -heigh_m/2;
}

void draw() {
  background(255);
  fill(150);
  rect(menu_x, menu_y, width, heigh_m);
  fill(100);
  rect(x, y, width, heigh);
  //タイトルバー部分の変化
  if (mouseY<=heigh) {
    y+=2;
    if (y>heigh/2) {
      y=heigh/2;
    }
  } else if (mouseY<=heigh_m) {
    y-=3;
    if (y<-heigh/2) {
      y=-heigh/2;
    }
  } else {
    y-=3;
    if (y<-heigh/2) {
      y=-heigh/2;
    }
  }
  //メニューバー
  if (mouseY<=heigh) {
    menu_y+=0;
    if (type==2) {
      menu_y+=2;
      if (menu_y>heigh_m/2+heigh) {
        menu_y=heigh_m/2+heigh;
        type=1;
      }
    } else
      if (y==heigh/2) {
        menu_y+=7;
        if (menu_y>heigh_m/2+heigh) {
          menu_y=heigh_m/2+heigh;
          type=1;
        }
      }
  } else if (mouseY<=heigh_m&&type!=0) {
    menu_y-=3;
    if (menu_y<heigh_m/2) {
      menu_y=heigh_m/2;
      type=2;
    }
  } else {
    if (type!=2) {
      if (menu_y<=heigh_m/2-heigh/2&&type!=2) {
        menu_y-=7;
      } else if (y<0) {
        menu_y-=3;
      }
    }
    if (menu_y<-heigh_m/2) {
      menu_y=-heigh_m/2;
      if (type==1) {
        type=0;
      }
    }
  }
}