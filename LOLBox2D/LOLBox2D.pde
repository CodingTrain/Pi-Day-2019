// The Nature of Code
// Daniel Shiffman
// http://natureofcode.com

import shiffman.box2d.*;
import org.jbox2d.collision.shapes.*;
import org.jbox2d.common.*;
import org.jbox2d.dynamics.*;
int digits = 3;

// A reference to our box2d world
Box2DProcessing box2d;

Box box1;
Box box2;
Boundary wall;
Boundary floor;

void setup() {
  size(640, 200);
  box2d = new Box2DProcessing(this, 10);
  box2d.createWorld();
  box2d.setGravity(0, 0);
  box1 = new Box(200, height, 50, 1, 0);
  box2 = new Box(350, height, 50, pow(100, digits-1), -2);
  wall = new Boundary(10, height/2, 10, height);
  floor = new Boundary(width/2, height, width, 10);
}

void draw() {
  background(255);

  float timeStep = 1.0 / 60;
  box2d.step(timeStep, 1000, 1000);
  box2d.world.clearForces();

  box1.show();
  box2.show();
  wall.show();
  floor.show();
}
