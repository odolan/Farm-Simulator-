// cow extention class
class Cow extends Animal {
  PImage cowIm;

  Cow(PVector l) {
    super(l);
    cowIm = loadImage("cow.png");
    cowIm.resize(50, 50);
  }

  void display() {
    pushMatrix();
    translate(location.x, location.y);
    image(cowIm, 0, 0);
    popMatrix();
    
    healthBar(location, health);

  }

  void overGrass() {
    for (int j = targets.size()-1; j >= 0; j--) { // iterates through each target to perform nessesary functions 
      Target l = targets.get(j);
      if (dist(l.location.x, l.location.y, location.x, location.y)<10) {
        if(health!= 10) health ++;
        targets.remove(l);
      }
    }
  }

  void seek(PVector target) {
    if(health < 10) {
      PVector desiredVelocity = PVector.sub(target, location);
      desiredVelocity.limit(maxSpeed);
      PVector steer = PVector.sub(desiredVelocity, velocity);
      steer.limit(maxForce);
      applyForce(steer);
    }
  }

  void avoid(ArrayList<Animal> vs) {
    float scale = 3.0;

    PVector total = new PVector(0, 0);
    for (Animal v : vs) {
      PVector d = PVector.sub(location, v.location);
      if (d.mag() > 0 && d.mag() < 10) {
        PVector f = d.setMag(scale / d.mag());
        f.limit(maxForce);
        total.add(f);
      }
    }
    applyForce(total);
  }
}

void healthBar(PVector location, float health) {
  int rectWidth = 40;
  stroke(0);
  noFill();
  rect(location.x+5, location.y-15, rectWidth, 10);
  fill(0);

    noStroke();

  if (health == 10) fill(0, 255, 0);
  if (health == 9) fill(100, 235, 28);  
  if (health == 8) fill(99, 224, 31);
  if (health == 7) fill(139, 156, 54);
  if (health == 6) fill(156, 142, 54);
  if (health == 5) fill(173, 113, 52);
  if (health == 4) fill(217, 100, 28);
  if (health == 3) fill(217, 82, 28);
  if (health == 2) fill(255, 73, 0);
  if (health == 1) fill(217, 31, 28);


  // Get fraction 0->1 and multiply it by width of bar
  float drawWidth = (health / 10) * rectWidth;
  rect(location.x+5, location.y-15, drawWidth, 10);
}
