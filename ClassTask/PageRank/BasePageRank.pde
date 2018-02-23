// まずは必要なライブラリをかたっぱしからロードしていく
// ここについてはとりあえずコピペでOK
import edu.uci.ics.jung.graph.Graph;
import edu.uci.ics.jung.graph.SparseMultigraph;
import edu.uci.ics.jung.graph.util.EdgeType;
import edu.uci.ics.jung.visualization.decorators.ToStringLabeller;
import edu.uci.ics.jung.visualization.BasicVisualizationServer;
import edu.uci.ics.jung.algorithms.layout.FRLayout2;
import edu.uci.ics.jung.algorithms.layout.CircleLayout;
import edu.uci.ics.jung.algorithms.layout.Layout;
import java.awt.Dimension;
import javax.swing.JFrame;

static int NODE = 15;
static int RINK = 20;
int from, to; //開始ノード、終了ノード
int [][] randomSead = new int [NODE][NODE]; //値の被らないランダム値の箱
double maxScore = 0; //最大の値を保持
int score_change_flag = 0; //値が変化したら教えてくれる
int trial = 100000; //試行回数

void setup() {
  // とりあえず親ウインドウが必要なので...
  size( 100, 100 );
  //randomSeadに初期値入れる
  for (int i=0; i<NODE; i++) {
    for (int j=0; j<NODE; j++) {
      randomSead[i][j] = 1;
      //開始ノードと終了ノードが同じになるものを取り除く
      if (i==j) {
        randomSead[i][j] = 0;
      }
    }
  }
  frameRate(100);
}

void draw() {
  //
  from = 0;
  to = 0;
  // ノードの初期化
  Graph<String, Integer> g = new DirectedOrderedSparseMultigraph<String, Integer>();
  // ノード（Vertex）を定義する
  // g.addVertex( "node_name" );
  // TODO TODO TODO TODO TODO TODO TODO TODO
  for (int i=0; i<NODE; i++) {
    g.addVertex("\""+i+"\"");
  }


  // ノード間にエッジをはる。ちなみに、エッジは第2引数から第3引数へ
  // g.addEdge( edge_num, "from", "to", EdgeType.DIRECTED );
  // TODO TODO TODO TODO TODO TODO TODO TODO
  for (int i=0; i<RINK; i++) {
    if (i<NODE) { //とりあえず全部のノードが開始ノードとして使用されるようにする
      //ここで値を入れなおす←これしないと全部一か所に向かっちゃう
      to = int(random(0, NODE));
      //ノードの組み合わせが同じにならないようにする
      while (randomSead[i][to]==0) {
        to = int(random(0, NODE));
        //println(to);
      }
      g.addEdge( i, "\""+i+"\"", "\""+to+"\"", EdgeType.DIRECTED );
      //このノードの組み合わせが次回以降使えないようにする
      randomSead[i][to] = 0;
      //println(" 開始："+i+" 終了："+to);
    } else { //開始ノードの被りを許可
      //ノードの組み合わせが同じにならないようにする
      while (randomSead[from][to]==0) {
        to = int(random(0, NODE));
        from = int(random(0, NODE));
      }
      g.addEdge( i, "\""+from+"\"", "\""+to+"\"", EdgeType.DIRECTED );
      //このノードの組み合わせが次回以降使えないようにする
      randomSead[from][to] = 0;
      //println(" 開始："+from+" 終了："+to);
    }
  }

  //randomSead[][]が使い終わったから初期化する
  for (int i=0; i<NODE; i++) {
    for (int j=0; j<NODE; j++) {
      randomSead[i][j] = 1;
      if (i==j) {
        randomSead[i][j] = 0;
      }
    }
  }


  // PageRankの値を計算する準備。ランダムサーフのdを第2引数で指定
  PageRank<String, Integer> pr = new PageRank<String, Integer>(g, 0.10);
  pr.evaluate(); // 計算！
  // ノードのPageRank値を出力する
  // pr.getVertexScore( "node_name" );
  // TODO TODO TODO TODO TODO TODO TODO TODO
  //PageRankの書き出し
  for (int i=0; i<NODE; i++) {
    if (pr.getVertexScore("\""+i+"\"")>maxScore) {
      maxScore = pr.getVertexScore("\""+i+"\"");
      score_change_flag = 1;
    }
  }

  //最大値が変わった時だけなんか処理をする
  if (score_change_flag == 1) {
    println("---------- max PageRank is Change ----------");
    for (int i=0; i<NODE; i++) {
      println("node{"+i+"} = "+pr.getVertexScore("\""+i+"\""));
    }
    println("Max PageRank: "+maxScore);
    println("Trial: "+frameCount);
    score_change_flag = 0;

    //// CircleLayout（円状のレイアウト）を使ってVertexとEdgeを描画する準備
    Layout<String, Integer> layout = new CircleLayout(g);
    layout.setSize(new Dimension(500, 500)); // とりあえず縦横の幅を設定
    // The BasicVisualizationServer<V,E> is parameterized by the edge types
    BasicVisualizationServer<String, Integer> visServer = new BasicVisualizationServer<String, Integer>(layout);
    // ラベルを文字列で表示する準備
    visServer.getRenderContext().setVertexLabelTransformer( new ToStringLabeller() );
    // 表示する領域の大きさを定義する
    visServer.setPreferredSize(new Dimension(550, 550));

    // 描画する（ここはいじらなくてOK）
    JFrame frame = new JFrame("Trial : "+frameCount);
    frame.setDefaultCloseOperation(JFrame.EXIT_ON_CLOSE);
    frame.getContentPane().add( visServer );
    frame.pack();
    frame.setVisible(true);
  }
  //試行回数を終えたらプログラムをストップする
  if(frameCount==trial){
    println("Finish "+frameCount+" trial");
    noLoop();
  }
}
