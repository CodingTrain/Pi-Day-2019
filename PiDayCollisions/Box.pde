class Box {
  float x, y;
  float w;
  float m;
  float dx;

  Box(float x, float w, float m, float dx) {
    this.x = x;
    this.m = m;
    this.w = w;//sqrt(this.m) * scale;
    this.y = height-this.w-1;
    this.dx = dx;
  }

  void show() {
    fill(255);
    square(x, y, w);
  }

  void update() {
    x += dx;
  }

  float bounce(Box b) {
    float sumM = this.m + b.m;
    float dx2 = ((this.m - b.m) / sumM) * this.dx +
      ((2 * b.m /  sumM)) * b.dx;
    return dx2;
  }
  
  boolean hitWall() {
    return this.x <= 0; 
  }
  
  void reverse() {
    this.dx *= -1;
  }

  boolean collide(Box b) {

    float leftA = this.x;
    float rightA = this.x + this.w;
    float topA = this.y;
    float bottomA = this.y + this.w;

    float leftB = b.x;
    float rightB = b.x + b.w;
    float topB = b.y;
    float bottomB = b.y + b.w;

    return !(rightA < leftB  || leftA > rightB || bottomA < topB || topA > bottomB);
  }
}
