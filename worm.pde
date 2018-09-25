

class Worm {
  
  float xStart;
  float yStart;
  float x, y;
  float adjustX;
  float adjustY;
  float scent;
  float fear;
  float r;
  
  Worm (float tempxStart, float tempyStart){
    x = tempxStart;
    y = tempyStart;
    r = 6;
  }
  
  void flee() {
    
  float fearRadius = random(0, hunter.r*3);
  float chase = random(.3, .6);
  //scent checks if hunter is near, if so then worms run away..
  scent = dist(x, y, hunter.x, hunter.y);  
  if (scent < fearRadius) {

if (hunter.x < x && hunter.y < y) {
  adjustX = +chase;
  adjustY = +chase;
} else if (hunter.x > x && hunter.y < y) {
  adjustX = -chase;
  adjustY = +chase;
} else if (hunter.x < x && hunter.y > y) {
  adjustX = +chase;
  adjustY = -chase;
} else if (hunter.x > x && hunter.y > y) {
  adjustX = -chase;
  adjustY = -chase;
}


     //levy flight, increasing step size when hunter near..
     float fear = .56;
  if (adjustY > fear || adjustY < -fear) {
    adjustY *= 3;
    }
  if (adjustX > fear || adjustX < -fear) {
    adjustX *= 3;
    }

  }
    
}
    
  void reposition() {
    if (x > width) {
      x = 0;
    } else if (x < 0) {
      x = width;
    } else if (y > height) {
      y = 0;
    } else if (y < 0) {
      y = height;
  }
  }
  
  
  void step() {
    
    
  float stepx = (random(-1.5, 1.5));
  float stepy = (random(-1.5, 1.5));
  
    
  
  x += stepx + adjustX;
  y += stepy + adjustY;
  println(adjustX);
  }
  
  void display() {
    
    //checking if fleeing, making red if they are
    if (abs(adjustX) > 1.0) {
    fill(255, 0, 0);
    } else {
      fill(255);
    }
    noStroke();
    ellipse(x, y, r, r);
  }
}
  