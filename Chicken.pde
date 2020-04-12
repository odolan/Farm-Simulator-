
//chicken class extention 
class Chicken extends Animal {
  PImage chickenIm;
  Seeds target; 

  Chicken(PVector l) {
    super(l);
    chickenIm = loadImage("chicken.png");
    chickenIm.resize(50, 50);
    location = l.copy();
  }

  void display() {
    pushMatrix();
    translate(location.x, location.y);
    image(chickenIm, 0, 0);
    //rotate(radians(130));
    popMatrix();
    
    healthBar(location, health);
    
    if (health<9) {
      if (target != null && target.location != location) {
        findFood(target);
      } else {
        int chooseRandom = int(random(0, animals.size()-1));
        target = seedCollections.get(chooseRandom);
      }
    }
  }

  void avoid(ArrayList<Animal> vs) {
    float scale = 3.0;

    PVector total = new PVector(0, 0);
    for (Animal v : vs) {
      PVector d = PVector.sub(location, v.location);
      if (d.mag() > 0 && d.mag() < 100) {
        PVector f = d.setMag(scale / d.mag());
        f.limit(maxForce);
        total.add(f);
      }
    }
    applyForce(total);
  }
  
  void findFood(Seeds target) {
    if(health < 9) {
      PVector desiredVelocity = PVector.sub(target.location, location);
      desiredVelocity.limit(maxSpeed);
      PVector steer = PVector.sub(desiredVelocity, velocity);
      steer.limit(maxForce);
      applyForce(steer);
      
      if (desiredVelocity.copy().mag() < 11) {
        animals.remove(target);
        health = 10;
    }
    }
  }
}
