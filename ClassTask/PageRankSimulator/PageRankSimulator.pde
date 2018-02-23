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

// とりあえず親ウインドウが必要なので...
size( 100, 100 );

// ノードの初期化
Graph<String, Integer> g = new DirectedOrderedSparseMultigraph<String, Integer>();

// ノード（Vertex）を定義する
// g.addVertex( "node_name" );
// TODO TODO TODO TODO TODO TODO TODO TODO 
g.addVertex("0");
g.addVertex("1");
g.addVertex("2");
g.addVertex("3");
g.addVertex("4");
g.addVertex("5");
g.addVertex("6");
g.addVertex("7");
g.addVertex("8");
g.addVertex("9");
g.addVertex("10");
g.addVertex("11");
g.addVertex("12");
g.addVertex("13");
g.addVertex("14");


// ノード間にエッジをはる。ちなみに、エッジは第2引数から第3引数へ
// g.addEdge( edge_num, "from", "to", EdgeType.DIRECTED );

//試行3 これ使う
g.addEdge(0,"0","8",EdgeType.DIRECTED);
g.addEdge(1,"0","13",EdgeType.DIRECTED);
g.addEdge(2,"1","13",EdgeType.DIRECTED);
g.addEdge(3,"2","13",EdgeType.DIRECTED);
g.addEdge(4,"3","0",EdgeType.DIRECTED);
g.addEdge(5,"4","1",EdgeType.DIRECTED);
g.addEdge(6,"5","13",EdgeType.DIRECTED);
g.addEdge(7,"6","2",EdgeType.DIRECTED);
g.addEdge(8,"6","12",EdgeType.DIRECTED);
g.addEdge(9,"7","4",EdgeType.DIRECTED);
g.addEdge(10,"7","14",EdgeType.DIRECTED);
g.addEdge(11,"7","13",EdgeType.DIRECTED);
g.addEdge(12,"8","13",EdgeType.DIRECTED);
g.addEdge(13,"9","3",EdgeType.DIRECTED);
g.addEdge(14,"10","5",EdgeType.DIRECTED);
g.addEdge(15,"10","13",EdgeType.DIRECTED);
g.addEdge(16,"11","13",EdgeType.DIRECTED);
g.addEdge(17,"12","13",EdgeType.DIRECTED);
g.addEdge(18,"13","11",EdgeType.DIRECTED);
g.addEdge(19,"14","13",EdgeType.DIRECTED);


// PageRankの値を計算する準備。ランダムサーフのdを第2引数で指定 
PageRank<String, Integer> pr = new PageRank<String, Integer>(g, 0.15);
pr.evaluate(); // 計算！

// ノードのPageRank値を出力する
// pr.getVertexScore( "node_name" );
// TODO TODO TODO TODO TODO TODO TODO TODO 
println("node[0] = "+pr.getVertexScore( "0" ));
println("node[1] = "+pr.getVertexScore( "1" ));
println("node[2] = "+pr.getVertexScore( "2" ));
println("node[3] = "+pr.getVertexScore( "3" ));
println("node[4] = "+pr.getVertexScore( "4" ));
println("node[5] = "+pr.getVertexScore( "5" ));
println("node[6] = "+pr.getVertexScore( "6" ));
println("node[7] = "+pr.getVertexScore( "7" ));
println("node[8] = "+pr.getVertexScore( "8" ));
println("node[9] = "+pr.getVertexScore( "9" ));
println("node[10] = "+pr.getVertexScore( "10" ));
println("node[11] = "+pr.getVertexScore( "11" ));
println("node[12] = "+pr.getVertexScore( "12" ));
println("node[13] = "+pr.getVertexScore( "13" ));
println("node[14] = "+pr.getVertexScore( "14" ));


// CircleLayout（円状のレイアウト）を使ってVertexとEdgeを描画する準備
Layout<String, Integer> layout = new CircleLayout(g);
layout.setSize(new Dimension(500, 500)); // とりあえず縦横の幅を設定
// The BasicVisualizationServer<V,E> is parameterized by the edge types
BasicVisualizationServer<String, Integer> visServer = new BasicVisualizationServer<String, Integer>(layout);
// ラベルを文字列で表示する準備
visServer.getRenderContext().setVertexLabelTransformer( new ToStringLabeller() );
// 表示する領域の大きさを定義する
visServer.setPreferredSize(new Dimension(550, 550));

// 描画する（ここはいじらなくてOK）
JFrame frame = new JFrame("Simple Graph View");
frame.setDefaultCloseOperation(JFrame.EXIT_ON_CLOSE);
frame.getContentPane().add( visServer );
frame.pack();
frame.setVisible(true);