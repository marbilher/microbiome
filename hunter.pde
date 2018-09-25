
class Hunter {
  
  float hunterX, hunterY;
  float xStart, yStart;
  float r; //radius!
  float x, y;
  float xAccel, yAccel;
  float scentRadius;
  float adjustX, adjustY;
  
  Hunter (int tempXstart, int tempYstart, float tempR) {
    r = tempR;
    xStart = tempXstart;
    yStart = tempYstart;
    xAccel = .7;
    yAccel = .5;
  }
  
  

  boolean intersect(Worm other) {
    float distance = dist(x, y, other.x, other.y);
      if (distance < r + other.r) {
        return true; 
      } else {
        return false;
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


  
  void display() {
  x += adjustX;
  y += adjustY;

    strokeWeight(2);
    stroke(255, 0, 0);
    noFill();
    ellipse(x, y, r, r);

  }
  
  
  
    void chase() {
    
  float scentRadius = random(0, 100);
  float chase = random(.3, .6);
  //scent checks if worm is near, if so chases..
  
  for (int i = 0; i < worms.length; i++) {
  float scent = dist(x, y, worms[i].x, worms[i].y);  
  if (scent < scentRadius) {

if (worms[i].x < x && worms[i].y < y) {
  adjustX = -chase;
  adjustY = -chase;
} else if (worms[i].x > x && worms[i].y < y) {
  adjustX = chase;
  adjustY = -chase;
} else if (worms[i].x < x && worms[i].y > y) {
  adjustX = -chase;
  adjustY = chase;
} else if (worms[i].x > x && worms[i].y > y) {
  adjustX = chase;
  adjustY = chase;
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
    
}
  
  
  
  
  
  
}