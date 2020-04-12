//flow firled to control the movement of the grass targets which cows like to eat 
class FlowField {
  int resolution, numrows, numcols; 
  PVector[][] flow;
  boolean showFlow;

  FlowField(int r) {
    resolution = r;

    numrows = height/resolution;
    numcols = width/resolution;
    flow = new PVector[numrows][numcols];
    setFlow();
    showFlow = true;
  }

  //iterates through and sets the vector of each of the flow field indexs 
  void setFlow() {

    for (int row = 0; row < numrows; row++) {
      for (int col = 0; col < numcols; col++) {
         flow[row][col] = PVector.random2D();
         flow[row][col] = new PVector(1, 0);
        float angle = map(noise(row/10. + frameCount/1500., col/10. + frameCount/1600.), 0, 1, 0, 4*PI);
        flow[row][col] = new PVector(cos(angle), sin(angle));
      }
    }
  }


  void display() {
    if (showFlow == false) return;

    stroke(200);
    for (int row = 0; row < numrows; row++) {
      for (int col = 0; col < numcols; col++) {
        PVector p = flow[row][col];
        pushMatrix();
        translate(col*resolution, row*resolution);
        rotate(p.heading());
        //line(-0.3*resolution, 0, 0.3*resolution, 0);
        //line(0.3*resolution, 0, 0.1*resolution, 0.2*resolution);
        //line(0.3*resolution, 0, 0.1*resolution, -0.2*resolution);
        popMatrix();
      }
    }
  }


  PVector lookup(PVector position) {
    int col = int(constrain(position.x/resolution, 0, numcols-1));
    int row = int(constrain(position.y/resolution, 0, numrows-1));
    return flow[row][col];
  }
}
