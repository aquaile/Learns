void setup() {
  int s[]= {
    1, 5, 2, 4, 3
  };//1,2,3,4,5の並び替え
  Sn sigma=new Sn(s);//コンストラクタの呼び出し
  int t[]= {
    3, 2, 5, 4, 1
  };
  Sn tau = new Sn(t);
  Sn st = prod(sigma, tau);
  st.printP();
  sigma.printP();
  println(sigma.isSn());
  println();
  Sn sigma1=sigma.inverse();//逆置換
  sigma1.printP();
}
