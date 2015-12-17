class Fighter{
  PImage fighterImg;
  int x = 0;
  int y = 0;
  int type;
  int speed = 5;
  int hp;

  Fighter(int hp) {
    this.fighterImg = loadImage("img/fighter.png");
    this.x = width - this.fighterImg.width;
    this.y = (height-this.fighterImg.height)/2;
    this.type = FlightType.FIGHTER;
    this.hp = hp;
  }

  void draw() {
    image(fighterImg, this.x, this.y);

    if (isMovingUp) {
      this.move(Direction.UP);
    }
    if (isMovingDown) {
      this.move(Direction.DOWN);  
    }
    if (isMovingLeft) {
      this.move(Direction.LEFT);
    }
    if (isMovingRight) {
      this.move(Direction.RIGHT);  
    }
  }

  void shoot() {
    //shoot in front of muzzle detection
    boolean shootInFront = false;
    for (int i=0; i< bulletCount; i++)
    {
      if (bullets[i]!=null)
      {
    
      if (isHit(this.x-bullets[i].bulletImg.width,
                this.y,
                bullets[i].bulletImg.width+this.fighterImg.width,
                this.fighterImg.height,
                bullets[i].x,
                bullets[i].y,
                bullets[i].bulletImg.width,
                bullets[i].bulletImg.height))
      {
        shootInFront = true;
        break;
      }
      }
    }

    if(shootInFront==false)
    {
      if (bullets[0]==null)
      {
        bullets[0] = new Bullet(this.x-31, this.y+12);
      }
      else if (bullets[1]==null)
      {
        bullets[1] = new Bullet(this.x-31, this.y+12);
      }
      else if (bullets[2]==null)
      {
        bullets[2] = new Bullet(this.x-31, this.y+12);
      }
      else if (bullets[3]==null)
      {
        bullets[3] = new Bullet(this.x-31, this.y+12);
      }
      else if (bullets[4]==null)
      {
        bullets[4] = new Bullet(this.x-31, this.y+12);
      }
    }
  }

  void move(int direct) {
    switch (direct) {
      case Direction.UP:
        if (this.y - speed > 0) {
          this.y-= speed;
        }
        break;
      case Direction.DOWN:
        if (this.y + speed < height - 
this.fighterImg.height) {
          this.y+= speed;
        }
        break;
      case Direction.LEFT:
        if (this.x - speed > 0) {
          this.x-= speed;
        }
        break;
      case Direction.RIGHT:
        if (this.x + speed < width - 
this.fighterImg.width) {
          this.x+= speed;
        }
        break;
    }
  }

  void hpValueChange(int value)
  {
    this.hp += value;
    if (this.hp <=0) {
      state = GameState.END;
      return;
    }
    else if (this.hp >= 100) {
      this.hp = 100;
      return;
    }
    return;
  }
}
