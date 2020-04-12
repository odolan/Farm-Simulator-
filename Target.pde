//target class which is designed to be little grass objects for cows to follow 
class Target {
  PVector location, acceleration, velocity;
  float maxSpeed, maxForce, mass;
  PImage grass; 
  
  
  Target(PVector l) {
    location = l.copy();
    grass = loadImage("grass.png");
    velocity = new PVector(random(-2, 2), random(-5, 0));
    acceleration = new PVector(0, 0);
    maxSpeed = 1;
    maxForce = .05;
    mass = 1;
  }
  
  void update() {
    display();
    move();
    //velocity.limit(.7);
  }
  
  //targets follow a flow field 
  void follow(FlowField f) {
    PVector desiredVelocity = f.lookup(location);
    desiredVelocity.setMag(maxSpeed);
    PVector steer = PVector.sub(desiredVelocity, velocity);
    steer.limit(maxForce);
    applyForce(steer);
  }
  
  void applyForce(PVector f) {
    PVector a = f.copy().div(mass);
    acceleration.add(a);
  }
  
  void display() {
    grass.resize(30,30);
    image(grass,location.x, location.y);
  }
  
  void move() {
    velocity.add(acceleration);
    location.add(velocity);
    acceleration.mult(0);
  }
  
}
