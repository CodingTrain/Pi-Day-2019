// Test Code for Pi Day 2019 Challenge
// https://thecodingtrain.com
// Based on 3Blue1Brown: https://youtu.be/HEfHFsfGXjs

Box box1;
Box box2;
int count = 0;
int digits = 5;
int timeSteps = 10000;
int wall;

void setup() {
  size(600, 200);
  wall = 200;
  box1 = new Box(50, 10, 1, 0);
  box2 = new Box(100, 100, pow(100, digits), -1.0 / timeSteps);
  box1.setConstrain(0);
  box2.setConstrain(box1.w);
}

void draw() {
  for (int i = 0; i < timeSteps; i++) {
    box1.update();
    box2.update();

    if (box1.collide(box2)) {
      float b1 = box1.bounce(box2);
      float b2 = box2.bounce(box1);
      box1.dx = b1;
      box2.dx = b2;
      count++;
    }

    if (box1.hitWall()) {
      box1.reverse();
      count++;
    }
  }

  background(0);
  fill(255);
  textSize(32);
  //text(nf(count/(pow(10, digits)), 1, digits), 10, 40);
  text(nf(count, digits+1), 10, 40);
  
  translate(wall, 0);
  stroke(255);
  line(0, 0, 0, height);
  fill(255);
  box1.show();
  box2.show();

}
