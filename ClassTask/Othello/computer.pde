//コンピューター
void cpu() {
  int x, y;
  ArrayList p = new ArrayList(); 
  int openness[];
  int px = -1;
  int py = -1;
  int max = 300;
  int fieldValue = 0;
  int rand = 5;
  boolean can_put = false;
  canPutTrout();
  for (int i=0; i<BLOCK; i++) {
    for (int j=0; j<BLOCK; j++) {
      if (canPutField[i][j]>0) {
        p.add(new PVector(i, j));
      }
    }
  }
  //開放度の初期化
  openness = new int[p.size()];
  for (int i=0; i<p.size(); i++) {
    openness[i] = 0;
  }
  //置ける場所がなかったらpassする
  if (p.size()==0) {
    player = !player;
    println("cpu passed");
    return;
  }
  //開放度計算(打つとこの周りだけ)
  for (int i=0; i<p.size(); i++) {
    PVector put = (PVector)p.get(i);
    x = (int)put.x;
    y = (int)put.y;

    //周り8マスから空いてるマスを計算する
    if (x-1>0&&y-1>0&&field[x-1][y-1]==NONE) {
      openness[i]-=rand;
    }
    if (y-1>0&&field[x][y-1]==NONE) {
      openness[i]+=rand;
    }
    if (x+1<7&&y-1>0&&field[x+1][y-1]==NONE) {
      openness[i]+=rand;
    }
    if (x-1>0&&field[x-1][y]==NONE) {
      openness[i]+=rand;
    }
    if (x+1<7&&field[x+1][y]==NONE) {
      openness[i]+=rand;
    }
    if (x-1>0&&y+1<7&&field[x-1][y+1]==NONE) {
      openness[i]+=rand;
    }
    if (y+1<7&&field[x][y+1]==NONE) {
      openness[i]+=rand;
    }
    if (x+1<7&&y+1<7&&field[x+1][y+1]==NONE) {
      openness[i]+=rand;
    }
  }
  //開放度計算相手が置けるようになる場所
  for (int i=0; i<p.size(); i++) {
    PVector put = (PVector)p.get(i);
    x = (int)put.x;
    y = (int)put.y;

    for (int xx=0; xx<BLOCK; xx++) {
      for (int yy=0; yy<BLOCK; yy++) {
        tempField[xx][yy] = field[xx][yy];
      }
    }
    player = !player;
    field[x][y] = currentStone();
    canPutTrout();
    for (int xx=0; xx<BLOCK; xx++) {
      for (int yy=0; yy<BLOCK; yy++) {
        if(canPutField[xx][yy]>0){
          openness[i]+=rand;
        }
      }
    }
    player = !player;
    for (int xx=0; xx<BLOCK; xx++) {
      for (int yy=0; yy<BLOCK; yy++) {
        field[xx][yy] = tempField[xx][yy];
      }
    }
  }
  //置ける場所の重みを確認
  for (int i=0; i<p.size(); i++) {
    PVector put = (PVector)p.get(i);
    x = (int)put.x;
    y = (int)put.y;

    //ここ今書いてるとこ
    for (int xx=0; xx<BLOCK; xx++) {
      for (int yy=0; yy<BLOCK; yy++) {
        tempField[xx][yy] = field[xx][yy];
      }
    }
    player = !player;
    field[x][y] = currentStone();
    canPutTrout();
    for (int xx=0; xx<BLOCK; xx++) {
      for (int yy=0; yy<BLOCK; yy++) {
        if (canPutField[xx][yy]>0) {
          fieldValue += panelValue[xx][yy];
        }
      }
    }
    player = !player;
    if (fieldValue+openness[i]<max) {
      max = fieldValue;
      px = x;
      py = y;
    }

    for (int xx=0; xx<BLOCK; xx++) {
      for (int yy=0; yy<BLOCK; yy++) {
        field[xx][yy] = tempField[xx][yy];
      }
    }
    //ここ最初からあったやつ
    //if ((panelValue[x][y]+openness[i])>max) {
    //  max = panelValue[x][y];
    //  px = x;
    //  py = y;
    //}
    println(max);
    fieldValue = 0;
  }
  println("最良の場所は"+"x:"+px+" y:"+py);
  println(max);

  can_put = checkDirection(px, py, -1, -1, 0)|can_put;
  can_put = checkDirection(px, py, -1, 0, 0)|can_put;
  can_put = checkDirection(px, py, -1, 1, 0)|can_put;

  can_put = checkDirection(px, py, 0, -1, 0)|can_put;
  can_put = checkDirection(px, py, 0, 1, 0)|can_put;

  can_put = checkDirection(px, py, 1, -1, 0)|can_put;
  can_put = checkDirection(px, py, 1, 0, 0)|can_put;
  can_put = checkDirection(px, py, 1, 1, 0)|can_put;

  if (can_put) {
    field[px][py] = currentStone();
    println("COMPUTER PUT STONE ON (" +px +","+ py + ")");
    player = !player;
  }
}

void cpu_base() {
  int x, y;
  ArrayList p = new ArrayList(); 
  int openness[];
  int px = -1;
  int py = -1;
  int max = -100;
  int fieldValue = 0;
  int rand = 1;
  boolean can_put = false;
  canPutTrout();
  for (int i=0; i<BLOCK; i++) {
    for (int j=0; j<BLOCK; j++) {
      if (canPutField[i][j]>0) {
        p.add(new PVector(i, j));
      }
    }
  }
  //開放度の初期化
  openness = new int[p.size()];
  for (int i=0; i<p.size(); i++) {
    openness[i] = 0;
  }
  //置ける場所がなかったらpassする
  if (p.size()==0) {
    player = !player;
    println("cpu passed");
    return;
  }
  //開放度計算
  for (int i=0; i<p.size(); i++) {
    PVector put = (PVector)p.get(i);
    x = (int)put.x;
    y = (int)put.y;

    //周り8マスから空いてるマスを計算する
    if (x-1>0&&y-1>0&&field[x-1][y-1]==NONE) {
      openness[i]-=rand;
    }
    if (y-1>0&&field[x][y-1]==NONE) {
      openness[i]-=rand;
    }
    if (x+1<7&&y-1>0&&field[x+1][y-1]==NONE) {
      openness[i]-=rand;
    }
    if (x-1>0&&field[x-1][y]==NONE) {
      openness[i]-=rand;
    }
    if (x+1<7&&field[x+1][y]==NONE) {
      openness[i]-=rand;
    }
    if (x-1>0&&y+1<7&&field[x-1][y+1]==NONE) {
      openness[i]-=rand;
    }
    if (y+1<7&&field[x][y+1]==NONE) {
      openness[i]-=rand;
    }
    if (x+1<7&&y+1<7&&field[x+1][y+1]==NONE) {
      openness[i]-=rand;
    }
  }
  //置ける場所の重みを確認
  for (int i=0; i<p.size(); i++) {
    PVector put = (PVector)p.get(i);
    x = (int)put.x;
    y = (int)put.y;

    //ここ最初からあったやつ
    if ((panelValue[x][y]+openness[i])>max) {
      max = panelValue[x][y];
      px = x;
      py = y;
    }
    println(max);
    fieldValue = 0;
  }
  println("最良の場所は"+"x:"+px+" y:"+py);
  println(max);

  can_put = checkDirection(px, py, -1, -1, 0)|can_put;
  can_put = checkDirection(px, py, -1, 0, 0)|can_put;
  can_put = checkDirection(px, py, -1, 1, 0)|can_put;

  can_put = checkDirection(px, py, 0, -1, 0)|can_put;
  can_put = checkDirection(px, py, 0, 1, 0)|can_put;

  can_put = checkDirection(px, py, 1, -1, 0)|can_put;
  can_put = checkDirection(px, py, 1, 0, 0)|can_put;
  can_put = checkDirection(px, py, 1, 1, 0)|can_put;

  if (can_put) {
    field[px][py] = currentStone();
    println("COMPUTER PUT STONE ON (" +px +","+ py + ")");
    player = !player;
  }
}



//置ける場所の判定
void canPutTrout() {
  boolean can_put = false;
  for (int x=0; x<BLOCK; x++) {
    for (int y=0; y<BLOCK; y++) {
      canPutField[x][y]=0;
      can_put = checkDirection(x, y, -1, -1, 1);
      if (can_put&&field[x][y]==NONE) {
        canPutField[x][y]++;
      }
      can_put = checkDirection(x, y, -1, 0, 1);
      if (can_put&&field[x][y]==NONE) {
        canPutField[x][y]++;
      }
      can_put = checkDirection(x, y, -1, 1, 1);
      if (can_put&&field[x][y]==NONE) {
        canPutField[x][y]++;
      }

      can_put = checkDirection(x, y, 0, -1, 1);
      if (can_put&&field[x][y]==NONE) {
        canPutField[x][y]++;
      }
      can_put = checkDirection(x, y, 0, 1, 1);
      if (can_put&&field[x][y]==NONE) {
        canPutField[x][y]++;
      }

      can_put = checkDirection(x, y, 1, -1, 1);
      if (can_put&&field[x][y]==NONE) {
        canPutField[x][y]++;
      }
      can_put = checkDirection(x, y, 1, 0, 1);
      if (can_put&&field[x][y]==NONE) {
        canPutField[x][y]++;
      }
      can_put = checkDirection(x, y, 1, 1, 1);
      if (can_put&&field[x][y]==NONE) {
        canPutField[x][y]++;
      }
    }
  }
}