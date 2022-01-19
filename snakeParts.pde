//make Snake class to display tongue
class Snake {
  int tongueX1;
  int tongueX2;
  int tongueY1;
  int tongueY2;

  Snake(int tempTongueX1, int tempTongueX2, int tempTongueY1, int tempTongueY2) {
    tongueX1 = tempTongueX1;
    tongueX2 = tempTongueX2;
    tongueY1 = tempTongueY1;
    tongueY2 = tempTongueY2;
  }

  void display() {
    stroke(255, 0, 0);
    line(tongueX1, tongueX2, tongueY1, tongueY2);
  }

  void move() {
    tongueX1+=dirx;
    tongueX2+=dirx;
    tongueY1+=diry;
    tongueY2+=diry;
  }
}
