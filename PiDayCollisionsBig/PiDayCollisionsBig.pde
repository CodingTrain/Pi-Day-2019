import java.math.BigInteger;
// Test Code for Pi Day 2019 Challenge
// https://thecodingtrain.com
// Based on 3Blue1Brown: https://youtu.be/HEfHFsfGXjs

import java.math.BigInteger;
import java.math.BigDecimal;
import java.math.MathContext;

Box box1;
Box box2;
BigInteger count = BigInteger.ZERO;
int digits = 4;
int timeSteps = 1;

MathContext mc = new MathContext(100);

BigInteger big(int num) {
  return BigInteger.valueOf(num);
}

BigDecimal big(float num) {
  return BigDecimal.valueOf(num);
}

void setup() {
  size(600, 200);
  box1 = new Box(150, 10, BigInteger.ONE, 0);
  BigInteger mass = big(100).pow(digits);
  box2 = new Box(200, 100, mass, -1.0/50);
  box1.setConstrain(0);
  box2.setConstrain(box1.w);
}

void draw() {
  for (int i = 0; i < timeSteps; i++) {
    box1.update();
    box2.update();

    if (box1.collide(box2)) {
      BigDecimal b1 = box1.bounce(box2);
      BigDecimal b2 = box2.bounce(box1);
      box1.dx = b1;
      box2.dx = b2;
      count = count.add(BigInteger.ONE);
    }

    if (box1.hitWall()) {
      box1.reverse();
      count = count.add(BigInteger.ONE);
    }
  }

  background(0);
  fill(255);
  box1.show();
  box2.show();

  fill(255);
  textSize(32);
  text(count.intValue(), 10, 40);
}
