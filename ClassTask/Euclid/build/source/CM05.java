import processing.core.*; 
import processing.data.*; 
import processing.event.*; 
import processing.opengl.*; 

import java.util.HashMap; 
import java.util.ArrayList; 
import java.io.File; 
import java.io.BufferedReader; 
import java.io.PrintWriter; 
import java.io.InputStream; 
import java.io.OutputStream; 
import java.io.IOException; 

public class CM05 extends PApplet {

public void setup() {
  int s[]= {
    1, 5, 2, 4, 3
  };//1,2,3,4,5\u306e\u4e26\u3073\u66ff\u3048
  Sn sigma=new Sn(s);//\u30b3\u30f3\u30b9\u30c8\u30e9\u30af\u30bf\u306e\u547c\u3073\u51fa\u3057
  int t[]= {
    3, 2, 5, 4, 1
  };
  Sn tau = new Sn(t);
  Sn st = prod(sigma, tau);
  st.printP();
  sigma.printP();
  println(sigma.isSn());
  println();
  Sn sigma1=sigma.inverse();//\u9006\u7f6e\u63db
  sigma1.printP();
}
class Sn {
  int n;//\u6b21\u6570
  int []x;//\u914d\u5217
  Sn(int xx[]) {
    n=xx.length;
    x=new int[n];
    for (int i=0; i<n; i++) {
      x[i]=xx[i];
    }
  }
  //\u9006\u7f6e\u63db
  public Sn inverse() {
    int y[]=new int[n];
    for (int i=0; i<n; i++) {
      y[x[i]-1]=i+1 ;
      // i:0\u59cb\u307e\u308a
      // x[i]: 1\u59cb\u307e\u308a
      // [ ]\u306e\u4e2d : 0\u59cb\u307e\u308a
    }
    return new Sn(y);
  }
  public void printP() {
    //1\u884c\u76ee
    print("(");
    for (int i=0; i<n; i++) {
      print(" "+(i+1));
    }
    println(")");
    //2\u884c\u76ee
    print("(");
    for (int i=0; i<n; i++) {
      print(" "+x[i]);
    }
    println(")");
  }
  public boolean isSn() {
    int check[]=new int[n];
    for (int i=0; i<n; i++) {
      check[i]=0;
    }
    for (int i=0; i<n; i++) {
      if (x[i]>=1 && x[i]<=n) {
        check[x[i]-1]++;// x[i]\u306e\u500b\u6570\u3092\u30ab\u30a6\u30f3\u30c8\u3059\u308b
      }
    }
    for (int i=0; i<n; i++) {
      if( check[i]!=1){//\u30c0\u30e1\u306a\u3089false\u3092\u8fd4\u3059\u3002
        return false;
      }
    }
    return true;
  }
}

public Sn prod(Sn sigma, Sn tau){
  int nn = max(sigma.n, tau.n);//\u304b\u3051\u305f\u3082\u306e\u306e\u6b21\u6570
  int xx[] = new int[nn];
  for(int i=0;i<nn;i++){//\u30bc\u30ed\u59cb\u307e\u308a
    int a = tau.x[i];
    xx[i] = sigma.x[a-1];
  }
  return new Sn(xx);
}

public Sn exchange(int c,int d){//\u4e92\u63db
  int nn = max(c,d); //\u6b21\u6570\u304c\u5927\u304d\u3044\u65b9\u306b\u3042\u308f\u305b\u308b
  int xx[] = new int[nn];
  for(int i=0;i<nn;i++){
    xx[i] = i+1;//\u6570\u5b57\u306f1\u59cb\u307e\u308a
  }
  xx[d-1]=c;
  xx[c-1]=d;
  return new Sn(xx);
}
  static public void main(String[] passedArgs) {
    String[] appletArgs = new String[] { "CM05" };
    if (passedArgs != null) {
      PApplet.main(concat(appletArgs, passedArgs));
    } else {
      PApplet.main(appletArgs);
    }
  }
}
