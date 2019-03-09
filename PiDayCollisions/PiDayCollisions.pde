


Box box1;
Box box2;
int count = 0;
//int scale = 10;

int timeSteps = 100;

void setup() {
  size(600, 200);
  box1 = new Box(200, 10, 1, 0);
  box2 = new Box(400, 100, 100, -1.0/timeSteps);
}

void draw() {

  for (int i = 0; i < 100; i++) {
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
  box1.show();
  box2.show();

  fill(255);
  text(count, 10, 20);
}
