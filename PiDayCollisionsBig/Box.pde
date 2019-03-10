class Box {
  BigDecimal x;
  BigDecimal dx;
  BigInteger m;
  float y;
  float w;

  float xConstrain = -100;

  Box(float x, int w, BigInteger m, float dx) {
    this.x = big(x);
    this.y = height - w;
    this.w = w;
    this.m = m;
    this.dx = big(dx);
  }


  void setConstrain(float x) {
    xConstrain = x;
  }

  void show() {
    fill(255);
    float pixelX = x.floatValue();
    square(constrain(pixelX, xConstrain, width), y, w);
  }

  void update() {
    x = x.add(dx);
  }

  void bounce(Box b) {
    BigDecimal v1 = this.dx;
    BigDecimal v2 = b.dx;
    BigDecimal m1 = new BigDecimal(this.m);
    BigDecimal m2 = new BigDecimal(b.m);
    BigDecimal sumM = m1.add(m2);

    this.dx = m2.multiply(v2).multiply(big(2.0));
    this.dx = this.dx.add(v1.multiply(m1.subtract(m2)));
    this.dx = dx.divide(sumM, mc);

    b.dx = m1.multiply(v1).multiply(big(2.0));
    b.dx = b.dx.add(v2.multiply(m2.subtract(m1)));
    b.dx = b.dx.divide(sumM, mc);
  }

  boolean hitWall() {
    return this.x.compareTo(wall) == -1;
  }

  void reverse() {
    this.dx = this.dx.negate();
  }

  boolean collide(Box b) {

    BigDecimal leftA = this.x;
    BigDecimal rightA = this.x.add(new BigDecimal(this.w));

    BigDecimal leftB = b.x;
    BigDecimal rightB = b.x.add(new BigDecimal(b.w));

    return !(rightA.compareTo(leftB) < 0 || leftA.compareTo(rightB) > 0);
  }
}
