PImage img,bg;
ArrayList particles = new ArrayList();

void setup() {
  size(700,800);
  img = loadImage("bottle.png");
   bg = loadImage("b.jpg");
 
  stroke(255, 0);
  for(int i = 0; i <1000; i++){
    particles.add(new Particle(new PVector(mouseX, mouseY), new PVector(mouseX-pmouseX, 0), random(10,30))); 
  }
}

void draw() {
//  background(0);
  background(16,16,16);
//    background(bg);
  image(img, 230, 450);
//  ellipse(mouseX, mouseY, 15, 15);
  for(int i = 0; i < particles.size(); i++){
     Particle p = (Particle) particles.get(i);
     p.draw();
     p.move();
  }
//saveFrame("line-######.png");
}

class Particle {
  PVector location, velocity;
  float size, msize;
  color c;

  Particle(PVector l, PVector v, float s) {
    
    location = l; velocity = v;

    this.size = s;
    this.msize = s;
    
    float col = random(0,13);
    int x= parseInt(col);
 
         //spectrum of colors to create a gloomy look
    switch(x){
    case 0:
    c = color(153,115,0);
    break;
    case 1:
    c= color(85, 128, 0);
    //green
    break;
    case 2:
    c= color(102,102,153);
    //lightpurple
    //
    break;
    case 3:
    c = color(102,153,153);
    //teal
    break;
    case 4:
    c= color(224,224,235);
    //grey
    break;
    case 5:
    c= color(0, 0 , 102) ;
    //nayblue
    break;
    case 6:
    c= color(255,255,255) ;
    //black
    break;
    case 7:
    c= color(47,79,79) ;
    //slategreen
    break;
    case 8:
    c= color(105,105,105) ;
    //darkgray
    break;
    case 9:
    c= color(107,0,179) ;
    //darkgray
    break;
     case 10:
    c= color(8,8,8) ;
    //darkgray
    break;
     case 11:
    c= color(16,16,16) ;
    //darkgray
    break;
     case 12:
    c= color(32,32,32) ;
    //darkgray
    break;
     case 13:
    c= color(40,40,40) ;
    //darkgray
    break;
  }
    
  }

  void draw() {
    fill(c, 30);
    strokeWeight(1+size/10);
    System.out.println("\n"+c);
 
 //create bubbles
    ellipse(location.x, location.y, size, size); 
    if (size > 0) {
      size-=0.3;
    }else{
       size = msize;
       PVector newvelocity = new PVector(mouseX-pmouseX, 0);
       // Add some random lift to each particle and random x movement.
       //change the speed/direction of particles in x/y plane randomly
       newvelocity.y = random(-3, -1);
       newvelocity.x += random(-1, 1);
      //update it for the particle to create movement
       update(new PVector(mouseX, mouseY), newvelocity);
       
    }
  }
  
  void update(PVector loc, PVector vel){
    location = loc.get(); 
    velocity = vel.get();
  }
  
  void move(){
    location.add(velocity);
  }
}
