ArrayList<Animal> animals = new ArrayList<Animal>();
ArrayList<Target> targets = new ArrayList<Target>();
ArrayList<Seeds> seedCollections = new ArrayList<Seeds>();
FlowField flow;



void setup() {
  //size(600,600);
  fullScreen();
}

void draw() {
  PVector owen = new PVector(mouseX, mouseY);
  showGrass();                                  
  updateGrass(owen);
  
  for (int t = seedCollections.size()-1; t >= 0; t--) {
    Seeds l = seedCollections.get(t);
    l.display();
  }
  
  
  flow = new FlowField(20);
  if (frameCount % 10 == 0) flow.setFlow(); //updates flow field every 6th of a second
  flow.display();
  
  for (int j = targets.size()-1; j >= 0; j--) { // iterates through each target to perform nessesary functions 
    Target l = targets.get(j);
    l.follow(flow); //calls each grass target to move along the flow field
    l.update();
    
    if(l.location.x<-10 || l.location.x>width+10 || l.location.y <-10 || l.location.y>height+10) targets.remove(l); //removes targets that have left the screen
  }

  for (int i = animals.size()-1; i >= 0; i--) {
    Animal v = animals.get(i);
    v.avoid(animals);
    
    if(targets.size() != 0) {
      int pickTarget = int(random(0, targets.size()));
      Target choose = targets.get(pickTarget);
      PVector follow = choose.location;
      v.seek(follow);
    }
    
    if(seedCollections.size() != 0) {
      int pickTarget = int(random(0, seedCollections.size()));
      Seeds choose = seedCollections.get(pickTarget);
      PVector follow = choose.location;
      v.findFood(follow);
    }
    
    if(v.health == 0) animals.remove(i);
    v.update();
    
  }
  if(keyPressed == true && key == 's') seedCollections.add(new Seeds());
  if(keyPressed == true && key == 'g') {targets.add(new Target(new PVector(random(0,width), random(0,height))));
  }
  
  text("Pressing the mouse creates animals",width/2-100, 10);
  text("pressing g creates grass",width/2-50, 30);
  text("pressing s creates seeds",width/2-50, 50);
}

void mouseReleased() {
  int choose = int(random(1, 4));
  if (choose == 1) animals.add(new Cow(new PVector(random(0, width), random(0, height))));
  if (choose == 2) animals.add(new Pig(new PVector(random(0, width), random(0, height))));
  if (choose == 3) animals.add(new Chicken(new PVector(random(0, width), random(0, height))));
}
