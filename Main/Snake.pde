class Snake{
  float speed, x, y, size;
  Frog frog;
  PImage snake;
  Snake(float xpos, float ypos, Frog f){
    x = xpos;
    y = ypos;
    speed = random(1,4);
    size = f.size + 5;
    frog = f;
    snake = loadImage("snake.png");
  }
  
  void display(){
    //translate(width/2 - frog.x, height/2 - frog.y);
    fill(100,205, 180);
    //rect(x, y, size, size);
    //fill(0);
    //ellipse(x, y, 5,5);
    image(snake, x,y,size,size);
  }
  
  void move(){
    if(frog.x > x){
      x += speed;
    }
    if(frog.x < x){
      x -= speed;
    }
    if(frog.y > y){
      y += speed;
    }
    if(frog.y < y){
      y -= speed;
    }
  }
  
  void hitBox(Snake s1, Snake s2){
    float halfDist = (s1.x + s2.x)/2;
    if(s1.x > halfDist){
      s1.speed -= .001;
      if(s1.speed <= 0){
        speed = random(1,4);
      }
    }
  }
}
