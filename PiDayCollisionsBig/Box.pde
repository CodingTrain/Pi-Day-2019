class Box {
  BigDecimal x;
  BigDecimal dx;
  BigInteger m;
  float y;
  float w;

  float xConstrain;

  Box(float x, float w, BigInteger m, float dx) {
    this.x = big(x);
    this.m = m;
    this.w = w;
    this.y = height - this.w - 1;
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

  BigDecimal bounce(Box b) {
    BigDecimal sumM = new BigDecimal(this.m.add(b.m));
    BigDecimal dx1 = new BigDecimal(this.m.subtract(b.m));
    dx1 = dx1.divide(sumM, mc).multiply(this.dx);
    BigDecimal dx2 = new BigDecimal(b.m.multiply(big(2)));
    dx2 = dx2.divide(sumM, mc).multiply(b.dx);
    return dx1.add(dx2);
  }

  boolean hitWall() {
    return this.x.compareTo(BigDecimal.ZERO) == -1;
  }

  void reverse() {
    this.dx = this.dx.multiply(big(-1.0));
  }

  boolean collide(Box b) {

    BigDecimal leftA = this.x;
    BigDecimal rightA = this.x.add(new BigDecimal(this.w));

    BigDecimal leftB = b.x;
    BigDecimal rightB = b.x.add(new BigDecimal(b.w));

    return !(rightA.compareTo(leftB) < 0 || leftA.compareTo(rightB) > 0);
  }
}
