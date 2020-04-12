

class Seeds {
  PImage seeds; 
  PVector location; 
  
  Seeds() {
    seeds = loadImage("SeedBundle.png");
    location = new PVector(random(0,width), random(0, height));
  }
  
  void display() {
    seeds.resize(30,30);
    image(seeds,location.x, location.y);
  }
}
