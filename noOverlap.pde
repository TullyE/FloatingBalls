color[] colors = new color[]{color(224, 187, 228), color(149, 125, 173), color(210, 145, 188), color(254, 200, 216), color(255, 223, 211)};
ArrayList<Ball> balls = new ArrayList<>();
int alpha = 255;
int maxSize = 100;
boolean growing = true;
int total = 500;
void setup()
{
  size(1792, 828 );
  //noLoop();
  //frameRate(15);
  balls.add(new Ball((int) (Math.random() * width), (int) (Math.random() * height), maxSize, alpha, colors[(int) (Math.random() * 5)], false));
}

void draw()
{
  if (growing)
  {
    System.out.println(balls.size() + " / " + total);

    if (balls.size() > total)
    {
      growing = false;
    }
    background(0);
    for (Ball myBall : balls)
    {
      myBall.show();
    }
    balls.add(calcNew(0));
  } else
  {
    if (balls.size() == 0)
    {
      maxSize = 100;
      growing = true;
    } else
    {
      balls.remove((int) (Math.random() * balls.size()-1));
      background(0);
      for (Ball myBall : balls)
      {
        myBall.show();
      }
    }
  }
}

Ball calcNew(int i)
{
  if (i > 1000)
  {
    maxSize -= 1;
    return new Ball(0, 0, 0, 0, 0, true);
  }
  int suggestedX = (int) (Math.random() * width);
  int suggestedY = (int) (Math.random() * height);
  int suggestedSize = maxSize;
  for (Ball myBall : balls)
  {
    if (myBall.overlapping(suggestedX, suggestedY, suggestedSize))
    {
      //System.out.println("Overlap");
      return calcNew(i + 1);
    }
  }
  return new Ball(suggestedX, suggestedY, suggestedSize, alpha, colors[(int) (Math.random() * 5)], false);
}

void mousePressed()
{
  save("noOverlapDark.png");
  exit();
}
