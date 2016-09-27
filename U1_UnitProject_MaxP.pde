// Je m'appelle baguette

float speed = 8;
float x = 0;
float y = 0;
float x1 = (width/2)-10;
float y1 = (height/2)-10;

void setup()
{
  fullScreen();
}

void draw()
{
  background (253,219,150);
  character();
  obstacles();
}

void character()
{
  noStroke ();
  fill (255,255,255);
  rect((width/2)-10 , (height/2)-10,20,20);
  
  if (keyPressed == true && key == 'd')
  {
    x = x - speed;
  }
  if (keyPressed == true && key == 'a')
  {
    x = x + speed;
  }
  if (keyPressed == true && key == 'w')
  {
    y = y + speed;
  }
  if (keyPressed == true && key == 's')
  {
    y = y - speed;
  }
}

void obstacles()
{
  tint(127, 127);
  fill (255,108,108);
  rect (x, y, 20, height);
  rect ((width - 20) + x, y, 20, height);
  rect (x, y, (width/2) -40, 20);
  rect ((width/2) +40 + x, y, (width/2) -40, 20);
  rect (x, (height - 20) + y, width, 20);
}