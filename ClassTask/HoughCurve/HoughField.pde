class HoughField {
  int field[][];
  int field_rho;
  int field_theta;
  int field_rho_offset;
  float rho_max;
  float theta_max;
  float cos_tab[];
  float sin_tab[];
  //--------------------------------------------------
  int max_vote_rho;
  int max_vote_theta;
  int vote_top20_rho[] = new int[20];
  int vote_top20_theta[] = new int[20];
  //--------------------------------------------------
  int image_w;
  int image_h;

  int brightness_threshold = 192;

  int votes_threshold = 30;
  int votes_localmax_max = 20;


  HoughField(int field_width, int field_height, PImage input) {
    field_theta = field_width;
    field_rho = field_height;
    field_rho_offset = field_height / 2;
    field = new int[field_rho][field_theta];
    //------------------------------------------------------

    //------------------------------------------------------
    theta_max = PI; 
    rho_max = dist(0, 0, input.width, input.height);
    image_w = input.width;
    image_h = input.height;

    initTables();
  }

  void initTables() {
    cos_tab = new float[field_theta];
    sin_tab = new float[field_theta];

    for (int t = 0; t<field_theta; t++) {
      float theta = theta_max * t / field_theta;
      cos_tab[t] = cos(theta);
      sin_tab[t] = sin(theta);
    }
  }

  void update(PImage input) {
    clear();

    input.loadPixels();
    for (int y=0; y<image_h; y++) {
      for (int x=0; x<image_w; x++) {
        float b = brightness(input.pixels[y * input.width + x]); 
        if (b > brightness_threshold) {
          vote(x, y);
        }
      }
    }
  }

  void vote(int x, int y) {
    for (int t = 0; t < field_theta; t++) {
      float theta = theta_max * t / field_theta;
      float rho = (float)x * cos_tab[t] + (float)y * sin_tab[t];
      int irho = (int)(field_rho_offset * rho / rho_max + field_rho_offset);
      if (irho >= 0 && irho < field_rho) {
        field[irho][t] += 1;
      }
    }
  }

  Line restoreLine(int irho, int itheta) {
    float x1, y1, x2, y2;

    if (itheta < 0 || itheta >= field_theta) {
      return null;
    }
    if (itheta <= (field_theta / 4) || itheta > (field_theta * 3 / 4)) {
      y1 = 0;
      y2 = image_h;
      x1 = rho_max * (irho - field_rho_offset) / field_rho_offset / cos_tab[itheta];
      x2 = x1 - y2 * sin_tab[itheta] / cos_tab[itheta];
    } else {
      x1 = 0;
      x2 = image_w;
      y1 = rho_max * (irho - field_rho_offset) / field_rho_offset / sin_tab[itheta];
      y2 = y1 - x2 * cos_tab[itheta] / sin_tab[itheta];
    }

    return new Line(x1, y1, x2, y2);
  }


  //---------------------------------------------------------------------
  //---------------------------------------------------------------------


  void draw(PGraphics output) {
    //int highestVotes = 0;
    //for (int r = 0; r < field_rho; r++) {
    //  for (int t = 0; t < field_theta; t++) {
    //    if (highestVotes < field[r][t]) {
    //      highestVotes = field[r][t];
    //      //-----------------------------------------------------
    //      max_vote_rho = r;
    //      max_vote_theta = t;
    //      //-----------------------------------------------------
    //    }
    //  }
    //}

    int highestVotes = 0;
    int highesterVotes = 0;
    int i = 0;
    while (i<votes_localmax_max) {
      highesterVotes = 0;
      for (int r = 0; r < field_rho; r++) {
        for (int t = 0; t < field_theta; t++) {
          if (i==0) {
            if (highestVotes < field[r][t]) {
              highestVotes = field[r][t];
              //-----------------------------------------------------
              vote_top20_rho[i] = r;
              vote_top20_theta[i] = t;
              //-----------------------------------------------------
            }
          } else {
            if (highesterVotes < field[r][t]) {
              highesterVotes = field[r][t];
              //-----------------------------------------------------
              vote_top20_rho[i] = r;
              vote_top20_theta[i] = t;
              //-----------------------------------------------------
            }
          }
        }
      }
      field[vote_top20_rho[i]][vote_top20_theta[i]] = 0;
      i++;
    }
    println("escape while loop");
    for (int j=0; j<20; j++) {
      println(vote_top20_rho[j]);
    }

    if (highestVotes == 0) {
      output.beginDraw();
      output.background(255);
      output.endDraw();
    } else {
      drawField(output, highestVotes);
    }
  } 

  void drawField(PGraphics output, int highestVotes) {
    output.loadPixels();
    for (int r=1; r<field_rho-1; r++) {
      for (int t=1; t<field_theta-1; t++) {
        color c = color(255 * (1.0 - (float)field[r][t] / highestVotes));
        output.pixels[r * output.width + t] = c;
      }
    }
    output.updatePixels();
  }

  void clear() {
    for (int t=0; t<field_theta; t++) {
      for (int r=0; r<field_rho; r++) {
        field[r][t] = 0;
      }
    }
  }
}