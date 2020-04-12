
//pig extention class
class Pig extends Animal {
  PImage chickenIm;
  int numOfAnimals = 0;
  Animal killChoice; 

  Pig(PVector l) {
    super(l);
    chickenIm = loadImage("pig.png");
    chickenIm.resize(50, 50);
    location = l.copy();
  }

  void display() {
    pushMatrix();
    translate(location.x, location.y);
    image(chickenIm, 0, 0);
    //rotate(radians(20));
    popMatrix();

    healthBar(location, health);

    if (health<=9) {
      if (killChoice != null && killChoice.location != location) {
        angryKill(killChoice);
      } else {
        int chooseRandom = int(random(0, animals.size()-1));
        killChoice = animals.get(chooseRandom);
      }
    }
  }

  // if pig health gets to be 5 or it goes after and attacks animal 
  void angryKill(Animal v) {
    PVector randomLocation = v.location;
    PVector desiredVelocity = PVector.sub(randomLocation, location);
    PVector steer = PVector.sub(desiredVelocity, velocity);
    steer.limit(maxForce);
    applyForce(steer);

    if (desiredVelocity.copy().mag() < 11) {
      animals.remove(v);
      health = 10;
    }
  }
}
