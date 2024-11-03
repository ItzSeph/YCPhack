Frog frog; 
int spawnWidth = width * width;
int spwanHeight = height * height;
int frogSize = 40;
ArrayList<Fly> flies;
ArrayList<Snake> snakes;
PImage grass;
void setup(){
  size(900,900);
  fill(200,187, 209);
  grass = loadImage("grass.jpeg");
  frog = new Frog(width/2, height/2, 20);
  flies = new ArrayList<Fly>();
  snakes = new ArrayList<Snake>();
  for(int i = 0; i < 2; i ++){
    snakes.add(new Snake(random(0,width), random(0,height), frog));
  }
  for(int i = 0; i < 1000; i ++){
    flies.add(new Fly(random(-spawnWidth, spawnWidth), random(-spwanHeight, spwanHeight), frogSize, i));
  }
  smooth();
  rectMode(CENTER);
}

void draw(){
  strokeWeight(0);
  background(200,187, 209);
  translate(width/2 - frog.x, height/2 - frog.y);
  image(grass, 0,0, width- frog.x - width/2, height -frog.y -height/2);
  frog.eat();
  frog.display();
  frog.move();
  
  for(int i =0 ; i < snakes.size(); i ++){
    snakes.get(i).display();
    snakes.get(i).move();
  }
  for(int i = 0; i < flies.size(); i ++){
    flies.get(i).move();
    flies.get(i).display();
    if(flies.get(i).isEaten()){
      flies.remove(i);
      flies.add(new Fly(random(-spawnWidth,spawnWidth), random(-spwanHeight, spwanHeight), frogSize, 1));
    }
  }
  if(enemyCollide(frog, snakes)){
    gameOver();
  }
}


void keyPressed(){
  //if (key == 'w' || key == 'a' || key == 'd' || key == 's' && frameCount % 180 == 0){
  //  flies.add(new Fly(random(0,width), random(0, height), 20.0, 1));
  //}
  if(key == 'w'){
    frog.up = true;
  }
  if(key == 's'){
    frog.down = true;
  }
  if(key == 'a'){
    frog.left = true;
  }
  if(key == 'd'){
    frog.right = true;
  }
}

void keyReleased(){
  if(key == 'w'){
    frog.up = false;
  }
  if(key == 's'){
    frog.down = false;
  }
  if(key == 'a'){
    frog.left = false;
  }
  if(key == 'd'){
    frog.right = false;
  }
}

boolean enemyCollide(Frog frog, ArrayList<Snake> snakes){
  for(int i =0; i < snakes.size(); i ++){
    float xDis = (frog.x + frog.size) - (snakes.get(i).x + snakes.get(i).size);
    float yDis = (frog.y + frog.size) - (snakes.get(i).y + snakes.get(i).size);
    float combinedHalfSize = frog.size/2 + snakes.get(i).size/2;
    if(abs(xDis) < combinedHalfSize && abs(yDis) < combinedHalfSize){
      return true;
    }
  }
  return false;
}


void gameOver(){
  for(int i = 0; i < snakes.size(); i ++){
    snakes.get(i).speed = 0;
  }
  for(int i = 0; i < flies.size(); i ++){
    flies.get(i).speed = 0;
  }
  frog.speed = 0;
  textSize(20);
  fill(255,0,0,30);
  rect(0, 0 , spawnWidth, spwanHeight);
  fill(255);
  text("Game Over!", width/2, height/2 - 40);
  fill(255);
  text("Click to Restart", width/2, height/2);
  if(mousePressed){
    setup();
  }
}
