
// the main class animal that handles the creation and running of functions that have multiples extentions 
class Animal {
  PVector location, velocity, acceleration, target; 
  float mass, age, lifespan, maxSpeed, maxForce, health; 

  Animal(PVector l) {
    location = l.copy();
    velocity = new PVector(random(-2, 2), random(-5, 0));
    acceleration = new PVector(0, 0);
    age = 0;
    maxSpeed = .9;
    maxForce = .05;
    mass = 1;
    health = 10;
  }

  void update() {
    move();
    fence();
    overGrass();
    addHunger();
    display();
    velocity.limit(2);
  }

  void display() {
  }

  void addHunger() {
    if (frameCount % 600 == 0) health --;
  }

  void fence() {
    if (location.x<0 || location.x>width) velocity.x = velocity.x * -1;
    if (location.y<-10 || location.y>height) velocity.y = velocity.y * -1;
  }
   
   
  // main move function that adds up all forces 
  void move() {
    velocity.add(acceleration);
    location.add(velocity);
    acceleration.mult(0);
  }

  
  void applyForce(PVector f) {
    PVector a = f.copy().div(mass);
    acceleration.add(a);
  }

  void setTarget(PVector t) {
    target = t.copy();
  }

  //seek function to follow a target
  void seek(PVector target) {
  }
  //avoid function to move away from undesired object 
  void avoid(ArrayList<Animal> vs) {
  }
  //function that lets cow eat grass and chickens eat seeds 
  void overGrass() {
  }
  //lets chicken find seeds
  void findFood(PVector target) {
  }
}
