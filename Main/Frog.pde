class Frog{
  PImage[] frogDown, frogUp, frogRight, frogLeft;
  PImage currImage;
  int x, y, dx, dy, size, speed, lastLick;
  boolean left, right, up, down;
  
  Frog(int xpos, int ypos, int s){
    x = xpos;
    y = ypos;
    dx = 0;
    dy = 0;
    size = s;
    speed = 5;
    left = false;
    right = false;
    up = false;
    down = false;
    lastLick = 0;
    frogDown = new PImage[2];
    frogDown[0] = loadImage("FdownJump.png");
    frogDown[1] = loadImage("Fdown.png");
    frogUp = new PImage[2];
    frogUp[0] = loadImage("FupJump.png");
    frogUp[1] = loadImage("Fup.png");
    frogLeft = new PImage[2];
    frogLeft[0] = loadImage("FleftJump.png");
    frogLeft[1] = loadImage("Fleft.png");
    frogRight = new PImage[2];
    frogRight[0] = loadImage("FrightJump.png");
    frogRight[1] = loadImage("Fright.png");
    currImage = frogDown[1];
  }
  
  void display(){
    int imageSize = size + 55;
    //translate(width/2 - frog.x, height/2 - frog.y);
    //fill(200,80,240);
    //rect(x, y, size,size);
    image(currImage, x - (imageSize)/2, y - (imageSize)/2, imageSize, imageSize);
  }
  
  void move(){
    if(right){
      x += speed;
      dx -= speed;
      takesImage(frogRight[1]);
      if(frameCount % 40 == 0){
        takesImage(frogRight[0]);
      }
      
    }
    if(left){
      x -= speed;
      dx += speed;
      takesImage(frogLeft[1]);
      if(frameCount % 40 == 0){
        takesImage(frogLeft[0]);
      }
    }
    if(up){
      y -= speed;
      dy += speed;
      takesImage(frogUp[1]);
      if(frameCount % 40 == 0){
        takesImage(frogUp[0]);
      }
    }
    if(down){
      y += speed;
      dy -= speed;takesImage(frogDown[1]);
      if(frameCount % 40 == 0){
        takesImage(frogDown[0]);
      }
    }
  }
  
  
  void takesImage(PImage image){
    currImage = image;
  }
  //void setLick(
  
  void eat(){
    //print("here1: " + (frameCount - lastLick <= 30) + "\n");
    float tScale = 5;
    if(mousePressed && frameCount - lastLick > 30){
      //print("here 2\n");
      lastLick = frameCount;
      //translate(width/2 - frog.x, height/2 - frog.y);
      strokeWeight(2);
      line(x, y , mouseX+frog.x-width/2, mouseY+frog.y-height/2);
      
      
    }
   }
}
