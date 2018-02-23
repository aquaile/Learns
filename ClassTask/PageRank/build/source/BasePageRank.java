import processing.core.*; 
import processing.data.*; 
import processing.event.*; 
import processing.opengl.*; 

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

import org.apache.commons.collections15.*; 
import org.apache.commons.collections15.bag.*; 
import org.apache.commons.collections15.bidimap.*; 
import org.apache.commons.collections15.buffer.*; 
import org.apache.commons.collections15.collection.*; 
import org.apache.commons.collections15.comparators.*; 
import org.apache.commons.collections15.functors.*; 
import org.apache.commons.collections15.iterators.*; 
import org.apache.commons.collections15.keyvalue.*; 
import org.apache.commons.collections15.list.*; 
import org.apache.commons.collections15.map.*; 
import org.apache.commons.collections15.multimap.*; 
import org.apache.commons.collections15.set.*; 
import cern.clhep.*; 
import cern.colt.*; 
import cern.colt.bitvector.*; 
import cern.colt.buffer.*; 
import cern.colt.function.*; 
import cern.colt.list.*; 
import cern.colt.list.adapter.*; 
import cern.colt.map.*; 
import cern.colt.matrix.bench.*; 
import cern.colt.matrix.doublealgo.*; 
import cern.colt.matrix.*; 
import cern.colt.matrix.impl.*; 
import cern.colt.matrix.linalg.*; 
import cern.colt.matrix.objectalgo.*; 
import cern.jet.math.*; 
import cern.jet.random.*; 
import cern.jet.random.engine.*; 
import cern.jet.random.sampling.*; 
import cern.jet.stat.*; 
import cern.jet.stat.quantile.*; 
import corejava.*; 
import hep.aida.bin.*; 
import hep.aida.*; 
import hep.aida.ref.*; 
import EDU.oswego.cs.dl.util.concurrent.*; 
import EDU.oswego.cs.dl.util.concurrent.misc.*; 
import javax.media.j3d.*; 
import edu.uci.ics.jung.algorithms.layout3d.*; 
import edu.uci.ics.jung.visualization3d.control.*; 
import edu.uci.ics.jung.visualization3d.decorators.*; 
import edu.uci.ics.jung.visualization3d.*; 
import edu.uci.ics.jung.visualization3d.layout.*; 
import edu.uci.ics.jung.samples.*; 
import edu.uci.ics.jung.algorithms.blockmodel.*; 
import edu.uci.ics.jung.algorithms.cluster.*; 
import edu.uci.ics.jung.algorithms.filters.*; 
import edu.uci.ics.jung.algorithms.flows.*; 
import edu.uci.ics.jung.algorithms.generators.*; 
import edu.uci.ics.jung.algorithms.generators.random.*; 
import edu.uci.ics.jung.algorithms.importance.*; 
import edu.uci.ics.jung.algorithms.layout.*; 
import edu.uci.ics.jung.algorithms.layout.util.*; 
import edu.uci.ics.jung.algorithms.matrix.*; 
import edu.uci.ics.jung.algorithms.metrics.*; 
import edu.uci.ics.jung.algorithms.scoring.*; 
import edu.uci.ics.jung.algorithms.scoring.util.*; 
import edu.uci.ics.jung.algorithms.shortestpath.*; 
import edu.uci.ics.jung.algorithms.transformation.*; 
import edu.uci.ics.jung.algorithms.util.*; 
import edu.uci.ics.jung.graph.*; 
import edu.uci.ics.jung.graph.event.*; 
import edu.uci.ics.jung.graph.util.*; 
import edu.uci.ics.jung.io.*; 
import edu.uci.ics.jung.io.graphml.*; 
import edu.uci.ics.jung.io.graphml.parser.*; 
import edu.uci.ics.jung.visualization.jai.*; 
import edu.uci.ics.jung.visualization.annotations.*; 
import edu.uci.ics.jung.visualization.*; 
import edu.uci.ics.jung.visualization.control.*; 
import edu.uci.ics.jung.visualization.decorators.*; 
import edu.uci.ics.jung.visualization.layout.*; 
import edu.uci.ics.jung.visualization.picking.*; 
import edu.uci.ics.jung.visualization.renderers.*; 
import edu.uci.ics.jung.visualization.subLayout.*; 
import edu.uci.ics.jung.visualization.transform.*; 
import edu.uci.ics.jung.visualization.transform.shape.*; 
import edu.uci.ics.jung.visualization.util.*; 
import javax.xml.stream.events.*; 
import javax.xml.stream.*; 
import javax.xml.stream.util.*; 
import javax.xml.namespace.*; 
import javax.xml.*; 
import javax.vecmath.*; 
import com.ctc.wstx.api.*; 
import com.ctc.wstx.cfg.*; 
import com.ctc.wstx.compat.*; 
import com.ctc.wstx.dom.*; 
import com.ctc.wstx.dtd.*; 
import com.ctc.wstx.ent.*; 
import com.ctc.wstx.evt.*; 
import com.ctc.wstx.exc.*; 
import com.ctc.wstx.io.*; 
import com.ctc.wstx.msv.*; 
import com.ctc.wstx.sax.*; 
import com.ctc.wstx.sr.*; 
import com.ctc.wstx.stax.*; 
import com.ctc.wstx.sw.*; 
import com.ctc.wstx.util.*; 
import org.codehaus.stax2.*; 
import org.codehaus.stax2.evt.*; 
import org.codehaus.stax2.io.*; 
import org.codehaus.stax2.ri.*; 
import org.codehaus.stax2.validation.*; 

import java.util.HashMap; 
import java.util.ArrayList; 
import java.io.File; 
import java.io.BufferedReader; 
import java.io.PrintWriter; 
import java.io.InputStream; 
import java.io.OutputStream; 
import java.io.IOException; 

public class BasePageRank extends PApplet {

// \u307e\u305a\u306f\u5fc5\u8981\u306a\u30e9\u30a4\u30d6\u30e9\u30ea\u3092\u304b\u305f\u3063\u3071\u3057\u304b\u3089\u30ed\u30fc\u30c9\u3057\u3066\u3044\u304f
// \u3053\u3053\u306b\u3064\u3044\u3066\u306f\u3068\u308a\u3042\u3048\u305a\u30b3\u30d4\u30da\u3067OK











static int NODE = 15;
static int RINK = 20;
int from, to; //\u958b\u59cb\u30ce\u30fc\u30c9\u3001\u7d42\u4e86\u30ce\u30fc\u30c9
int [][] randomSead = new int [NODE][NODE]; //\u5024\u306e\u88ab\u3089\u306a\u3044\u30e9\u30f3\u30c0\u30e0\u5024\u306e\u7bb1
double maxScore = 0; //\u6700\u5927\u306e\u5024\u3092\u4fdd\u6301
int score_change_flag = 0; //\u5024\u304c\u5909\u5316\u3057\u305f\u3089\u6559\u3048\u3066\u304f\u308c\u308b
int trial = 100000; //\u8a66\u884c\u56de\u6570

public void setup() {
  // \u3068\u308a\u3042\u3048\u305a\u89aa\u30a6\u30a4\u30f3\u30c9\u30a6\u304c\u5fc5\u8981\u306a\u306e\u3067...
  
  //randomSead\u306b\u521d\u671f\u5024\u5165\u308c\u308b
  for (int i=0; i<NODE; i++) {
    for (int j=0; j<NODE; j++) {
      randomSead[i][j] = 1;
      //\u958b\u59cb\u30ce\u30fc\u30c9\u3068\u7d42\u4e86\u30ce\u30fc\u30c9\u304c\u540c\u3058\u306b\u306a\u308b\u3082\u306e\u3092\u53d6\u308a\u9664\u304f
      if (i==j) {
        randomSead[i][j] = 0;
      }
    }
  }
  frameRate(100);
}

public void draw() {
  //
  from = 0;
  to = 0;
  // \u30ce\u30fc\u30c9\u306e\u521d\u671f\u5316
  Graph<String, Integer> g = new DirectedOrderedSparseMultigraph<String, Integer>();
  // \u30ce\u30fc\u30c9\uff08Vertex\uff09\u3092\u5b9a\u7fa9\u3059\u308b
  // g.addVertex( "node_name" );
  // TODO TODO TODO TODO TODO TODO TODO TODO
  for (int i=0; i<NODE; i++) {
    g.addVertex("\""+i+"\"");
  }


  // \u30ce\u30fc\u30c9\u9593\u306b\u30a8\u30c3\u30b8\u3092\u306f\u308b\u3002\u3061\u306a\u307f\u306b\u3001\u30a8\u30c3\u30b8\u306f\u7b2c2\u5f15\u6570\u304b\u3089\u7b2c3\u5f15\u6570\u3078
  // g.addEdge( edge_num, "from", "to", EdgeType.DIRECTED );
  // TODO TODO TODO TODO TODO TODO TODO TODO
  for (int i=0; i<RINK; i++) {
    if (i<NODE) { //\u3068\u308a\u3042\u3048\u305a\u5168\u90e8\u306e\u30ce\u30fc\u30c9\u304c\u958b\u59cb\u30ce\u30fc\u30c9\u3068\u3057\u3066\u4f7f\u7528\u3055\u308c\u308b\u3088\u3046\u306b\u3059\u308b
      //\u3053\u3053\u3067\u5024\u3092\u5165\u308c\u306a\u304a\u3059\u2190\u3053\u308c\u3057\u306a\u3044\u3068\u5168\u90e8\u4e00\u304b\u6240\u306b\u5411\u304b\u3063\u3061\u3083\u3046
      to = PApplet.parseInt(random(0, NODE));
      //\u30ce\u30fc\u30c9\u306e\u7d44\u307f\u5408\u308f\u305b\u304c\u540c\u3058\u306b\u306a\u3089\u306a\u3044\u3088\u3046\u306b\u3059\u308b
      while (randomSead[i][to]==0) {
        to = PApplet.parseInt(random(0, NODE));
        //println(to);
      }
      g.addEdge( i, "\""+i+"\"", "\""+to+"\"", EdgeType.DIRECTED );
      //\u3053\u306e\u30ce\u30fc\u30c9\u306e\u7d44\u307f\u5408\u308f\u305b\u304c\u6b21\u56de\u4ee5\u964d\u4f7f\u3048\u306a\u3044\u3088\u3046\u306b\u3059\u308b
      randomSead[i][to] = 0;
      //println(" \u958b\u59cb\uff1a"+i+" \u7d42\u4e86\uff1a"+to);
    } else { //\u958b\u59cb\u30ce\u30fc\u30c9\u306e\u88ab\u308a\u3092\u8a31\u53ef
      //\u30ce\u30fc\u30c9\u306e\u7d44\u307f\u5408\u308f\u305b\u304c\u540c\u3058\u306b\u306a\u3089\u306a\u3044\u3088\u3046\u306b\u3059\u308b
      while (randomSead[from][to]==0) {
        to = PApplet.parseInt(random(0, NODE));
        from = PApplet.parseInt(random(0, NODE));
      }
      g.addEdge( i, "\""+from+"\"", "\""+to+"\"", EdgeType.DIRECTED );
      //\u3053\u306e\u30ce\u30fc\u30c9\u306e\u7d44\u307f\u5408\u308f\u305b\u304c\u6b21\u56de\u4ee5\u964d\u4f7f\u3048\u306a\u3044\u3088\u3046\u306b\u3059\u308b
      randomSead[from][to] = 0;
      //println(" \u958b\u59cb\uff1a"+from+" \u7d42\u4e86\uff1a"+to);
    }
  }

  //randomSead[][]\u304c\u4f7f\u3044\u7d42\u308f\u3063\u305f\u304b\u3089\u521d\u671f\u5316\u3059\u308b
  for (int i=0; i<NODE; i++) {
    for (int j=0; j<NODE; j++) {
      randomSead[i][j] = 1;
      if (i==j) {
        randomSead[i][j] = 0;
      }
    }
  }


  // PageRank\u306e\u5024\u3092\u8a08\u7b97\u3059\u308b\u6e96\u5099\u3002\u30e9\u30f3\u30c0\u30e0\u30b5\u30fc\u30d5\u306ed\u3092\u7b2c2\u5f15\u6570\u3067\u6307\u5b9a
  PageRank<String, Integer> pr = new PageRank<String, Integer>(g, 0.10f);
  pr.evaluate(); // \u8a08\u7b97\uff01
  // \u30ce\u30fc\u30c9\u306ePageRank\u5024\u3092\u51fa\u529b\u3059\u308b
  // pr.getVertexScore( "node_name" );
  // TODO TODO TODO TODO TODO TODO TODO TODO
  //PageRank\u306e\u66f8\u304d\u51fa\u3057
  for (int i=0; i<NODE; i++) {
    if (pr.getVertexScore("\""+i+"\"")>maxScore) {
      maxScore = pr.getVertexScore("\""+i+"\"");
      score_change_flag = 1;
    }
  }

  //\u6700\u5927\u5024\u304c\u5909\u308f\u3063\u305f\u6642\u3060\u3051\u306a\u3093\u304b\u51e6\u7406\u3092\u3059\u308b
  if (score_change_flag == 1) {
    println("---------- max PageRank is Change ----------");
    for (int i=0; i<NODE; i++) {
      println("node{"+i+"} = "+pr.getVertexScore("\""+i+"\""));
    }
    println("Max PageRank: "+maxScore);
    println("Trial: "+frameCount);
    score_change_flag = 0;

    //// CircleLayout\uff08\u5186\u72b6\u306e\u30ec\u30a4\u30a2\u30a6\u30c8\uff09\u3092\u4f7f\u3063\u3066Vertex\u3068Edge\u3092\u63cf\u753b\u3059\u308b\u6e96\u5099
    Layout<String, Integer> layout = new CircleLayout(g);
    layout.setSize(new Dimension(500, 500)); // \u3068\u308a\u3042\u3048\u305a\u7e26\u6a2a\u306e\u5e45\u3092\u8a2d\u5b9a
    // The BasicVisualizationServer<V,E> is parameterized by the edge types
    BasicVisualizationServer<String, Integer> visServer = new BasicVisualizationServer<String, Integer>(layout);
    // \u30e9\u30d9\u30eb\u3092\u6587\u5b57\u5217\u3067\u8868\u793a\u3059\u308b\u6e96\u5099
    visServer.getRenderContext().setVertexLabelTransformer( new ToStringLabeller() );
    // \u8868\u793a\u3059\u308b\u9818\u57df\u306e\u5927\u304d\u3055\u3092\u5b9a\u7fa9\u3059\u308b
    visServer.setPreferredSize(new Dimension(550, 550));

    // \u63cf\u753b\u3059\u308b\uff08\u3053\u3053\u306f\u3044\u3058\u3089\u306a\u304f\u3066OK\uff09
    JFrame frame = new JFrame("Trial : "+frameCount);
    frame.setDefaultCloseOperation(JFrame.EXIT_ON_CLOSE);
    frame.getContentPane().add( visServer );
    frame.pack();
    frame.setVisible(true);
  }
  //\u8a66\u884c\u56de\u6570\u3092\u7d42\u3048\u305f\u3089\u30d7\u30ed\u30b0\u30e9\u30e0\u3092\u30b9\u30c8\u30c3\u30d7\u3059\u308b
  if(frameCount==trial){
    println("Finish "+frameCount+" trial");
    noLoop();
  }
}
  public void settings() {  size( 100, 100 ); }
  static public void main(String[] passedArgs) {
    String[] appletArgs = new String[] { "BasePageRank" };
    if (passedArgs != null) {
      PApplet.main(concat(appletArgs, passedArgs));
    } else {
      PApplet.main(appletArgs);
    }
  }
}
