final int BLOCK = 8;
final int leng = 600;
final int SIZE = leng/BLOCK;
final int STONE_SIZE = (int)(SIZE*0.7);
final int NONE = 0;
final int BLACK = 1;
final int WHITE = -1;

int count = 0;
int field[][];
int canPutField[][];
int tempField[][];
int panelValue[][] = {
  { 200, -20,   0, -1,  -1,    0,  -20, 200}, 
  { -20, -30,  10,  10,  10,  10,  -30, -20}, 
  {  10,   5,   7,   5,   5,   7,   10,  10}, 
  {   7,   5,   5,   7,   7,   7,    5,   7}, 
  {   7,   5,   5,   7,   7,   7,    5,   7}, 
  {  10,   5,   7,   7,   7,   7,    5,  10}, 
  { -20, -30,  10,  10,  10,  10,  -30, -20}, 
  { 200, -20,   0,  -1,  -1,   0,  -20, 200}, 
};
boolean player = true;//黒の手番
int turnCount = 0;

void setup() {
  size(800, 600);
  init();
}

void draw() {
  display();
  playerOperate();
  //cpu_base();
  display();
  if (player) {
    turnCount++;
    if (turnCount%60==0) {
      cpu();
      turnCount=0;
    }
  }
  if (frameCount%180==0) {
    restart();
  }
}

void restart() {
  for (int i=0; i<BLOCK; i++) {
    for (int j=0; j<BLOCK; j++) {
      if (field[i][j]==NONE) {
        count++;
      }
    }
  }
  println(count);
  if (count==0) {
    init();
  }
  count = 0;
}


void playerOperate() {
  if (mousePressed) {
    int x = mouseX/SIZE;
    int y = mouseY/SIZE;
    if (x<=7) {
      boolean can_put = false;
      if (field[x][y]==NONE) {

        can_put = checkDirection(x, y, -1, -1, 0)|can_put;
        can_put = checkDirection(x, y, -1, 0, 0)|can_put;
        can_put = checkDirection(x, y, -1, 1, 0)|can_put;

        can_put = checkDirection(x, y, 0, -1, 0)|can_put;
        can_put = checkDirection(x, y, 0, 1, 0)|can_put;

        can_put = checkDirection(x, y, 1, -1, 0)|can_put;
        can_put = checkDirection(x, y, 1, 0, 0)|can_put;
        can_put = checkDirection(x, y, 1, 1, 0)|can_put;

        if (can_put) {
          field[x][y] = currentStone();
          println("PLAYER PUT STONE ON (" +x +","+ y + ")");
          player = !player;
        }
      }
    }
  }
}

void keyPressed() {
  if (key==' ') {
    println("pass"+player);
    player = !player;
  }
  if (key==ENTER) {
    init();
  }
}