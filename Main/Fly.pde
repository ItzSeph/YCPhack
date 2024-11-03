//Figure 8 Motion
class Fly{
  //static int count = 1;
  float speed, angle, radius, revX, revY, centerX, centerY, objectX, objectY;
  int id;
  //PImage[] flySprite;
  //PImage currImage;
  
  Fly(float xpos, float ypos, float r, int id){
    revX = xpos;
    revY = ypos;
    centerX = 0;
    centerY = 0;
    angle = 0;
    speed = random(0.03, 0.09);
    radius = r;
    this.id = id;
    //flySprite = new PImage[2];
    //flySprite[0] = loadImage("flyUp.png");
    //flySprite[1] = loadImage("flyDown.png");
    //currImage = flySprite[1];
    //flySprite = loadImage("fly.png");
    
    //if(id==0){
    //  //javax.swing.JOptionPane.showMessageDialog(null, "" + (radius));
    //  javax.swing.JOptionPane.showMessageDialog(null, "" + (revX + radius*2));
    //}
  }
  
  void move(){
    
    //translate(width/2 - frog.x, height/2 - frog.y);
    

    angle += speed;
  }

  void display(){
    
    fill(0);
    //if (id == 0) {
    //  fill(0,0,0);
    //      //javax.swing.JOptionPane.showMessageDialog(null, "" + (revX + radius));

    //}
      
      
    centerX = revX + radius * cos(angle);
    centerY = revY + radius * sin(angle);
    //strokeWeight(2);
    //circle(centerX, centerY, radius);
    //line(revX,revY,centerX,centerY);
    circle(centerX,centerY,radius);
    //image(currImage, centerX, centerY, radius, radius);
    //currImage = flySprite[1];
    //if(frameCount % 40 == 0){
    //  currImage = flySprite[0];
    //}
        //rect(centerX,centerY,radius, radius);
        //rect(revX + radius, revY - radius, radius, radius);
  }
  
  boolean isEaten(){  
      //if (id == 0) {
      //  print(centerX+radius/2+"\n");
      //  print(
      //  (mouseY <= centerY + radius/2 + frog.dy) && (mouseY >= centerY - radius/2 + frog.dy));
      //}
      //rect(centerX,centerY,radius, radius);
      return mousePressed && (mouseX <= centerX+radius/2+frog.dx) && (mouseX >= centerX - radius/2+frog.dx) &&
        (mouseY <= centerY + radius/2 + frog.dy) && (mouseY >= centerY - radius/2 + frog.dy);
  }
}
