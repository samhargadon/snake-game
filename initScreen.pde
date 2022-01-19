void initScreen() {
  float size = (width/20);

  //rectangle variables
  float x1 = size;
  float y1 = (size*15);
  float w1 = (size*7);
  float h1 = (size*3);

  float x2 = (size*13);
  float y2 = (size*15);
  float w2 = (size*6);
  float h2 = (size*3);

  float x3 = (size*7);
  float y3 = (size*19);
  float w3 = (size*6);
  float h3 = (size*3);

  //text placement variables so window can change

  float textLength1 = (size*13);
  float textLength2 = (size*17);
  float textLength3 = (size*15);
  float textLength4 = (size*18);

  float line1X = ((width-textLength1)/2);
  float line1Y = (size*2);

  float line2X = ((width-textLength2)/2);
  float line2Y = (size*4);

  float line3X = ((width-textLength3)/2);
  float line3Y = (size*6);

  float line4X = ((width-textLength4)/2);
  float line4Y = (size*8);

  //background color and text color and width
  background(255, 105, 180);
  stroke(0);

  //instructions
  textSize(size);
  fill(0, 255, 255);
  text("Welcome to the snake game!", line1X, line1Y);
  text("Use arrows to move the snake!", line2X, line2Y);
  text("+1 point if you eat the apple", line3X, line3Y);
  text("Game over if you leave the screen or hit tail", line4X, line4Y);

  //button background is white
  fill(255);

  //if the mouse is in the rectangle and is pressed
  if (mouseX>x1 && mouseX <x1+w1 && mouseY>y1 && mouseY <y1+h1) {
    if (mousePressed) {
      gameScreen=1;
      fill(0);
    }
  }
  //button will turn black and game will begin
  rect(x1, y1, w1, h1);
  fill(50, 205, 50);
  text("EASY", x1+(width/40), y1+(width/12));

  fill(255);

  //if the mouse is in the rectangle and is pressed
  if (mouseX>x2 && mouseX <x2+w2 && mouseY>y2 && mouseY <y2+h2) {
    if (mousePressed) {
      gameScreen=2;
      fill(0);
    }
  }
  //button will turn black
  rect(x2, y2, w2, h2);
  fill(50, 205, 50);
  text("MODERATE", x2+(width/40), y2+(width/12));

  fill(255);

  //if the mouse is in the rectangle and is pressed
  if (mouseX>x3 && mouseX <x3+w3 && mouseY>y3 && mouseY <y3+h3) {
    if (mousePressed) {
      gameScreen=3;
      fill(0);
    }
  }
  //button will turn black 
  rect(x3, y3, w3, h3);
  fill(50, 205, 50);
  text("HARD", x3+(width/40), y3+(width/12));
}
