boolean checkDirection(int x, int y, int dx, int dy,int type) {
  if (checkBound(x + dx, y + dy)&&field[x + dx][y + dy] != currentStone()) {
    return checkStones(x, y, dx, dy, type);
  }
  return false;
}

boolean checkStones(int x, int y, int dx, int dy, int type) {
  if (checkBound(x+dx, y+dy)&&field[x + dx][y + dy] == currentStone()) { //挟めた！！
    return true;
  } else if (checkBound(x+dx, y+dy)&&field[x + dx][y + dy] == NONE) { //挟めなかった、、、
    return false;
  } else if (checkBound(x+dx, y+dy)&&checkStones(x + dx, y + dy, dx, dy, type)) {//まだ挟めてない
    if(type==0){
      field[x + dx][y + dy] = currentStone();
    }else{
      
    }
    return true;
  } else {
    return false;
  }
}

boolean checkBound(int x, int y) {
  return x>=0 && x<BLOCK && y>=0 && y<BLOCK;
}

int currentStone() {
  if (player) {
    return BLACK;
  } else {
    return WHITE;
  }
}