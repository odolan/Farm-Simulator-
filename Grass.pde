
// function not currently being used 

//function used to set and change the color of grass once a cow has been over it
void updateGrass(PVector location) {
  color first = color(51,102,0);
  color second = color(0,153,0);
  color third = color(51,204,51);
  
  loadPixels();
  if (pixels[int((location.y)*width+location.x)] == first) {
    pixels[int((location.y)*width+location.x)] = second;
  }
  else if (pixels[int((location.y)*width+location.x)] == second) {
    pixels[int((location.y)*width+location.x)] = third;
  }
  updatePixels();
  
}

void showGrass() {
  color first = color(51,102,0);
  color second = color(0,153,0);
  color third = color(51,204,51);
  
  color current = first; 
  
  loadPixels();
  for (int i = 0; i < height*width; i++) {
      pixels[i] = current;
    
  }
  updatePixels();
}


class GrassBundle {
  
  GrassBundle() {
    
  }
  
  
  
  
}
