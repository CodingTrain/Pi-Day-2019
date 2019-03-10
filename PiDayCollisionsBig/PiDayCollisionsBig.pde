// Test Code for Pi Day 2019 Challenge
// https://thecodingtrain.com
// Based on 3Blue1Brown: https://youtu.be/HEfHFsfGXjs

import java.math.BigInteger;
import java.math.BigDecimal;
import java.math.MathContext;

Box box1;
Box box2;
BigDecimal wall;
int count = 0;
int digits = 5;

MathContext mc = new MathContext(100);

BigInteger big(int num) {
  return BigInteger.valueOf(num);
}

BigDecimal big(float num) {
  return BigDecimal.valueOf(num);
}

void setup() {
  size(1000, 200);
  box1 = new Box(300, 10, BigInteger.ONE, 0);
  BigInteger mass = big(100).pow(digits-1);
  box2 = new Box(400, 100, mass, -1.0);
  wall = big(200.0);
  //box1.setConstrain(0);
  //box2.setConstrain(box1.w);
}

void draw() {
  box1.update();
  box2.update();
  //box1.x = box1.x.min(box2.x.add(BigDecimal.ONE));


  while (box1.collide(box2) || box1.hitWall()) {    

    if (box1.collide(box2)) {
      count++;      
      box1.bounce(box2);
      box1.update();
      box2.update();
      BigDecimal constraint1 = wall.subtract(BigDecimal.ONE);
      if (box1.x.compareTo(constraint1) == -1) {
        box1.x = constraint1;
      }
    }

    if (box1.hitWall()) {
      count++;
      box1.reverse();
      box1.update();
      box2.update();
      BigDecimal constraint2 = box2.x.add(BigDecimal.ONE);
      if (box1.x.compareTo(constraint2) == 1) {
        box1.x = constraint2;
      }
    }
  }

  background(0);
  stroke(255);
  line(wall.intValue(), 0, wall.intValue(), height);
  fill(255);
  box1.show();
  box2.show();


  fill(255);
  textSize(32);
  text(nf(count / pow(10, digits-1), 1, digits-1), 10, 40);
}
