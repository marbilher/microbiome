Worm[] worms = new Worm[175];
Hunter hunter;
float x, y;

void setup() {
  size(800, 800, FX2D);
  hunter = new Hunter((width/2), (height/2), 10);
  
  for (int i = 0; i < worms.length; i++) {
  worms[i] = new Worm(random(width), random(height));
  }
  
}


void draw() {
  
  background(0);
  
  for (int i = 0; i < worms.length; i++) {
    
  worms[i].flee();  
  worms[i].step();
  worms[i].display();
  worms[i].reposition();
  
    if (hunter.intersect(worms[i])) {
    hunter.r += 1;
    worms[i].x = 1000;

            
    if(hunter.r >= 100) {
      //noLoop();
      hunter.r = 100;     
      }
    }
  }
  hunter.reposition();
  hunter.display();
  hunter.chase();
}