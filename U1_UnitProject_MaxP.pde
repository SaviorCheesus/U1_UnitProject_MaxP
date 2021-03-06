float speed = 8;
float x = 0.0;
float y = 0.0;

float bulletX[];
float bulletY[];
float bulletAngle[];
boolean bulletIsActive[];
int playerAngle = 0;
int nextBullet = 0;

int block1 = 0;
int block2 = 0;
int block3 = 0;
int door = 0;

void setup()
{
  fullScreen(P2D); //Screen size (P2D to increase speed)
  bulletX = new float[10];
  bulletY = new float[10];
  bulletAngle = new float[10];
  bulletIsActive = new boolean[10];
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
      playerAngle = 0;
      }
      if (key == 'd')
      {
      x = x - speed;
      playerAngle = 1;
      }
      if (key == 's')
      {
      y = y - speed;
      playerAngle = 2;
      }
      if (key == 'a')
      {
      x = x + speed;
      playerAngle = 3;
      }
    }
}


void shooting()
{
  for (int i = 0; i <10; i++)
  {
    if ( bulletIsActive[i] )
    {
      rect(bulletX[i] -5, bulletY[i] -5, 10, 10);
      if ( bulletAngle[i] == 0)
      {
        bulletY[i]-= speed;;
      }
      else if ( bulletAngle[i] == 1)
      {
        bulletX[i]+= speed;
      }
      else if ( bulletAngle[i] == 2)
      {
        bulletY[i]+= speed;
      }
      else if ( bulletAngle[i] == 3)
      {
        bulletX[i]-= speed;
      }
    }
    
    if ( key == ' ')
    {
    bulletX[nextBullet] = width/2;
    bulletY[nextBullet] = height/2;
    bulletAngle[nextBullet] = playerAngle;
    bulletIsActive[nextBullet] = true;
    nextBullet++;
    if ( nextBullet > 9)
    {
      nextBullet = 0;
    }
  }
  
  fill (0);
  if (playerAngle == 0)
  {
    rect ((width/2) -5, (height/2) -25, 10, 10); // Put retical at the top
  }
  if (playerAngle == 1)
  {
    rect ((width/2) +15, (height/2) -5, 10, 10); // Put retical at the right
  }
  if (playerAngle == 2)
  {
    rect ((width/2) -5, (height/2) +15, 10, 10); // Put retical at the bottom
  }
  if (playerAngle == 3)
  {
    rect ((width/2) -25, (height/2) -5, 10, 10); // Put retical at the left
  }
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
  && y - (height/2) <= (height/2)-10 && y  >= (height/2)-10)
  {
    x = x - speed;
  }
 
  if ((width/2) +40 + x <= (width/2)+10 && (width/2) +40 + x >= (width/2)-10 
  && y - (height/2) -100 <= (height/2)-10 && y >= (height/2)-10)
  {
    x = x + speed;
  } 
  rect (x + (width/2) -60, y - (height/2), 20, (height/2));  // Left wall
  rect ((width/2) +40 + x, y - (height/2) - 100, 20, (height/2) + 100); // Right wall 
  
  if (door == 0)
  {
    if (y -(height/2) -70 >= (height/2) && x + (width/2) -60 <= (width/2) +10)
    {
    y = y - speed;
    }
    fill (0,242,151);
    rect(x + (width/2) -40 , y -(height/2) -100, 100, 20);
    fill (255,108,108);
  }
}


void puzzleroom()
{
  if (y + 20 -(height/2) -100 >= (height/2)-10 && y -(height/2) - 100 <= (height/2)-10 && 
  x + (width/2) -40>= (width/2) && x -380 <= (width/2))
  {
    y = y - speed;
  }

  if (y -(height/2) + 20 <= (height/2)+30 && y -(height/2) +40 >= (height/2)+30 &&
  x + (width/2) -40>= (width/2) && x -380 <= (width/2))
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

 
  if (y -(height/4) + 20 <= (height/2)+30 &&
  x - (width/2) + (width/2) -40  >= (width/2) )
  {
    y = y + speed;
  }
  rect (x -(width/2), y -(height/4), (width/2), 20 ); // Bottom wall
  
  fill (22,130,196);
  ellipse (x -(width/4), y - height + 100, 100, 100); //Switch 1
  ellipse (x -(width/4), y - (height/2) + 150, 100, 100); //Switch 2
  fill (181,208,224);
  ellipse (x -(width/3) -150, y - (height/2) - 50, 100, 100); //Goal
  
  if (bulletX[nextBullet] >= x -(width/3) -100)
  {
    door = 1;
  }
  
  if (block1 == 0)
  {
    if (bulletY[nextBullet] <=  y - height + 100)
    {
     fill (242,0,0);
     block1 = 1;
    }
    else
    {
    fill (129,0,0);
    }
    if (bulletY[nextBullet] >= y - (height/2) + 30)
    {
      bulletY[nextBullet] = bulletY[nextBullet] - speed;
    }
  }
  rect(x -(width/4)-50, y - (height/2) + 50, 100, 20);
           
  if (block1 == 1)
  {
    if (bulletY[nextBullet] >= x -(width/4)-50)
    {

    }
    else
    {
    fill (129,0,0);
    }
  }
  fill (255,108,108);
  
}