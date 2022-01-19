//declare sounds
import processing.sound.*;
SoundFile song;
SoundFile snake1;
SoundFile snake2;
SoundFile snake3;
SoundFile snake4;
SoundFile gameover;


//set gameScreen variable
int gameScreen = 0;

//declare images
PImage img;
PImage img2;


//declare two initial arrays
int [] xpos = new int[1];
int [] ypos = new int[1];

//snake width and height
int rectw = 20;
int recth = 20;

//speed and direction of snake
int dirx;
int diry;

float array_len;

//declare tongues
Snake mySnake1;
Snake mySnake2;
Snake mySnake3;
Snake mySnake4;
Snake mySnake5;
Snake mySnake6;
Snake mySnake7;
Snake mySnake8;
Snake mySnake9;
Snake mySnake10;
Snake mySnake11;
Snake mySnake12;

void setup() {
  size(500, 570);
  xpos[0]=width/2;
  ypos[0]=height/2;
  array_len=xpos.length*0.5;

  //initialize images and sounds
  img = loadImage("apple.png");
  img.resize(25, 25);

  song = new SoundFile(this, "0011074.mp3");
  snake1 = new SoundFile(this, "rattlesnakerattle.mp3");
  snake2 = new SoundFile (this, "rattlesnake7.mp3");
  snake3 = new SoundFile (this, "rattlesnake6.mp3");
  snake4 = new SoundFile(this, "rattlesnake5.mp3");
  gameover = new SoundFile(this, "sfx-defeat1.mp3");
}

void draw () {
  //0 = instruction screen
  //1 = play game
  //2 = exit window
  if (gameScreen == 0) {
    initScreen();
  } else if (gameScreen==1) {
    gameScreen();
  } else if (gameScreen==2) {
    gameScreen2();
  } else if (gameScreen==3) {
    gameScreen3();
  }
}

void gameScreen() {
  background(0);
  frameRate(10);

  int dirx=10;
  int diry=0;

  //call functions
  score();
  showFood();
  checkEat();
  checkEdge();

  //shift array values
  for (int i =0; i<xpos.length-1; i++) {
    //shift all elements down one spot
    xpos[i]=xpos[i+1];
    ypos[i]=ypos[i+1];
  }



  //draw snake body
  for (int i = 0; i<xpos.length; i++) {
    fill(150);
    rect(xpos[i], ypos[i], rectw, recth);
  }

  //initalize right tongue
  mySnake1 = new Snake (xpos[xpos.length-1], ypos[ypos.length-1], xpos[xpos.length-1]+10, ypos[ypos.length-1]);
  mySnake2 = new Snake (xpos[xpos.length-1]+10, ypos[ypos.length-1], xpos[xpos.length-1]+5, ypos[ypos.length-1]-5);
  mySnake3 = new Snake (xpos[xpos.length-1]+10, ypos[ypos.length-1], xpos[xpos.length-1]+5, ypos[ypos.length-1]+5);

  //intialize left tongue
  mySnake4 = new Snake (xpos[xpos.length-1], ypos[ypos.length-1], xpos[xpos.length-1]-10, ypos[ypos.length-1]);
  mySnake5 = new Snake (xpos[xpos.length-1]-10, ypos[ypos.length-1], xpos[xpos.length-1]-15, ypos[ypos.length-1]-5);
  mySnake6 = new Snake (xpos[xpos.length-1]+10, ypos[ypos.length-1], xpos[xpos.length-1]-15, ypos[ypos.length-1]+5);

  //intialize top tongue
  mySnake7 = new Snake (xpos[xpos.length-1], ypos[ypos.length-1], xpos[xpos.length-1], ypos[ypos.length-1]-10);
  mySnake8 = new Snake (xpos[xpos.length-1], ypos[ypos.length-1]-10, xpos[xpos.length-1]-5, ypos[ypos.length-1]-15);
  mySnake9 = new Snake (xpos[xpos.length-1], ypos[ypos.length-1]-10, xpos[xpos.length-1]+5, ypos[ypos.length-1]-15);

  //initalize bottom tongue
  mySnake10 = new Snake (xpos[xpos.length-1], ypos[ypos.length-1], xpos[xpos.length-1], ypos[ypos.length-1]+10);
  mySnake11 = new Snake (xpos[xpos.length-1], ypos[ypos.length-1]+10, xpos[xpos.length-1]-5, ypos[ypos.length-1]+15);
  mySnake12 = new Snake (xpos[xpos.length-1], ypos[ypos.length-1]+10, xpos[xpos.length-1]+5, ypos[ypos.length-1]+15);



  //draw eyes and make snake move with the keys
  if (keyCode==UP) {
    snake1.play();
    dirx=0;
    diry=-10;
    circle(xpos[xpos.length-1], ypos[ypos.length-1], rectw-5);
    circle(xpos[xpos.length-1]+20, ypos[ypos.length-1], rectw-5);
    if (dist(xpos[xpos.length-1], ypos[ypos.length-1], appleX, appleY) <= 100) {
      mySnake7.display();
      mySnake7.move();
      mySnake8.display();
      mySnake8.move();
      mySnake9.display();
      mySnake9.move();
    }
  }
  if (keyCode==DOWN) {
    snake2.play();
    dirx=0;
    diry=10;
    circle(xpos[xpos.length-1], ypos[ypos.length-1]+20, rectw-5);
    circle(xpos[xpos.length-1]+20, ypos[ypos.length-1]+20, rectw-5);
    if (dist(xpos[xpos.length-1], ypos[ypos.length-1], appleX, appleY) <= 100) {
      mySnake10.display();
      mySnake10.move();
      mySnake11.display();
      mySnake11.move();
      mySnake12.display();
      mySnake12.move();
    }
  }
  if (keyCode==LEFT) {
    snake3.play();
    dirx=-10;
    diry=0;
    circle(xpos[xpos.length-1], ypos[ypos.length-1], rectw-5);
    circle(xpos[xpos.length-1], ypos[ypos.length-1]+20, rectw-5);
    if (dist(xpos[xpos.length-1], ypos[ypos.length-1], appleX, appleY) <= 100) {
      mySnake4.display();
      mySnake4.move();
      mySnake5.display();
      mySnake5.move();
      mySnake6.display();
      mySnake6.move();
    }
  }
  if (keyCode==RIGHT) {
    snake4.play();
    dirx=10;
    diry=0;
    circle(xpos[xpos.length-1]+20, ypos[ypos.length-1]+20, rectw-5);
    circle(xpos[xpos.length-1]+20, ypos[ypos.length-1], rectw-5);
    if (dist(xpos[xpos.length-1], ypos[ypos.length-1], appleX, appleY) <= 100) {
      mySnake1.display();
      mySnake1.move();
      mySnake2.display();
      mySnake2.move();
      mySnake3.display();
      mySnake3.move();
    }
  }
  //new location
  xpos[xpos.length-1]+= dirx;
  ypos[ypos.length-1]+= diry;
}


void gameScreen2() {
  background(0);
  frameRate(10);

  int dirx=20;
  int diry=0;

  score();
  showFood();
  checkEat();
  checkEdge();

  //shift array values
  for (int i =0; i<xpos.length-1; i++) {
    //shift all elements down one spot
    xpos[i]=xpos[i+1];
    ypos[i]=ypos[i+1];
  }



  //draw snake body
  for (int i = 0; i<xpos.length; i++) {
    fill(150);
    rect(xpos[i], ypos[i], rectw, recth);
  }

  //initalize right tongue
  mySnake1 = new Snake (xpos[xpos.length-1], ypos[ypos.length-1], xpos[xpos.length-1]+10, ypos[ypos.length-1]);
  mySnake2 = new Snake (xpos[xpos.length-1]+10, ypos[ypos.length-1], xpos[xpos.length-1]+5, ypos[ypos.length-1]-5);
  mySnake3 = new Snake (xpos[xpos.length-1]+10, ypos[ypos.length-1], xpos[xpos.length-1]+5, ypos[ypos.length-1]+5);

  //intialize left tongue
  mySnake4 = new Snake (xpos[xpos.length-1], ypos[ypos.length-1], xpos[xpos.length-1]-10, ypos[ypos.length-1]);
  mySnake5 = new Snake (xpos[xpos.length-1]-10, ypos[ypos.length-1], xpos[xpos.length-1]-15, ypos[ypos.length-1]-5);
  mySnake6 = new Snake (xpos[xpos.length-1]+10, ypos[ypos.length-1], xpos[xpos.length-1]-15, ypos[ypos.length-1]+5);

  //intialize top tongue
  mySnake7 = new Snake (xpos[xpos.length-1], ypos[ypos.length-1], xpos[xpos.length-1], ypos[ypos.length-1]-10);
  mySnake8 = new Snake (xpos[xpos.length-1], ypos[ypos.length-1]-10, xpos[xpos.length-1]-5, ypos[ypos.length-1]-15);
  mySnake9 = new Snake (xpos[xpos.length-1], ypos[ypos.length-1]-10, xpos[xpos.length-1]+5, ypos[ypos.length-1]-15);

  //initalize bottom tongue
  mySnake10 = new Snake (xpos[xpos.length-1], ypos[ypos.length-1], xpos[xpos.length-1], ypos[ypos.length-1]+10);
  mySnake11 = new Snake (xpos[xpos.length-1], ypos[ypos.length-1]+10, xpos[xpos.length-1]-5, ypos[ypos.length-1]+15);
  mySnake12 = new Snake (xpos[xpos.length-1], ypos[ypos.length-1]+10, xpos[xpos.length-1]+5, ypos[ypos.length-1]+15);



  //draw eyes and make snake move with the keys
  if (keyCode==UP) {
    snake1.play();
    dirx=0;
    diry=-20;
    circle(xpos[xpos.length-1], ypos[ypos.length-1], rectw-5);
    circle(xpos[xpos.length-1]+20, ypos[ypos.length-1], rectw-5);
    if (dist(xpos[xpos.length-1], ypos[ypos.length-1], appleX, appleY) <= 100) {
      mySnake7.display();
      mySnake7.move();
      mySnake8.display();
      mySnake8.move();
      mySnake9.display();
      mySnake9.move();
    }
  }
  if (keyCode==DOWN) {
    snake2.play();
    dirx=0;
    diry=20;
    circle(xpos[xpos.length-1], ypos[ypos.length-1]+20, rectw-5);
    circle(xpos[xpos.length-1]+20, ypos[ypos.length-1]+20, rectw-5);
    if (dist(xpos[xpos.length-1], ypos[ypos.length-1], appleX, appleY) <= 100) {
      mySnake10.display();
      mySnake10.move();
      mySnake11.display();
      mySnake11.move();
      mySnake12.display();
      mySnake12.move();
    }
  }
  if (keyCode==LEFT) {
    snake3.play();
    dirx=-20;
    diry=0;
    circle(xpos[xpos.length-1], ypos[ypos.length-1], rectw-5);
    circle(xpos[xpos.length-1], ypos[ypos.length-1]+20, rectw-5);
    if (dist(xpos[xpos.length-1], ypos[ypos.length-1], appleX, appleY) <= 100) {
      mySnake4.display();
      mySnake4.move();
      mySnake5.display();
      mySnake5.move();
      mySnake6.display();
      mySnake6.move();
    }
  }
  if (keyCode==RIGHT) {
    snake4.play();
    dirx=20;
    diry=0;
    circle(xpos[xpos.length-1]+20, ypos[ypos.length-1]+20, rectw-5);
    circle(xpos[xpos.length-1]+20, ypos[ypos.length-1], rectw-5);
    if (dist(xpos[xpos.length-1], ypos[ypos.length-1], appleX, appleY) <= 100) {
      mySnake1.display();
      mySnake1.move();
      mySnake2.display();
      mySnake2.move();
      mySnake3.display();
      mySnake3.move();
    }
  }
  //new location
  xpos[xpos.length-1]+= dirx;
  ypos[ypos.length-1]+= diry;
}

void gameScreen3() {
  background(0);
  frameRate(10);

  int dirx=40;
  int diry=0;

  score();
  showFood();
  checkEat();
  checkEdge();

  //shift array values
  for (int i =0; i<xpos.length-1; i++) {
    //shift all elements down one spot
    xpos[i]=xpos[i+1];
    ypos[i]=ypos[i+1];
  }



  //draw snake body
  for (int i = 0; i<xpos.length; i++) {
    fill(150);
    rect(xpos[i], ypos[i], rectw, recth);
  }

 //initalize right tongue
  mySnake1 = new Snake (xpos[xpos.length-1], ypos[ypos.length-1], xpos[xpos.length-1]+10, ypos[ypos.length-1]);
  mySnake2 = new Snake (xpos[xpos.length-1]+10, ypos[ypos.length-1], xpos[xpos.length-1]+5, ypos[ypos.length-1]-5);
  mySnake3 = new Snake (xpos[xpos.length-1]+10, ypos[ypos.length-1], xpos[xpos.length-1]+5, ypos[ypos.length-1]+5);

  //intialize left tongue
  mySnake4 = new Snake (xpos[xpos.length-1], ypos[ypos.length-1], xpos[xpos.length-1]-10, ypos[ypos.length-1]);
  mySnake5 = new Snake (xpos[xpos.length-1]-10, ypos[ypos.length-1], xpos[xpos.length-1]-15, ypos[ypos.length-1]-5);
  mySnake6 = new Snake (xpos[xpos.length-1]+10, ypos[ypos.length-1], xpos[xpos.length-1]-15, ypos[ypos.length-1]+5);

  //intialize top tongue
  mySnake7 = new Snake (xpos[xpos.length-1], ypos[ypos.length-1], xpos[xpos.length-1], ypos[ypos.length-1]-10);
  mySnake8 = new Snake (xpos[xpos.length-1], ypos[ypos.length-1]-10, xpos[xpos.length-1]-5, ypos[ypos.length-1]-15);
  mySnake9 = new Snake (xpos[xpos.length-1], ypos[ypos.length-1]-10, xpos[xpos.length-1]+5, ypos[ypos.length-1]-15);

  //initalize bottom tongue
  mySnake10 = new Snake (xpos[xpos.length-1], ypos[ypos.length-1], xpos[xpos.length-1], ypos[ypos.length-1]+10);
  mySnake11 = new Snake (xpos[xpos.length-1], ypos[ypos.length-1]+10, xpos[xpos.length-1]-5, ypos[ypos.length-1]+15);
  mySnake12 = new Snake (xpos[xpos.length-1], ypos[ypos.length-1]+10, xpos[xpos.length-1]+5, ypos[ypos.length-1]+15);



  //draw eyes and make snake move with the keys
  if (keyCode==UP) {
    snake1.play();
    dirx=0;
    diry=-40;
    circle(xpos[xpos.length-1], ypos[ypos.length-1], rectw-5);
    circle(xpos[xpos.length-1]+20, ypos[ypos.length-1], rectw-5);
    if (dist(xpos[xpos.length-1], ypos[ypos.length-1], appleX, appleY) <= 100) {
      mySnake7.display();
      mySnake7.move();
      mySnake8.display();
      mySnake8.move();
      mySnake9.display();
      mySnake9.move();
    }
  }
  if (keyCode==DOWN) {
    snake2.play();
    dirx=0;
    diry=40;
    circle(xpos[xpos.length-1], ypos[ypos.length-1]+20, rectw-5);
    circle(xpos[xpos.length-1]+20, ypos[ypos.length-1]+20, rectw-5);
    if (dist(xpos[xpos.length-1], ypos[ypos.length-1], appleX, appleY) <= 100) {
      mySnake10.display();
      mySnake10.move();
      mySnake11.display();
      mySnake11.move();
      mySnake12.display();
      mySnake12.move();
    }
  }
  if (keyCode==LEFT) {
    snake3.play();
    dirx=-40;
    diry=0;
    circle(xpos[xpos.length-1], ypos[ypos.length-1], rectw-5);
    circle(xpos[xpos.length-1], ypos[ypos.length-1]+20, rectw-5);
    if (dist(xpos[xpos.length-1], ypos[ypos.length-1], appleX, appleY) <= 100) {
      mySnake4.display();
      mySnake4.move();
      mySnake5.display();
      mySnake5.move();
      mySnake6.display();
      mySnake6.move();
    }
  }
  if (keyCode==RIGHT) {
    snake4.play();
    dirx=40;
    diry=0;
    circle(xpos[xpos.length-1]+20, ypos[ypos.length-1]+20, rectw-5);
    circle(xpos[xpos.length-1]+20, ypos[ypos.length-1], rectw-5);
    if (dist(xpos[xpos.length-1], ypos[ypos.length-1], appleX, appleY) <= 100) {
      mySnake1.display();
      mySnake1.move();
      mySnake2.display();
      mySnake2.move();
      mySnake3.display();
      mySnake3.move();
    }
  }
  //new location
  xpos[xpos.length-1]+= dirx;
  ypos[ypos.length-1]+= diry;
}
