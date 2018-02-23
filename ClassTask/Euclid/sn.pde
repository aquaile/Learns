class Sn {
  int n;//次数
  int []x;//配列
  Sn(int xx[]) {
    n=xx.length;
    x=new int[n];
    for (int i=0; i<n; i++) {
      x[i]=xx[i];
    }
  }
  //逆置換
  Sn inverse() {
    int y[]=new int[n];
    for (int i=0; i<n; i++) {
      y[x[i]-1]=i+1 ;
      // i:0始まり
      // x[i]: 1始まり
      // [ ]の中 : 0始まり
    }
    return new Sn(y);
  }
  void printP() {
    //1行目
    print("(");
    for (int i=0; i<n; i++) {
      print(" "+(i+1));
    }
    println(")");
    //2行目
    print("(");
    for (int i=0; i<n; i++) {
      print(" "+x[i]);
    }
    println(")");
  }
  boolean isSn() {
    int check[]=new int[n];
    for (int i=0; i<n; i++) {
      check[i]=0;
    }
    for (int i=0; i<n; i++) {
      if (x[i]>=1 && x[i]<=n) {
        check[x[i]-1]++;// x[i]の個数をカウントする
      }
    }
    for (int i=0; i<n; i++) {
      if( check[i]!=1){//ダメならfalseを返す。
        return false;
      }
    }
    return true;
  }
}

Sn prod(Sn sigma, Sn tau){
  int nn = max(sigma.n, tau.n);//かけたものの次数
  int xx[] = new int[nn];
  for(int i=0;i<nn;i++){//ゼロ始まり
    int a = tau.x[i];
    xx[i] = sigma.x[a-1];
  }
  return new Sn(xx);
}

Sn exchange(int c,int d){//互換
  int nn = max(c,d); //次数が大きい方にあわせる
  int xx[] = new int[nn];
  for(int i=0;i<nn;i++){
    xx[i] = i+1;//数字は1始まり
  }
  xx[d-1]=c;
  xx[c-1]=d;
  return new Sn(xx);
}
