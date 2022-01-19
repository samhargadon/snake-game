void checkEdge() {
  //check if snake hits edge
  if (xpos[xpos.length-1]>width || xpos[xpos.length-1]<0 || ypos[ypos.length-1]>height || ypos[ypos.length-1]<0) {

    //stop game
    xpos[xpos.length-1]=0;
    xpos = new int[1];
    ypos = new int [1];
    gameover.play();

    //write points in the middle of the screen
    stroke(0, 100, 100);
    fill(255, 100, 100);
    textAlign(CENTER, CENTER);
    text("Score: "+total, width/2, height/2);

    //allow user to go back to start page
    //draw box
    int x4 = width/2 - 100;
    int y4 = height/2+100;
    int w4 = 200;
    int h4 = 50;
    fill(255);

    //if the mouse is in the rectangle and is pressed
    if (mouseX>x4 && mouseX <x4+w4 && mouseY>y4 && mouseY <y4+h4) {
      if (mousePressed) {
        gameScreen=0;
        total = 0;
        fill(0);
      }
    }
    //button will turn black
    rect(x4, y4, w4, h4);
    fill(50, 205, 50);
    text("Return to menu", x4 + 90, y4 + 30);
  }



  ////check if snake hits tail
  //for (int i = 0; i<xpos.length-1; i++) {
  //  if (dist(xpos[xpos.length-1], ypos[ypos.length-1], xpos[i], ypos[i]) ==0 && xpos.length>1 && ypos.length>1) {

  //    xpos[xpos.length-1]=0;
  //    xpos = new int[1];
  //    ypos = new int [1];
  //    gameover.play();

  //    //write points in the middle of the screen
  //    stroke(0, 100, 100);
  //    fill(255, 100, 100);
  //    textAlign(CENTER, CENTER);
  //    text("Score: "+total, width/2, height/2);

  //    //allow user to go back to start page
  //    //draw box
  //    int x4 = width/2 - 100;
  //    int y4 = height/2+100;
  //    int w4 = 200;
  //    int h4 = 50;
  //    fill(255);

  //    //if the mouse is in the rectangle and is pressed
  //    if (mouseX>x4 && mouseX <x4+w4 && mouseY>y4 && mouseY <y4+h4) {
  //      if (mousePressed) {
  //        gameScreen=0;
  //        total = 0;
  //        fill(0);
  //      }
  //    }
  //    //button will turn black
  //    rect(x4, y4, w4, h4);
  //    fill(50, 205, 50);
  //    text("Return to menu", x4 + 90, y4 + 30);
  //  }
  //}
}
