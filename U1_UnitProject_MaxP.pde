float speed = 8;
float x = 0.0;
float y = 0.0;
int shooting = 0;
float bulletX = 0;
float bulletY = 0;
int angle = 0;
float bulletSpeed = 20;



void setup()
{
  fullScreen(P2D); //Screen size (P2D to increase speed)
}

void draw()
{
  background (253,219,150);
  tint(127, 127);
  fill (255,108,108);
  startText();
  room1();
  corridor1();
  puzzleroom();
  enemyroom();
  
  character();
  shooting();
}

void startText()
{
  textSize(20);
  text ("Hello! Welcome to this little game of mine.", (x/2) +40, (y/2) +60);
  text ("The goal of this game is to use your blaster 'space',", (x/2) +40, (y/2) +100);
  text ("to solve a veriety of puzzles and obstacles.", (x/2) +40, (y/2) +140);
  text ("I should probably explain the controls further.", (x/2) +40, (y/2) +180);
  text ("Use the WASD keys to move in their respective directions,", (x/2) +40, (y/2) +220);
  text ("and as mentioned before, use space to shoot.", (x/2) +40, (y/2) +260);
  text ("Good luck, and may you do your best.", (x/2) +40, (y/2) +300);
}

void character()
{
  noStroke ();
  fill (255,255,255);
  rect((width/2)-10 , (height/2)-10,20,20);
  
  if (keyPressed == true)
  {
    if (key == 'w')
  {
    y = y + speed;
    angle = 1;
  }
  if (key == 'd')
  {
    x = x - speed;
    angle = 2;
  }
  if (key == 's')
  {
    y = y - speed;
    angle = 3;
  }
  if (key == 'a')
  {
    x = x + speed;
    angle = 4;
  }
  }
}

void shooting()
{
  if (keyCode == ' ' && shooting == 0)
  {
    shooting = 1;

  }

  if (shooting == 1)
  {
    if (angle == 1)
    {
    rect ((width/2) + bulletX -5, (height/2) + bulletY -25, 10, 10); // Shoot topwards
    bulletY = bulletY - 10;
    }
    if (angle == 2)
    {
    rect ((width/2) + bulletX +15, (height/2) + bulletY -5,10 , 10); // Shoot rightwards
    bulletX = bulletX + 10;
    }
    if (angle == 3)
    {
    rect ((width/2) + bulletX -5, (height/2) + bulletY +15, 10 ,10); // Shoot bellowards
    bulletY = bulletY + 10;
    }
    if (angle == 4)
    {
    rect ((width/2) + bulletX -25, (height/2) + bulletY -5, 10, 10); // Shoots leftwards
    bulletX = bulletX - 10;
    }
  else if (shooting == 0)
  {
    bulletX = 0;
    bulletY = 0;
  }
  }
  if (mousePressed == true);
  {
    shooting = 0;
  }
  
  fill (0);
  if (angle == 1)
  {
    rect ((width/2) -5, (height/2) -25, 10, 10); // Put retical at the top
  }
  if (angle == 2)
  {
    rect ((width/2) +15, (height/2) -5, 10, 10); // Put retical at the right
  }
  if (angle == 3)
  {
    rect ((width/2) -5, (height/2) +15, 10, 10); // Put retical at the bottom
  }
  if (angle == 4)
  {
    rect ((width/2) -25, (height/2) -5, 10, 10); // Put retical at the left
  }
}
    
void room1()
{
  if (x + 20 >= (width/2)-10 && y <= (height/2)-10)
  {
    x = x - speed;
  }
  rect (x, y, 20, height);  // Left wall

  if ((width - 20) + x <= (width/2)+10 && y <= (height/2)-10)
  {
    x = x + speed;
  }
  rect ((width - 20) + x, y, 20, height); // Right wall

  if (y + 20 >= (height/2)-10 && y <= (height/2)-10 && x + (width/2) +40  <= (width/2))
  {
    y = y - speed;
  }  
  if (y + 20 >= (height/2)-10 && y <= (height/2)-10 && x + (width/2) -40  >= (width/2))
  {
    y = y - speed;
  }
  rect (x, y, (width/2) -40, 20); // Top left wall
  rect ((width/2) +40 + x, y, (width/2) -40, 20); // Top right wall
 
  if (y + height <= (height/2)+30 )
  {
    y = y + speed;
  }
  
  rect (x, (height - 20) + y, width, 20); // Bottom wall
} 

void corridor1()
{  
  if (x + (width/2) -40 >= (width/2)-10 && x + (width/2) -40 <= (width/2)+10 
  && y - (height/2) <= (height/2)-10 && y >= (height/2)-10)
  {
    x = x - speed;
  }
 
  if ((width/2) +40 + x <= (width/2)+10 && (width/2) +40 + x >= (width/2)-10 
  && y - (height/2) <= (height/2)-10 && y >= (height/2)-10)
  {
    x = x + speed;
  } 
  rect (x + (width/2) -60, y - (height/2), 20, (height/2));  // Left wall
  rect ((width/2) +40 + x, y - (height/2), 20, (height/2)); // Right wall 
}

void puzzleroom()
{
  if (y + 20 -(height/2) -100 >= (height/2)-10 && y -(height/2) - 100 <= (height/2)-10 && 
  x + (width/2) >= (width/2) && x -380 <= (width/2))
  {
    y = y - speed;
  }

  if (y -(height/2) + 20 <= (height/2)+30 && y -(height/2) +40 >= (height/2)+30 &&
  x + (width/2) >= (width/2) && x -380 <= (width/2))
  {
    y = y + speed;
  }
  
  rect (x - 280, y -(height/2) - 100, (width/2) + 240, 20); // Corridor Supperior
  rect (x - 280, y -(height/2), (width/2) + 240, 20); // Corridor Inferior
  
  fill (79,229,155);
  rect (x - 400, y -100 -(height/2), 120, 120); // Where you can move
  fill (255,108,108);
  
  if (x -380 >= (width/2)-10 && y - (height) <= (height/2)-10)
  {
    x = x - speed;
  }
  rect (x - (width/2), y - (height), 20, (width/2) - 30);  // Left wall


  rect (x, y - height, 20, (height/2) - 100); // Right wall 1
  rect (x, y - (height/2), 20, (height/4) +20); // Right wall 2


  if (y - height + 20 >= (height/2)-10 && y - height <= (height/2)-10 && 
  x - (width/2) + (width/2) -40  >= (width/2))
  {
    y = y - speed;
  }
  rect (x - (width/2), y - height, (width/2), 20); // Top Wall

 
  if (y -(height/4) + 20 <= (height/2)+30 )
  {
    y = y + speed;
  }
  rect (x -(width/2), y -(height/4), (width/2), 20); // Bottom wall
}

void enemyroom()
{
  if (y + 20 -(height/2) -100 >= (height/2)-10 && y -(height/2) - 100 <= (height/2)-10 && 
  x + width -40  >= (width/2) && +(width/2) + 40 <= (width/2))
  {
    y = y - speed;
  }

  if (y -(height/2) + 20 <= (height/2)+30 && y -(height/2) +40 >= (height/2)+30 &&
  x + width -40  >= (width/2) && x +(width/2) +40 <= (width/2))
  {
    y = y + speed;
  }
  
  rect (x +(width/2) +40, y -(height/2) -100, (width/2) -40, 20); // Corridor Supperior
  rect (x +(width/2) +40, y -(height/2), (width/2) -40, 20); // Corridor Inferior
}