class Bullet{
  PImage bulletImg;
  int x = 0;
  int y = 0;
  int speed = -6;
  
  Bullet(int x, int y) {
    this.bulletImg = loadImage("img/shoot.png");
    this.x = x;
    this.y = y;
  }
  
  void draw() {
    image(bulletImg, this.x, this.y);
  }
  
  void move() {
    this.x+= this.speed;  
  }
  
  boolean isOutOfBorder()
  {
    if(this.x<0){return true;}
    return false;
  }

}

void addBullet()
{  
  for (int i = 0; i < bulletCount; ++i) 
  {
    bullets[i] = null;
  }
}
