class Ball
{
  private int x;
  private int y;
  private int size;
  private int alpha;
  private color myCol;
  private boolean isDummy;

  Ball(int x, int y, int size, int alpha, color myCol, boolean isDummy)
  {
    this.x = x;
    this.y = y;
    this.size = size;
    this.alpha = alpha;
    this.myCol = myCol;
    this.isDummy = isDummy;
  }

  void show()
  {
    noStroke();
    fill(myCol, alpha);
    ellipse(this.x, this.y, this.size, this.size);
  }
  boolean overlapping(int x2, int y2, int radius)
  {
    // d=√((x_2-x_1)²+(y_2-y_1)²) 
    int closest = radius + this.size/2;
    double distance = Math.sqrt(Math.pow(x2 - this.x, 2) + Math.pow(y2 - this.y, 2));
    return distance < closest;
  }

  boolean isDummy()
  {
    return this.isDummy;
  }
}
