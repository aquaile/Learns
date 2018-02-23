void display() {
  background(0, 110, 0);
  
  canPutTrout();
  // lines
  stroke(0);
  for (int i=0; i<8; ++i) {
    for (int j=0; j<8; j++) {
      if(canPutField[i][j]==0){
        fill(0,128,0);
      }else{
        fill(0,140,0);
      }
      rect(i*SIZE, j*SIZE, SIZE, SIZE);
    }
  }
  //line(leng, 0, leng, height);

  fill(0);
  ellipse(SIZE*2, SIZE*2, 5, 5);
  ellipse(SIZE*2, SIZE*6, 5, 5);
  ellipse(SIZE*6, SIZE*2, 5, 5);
  ellipse(SIZE*6, SIZE*6, 5, 5);


  // draw stones
  noStroke();
  for (int i=0; i<8; i++) {
    for (int j=0; j<8; j++) {
      if (field[i][j]==BLACK) {
        fill(0);  //color black
        ellipse((i*2+1)*SIZE/2, (j*2+1)*SIZE/2, STONE_SIZE, STONE_SIZE);
      } else if (field[i][j]==WHITE) {
        fill(255); // color white
        ellipse((i*2+1)*SIZE/2, (j*2+1)*SIZE/2, STONE_SIZE, STONE_SIZE);
      }
    }
  }
  scorePanel();
}

void init() {
  player = true;
  textAlign(CENTER);
  field = new int[BLOCK][BLOCK];
  canPutField = new int[BLOCK][BLOCK];
  tempField = new int[BLOCK][BLOCK];
  for (int i=0; i<8; ++i) {
    for (int j=0; j<8; ++j) {
      field[i][j] = NONE;
      canPutField[i][j] = NONE;
      tempField[i][j] = NONE;
    }
  }
  field[3][3] = BLACK;
  field[4][4] = BLACK;
  field[3][4] = WHITE;
  field[4][3] = WHITE;
  
  //canPutTrout();
}

//スコア表示
void scorePanel() {
  int score_b = 0;
  int score_w = 0;

  for (int x=0; x<BLOCK; x++) {
    for (int y=0; y<BLOCK; y++) {
      if (field[x][y]==BLACK) {
        score_b++;
      }
      if (field[x][y]==WHITE) {
        score_w++;
      }
    }
  }
  textAlign(CENTER);
  textSize(40);

  //score black
  fill(0);
  text("BLACK:"+score_b, leng + 100, 0 + 80);

  //score white
  fill(255);
  text("WHITE:"+score_w, leng + 100, 0 + 150);
}