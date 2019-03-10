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

void setup() {
  size(640, 200);
  // Initialize box2d physics and create the world
  box2d = new Box2DProcessing(this);
  box2d.createWorld();
  // We are setting a custom gravity
  box2d.setGravity(0, 0);
  box1 = new Box(200, height/2, 50, 1, 0);
  box2 = new Box(250, height/2, 50, pow(100, digits-1), -5);
  wall = new Boundary(10, height/2, 10, height);
}

void draw() {
  background(255);

  float timeStep = 1.0f / 60f;
  box2d.step(timeStep, 100, 100);
  box2d.world.clearForces();

  box1.show();
  box2.show();
  wall.show();
}
