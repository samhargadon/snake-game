//check if the head is equal to the location of the apple 
void checkEat() {
  if ((xpos[xpos.length-1]<= appleX+(d/2)) && (xpos[xpos.length-1]>= appleX-(d/2))) {
    if ((ypos[ypos.length-1]<= appleY+(d/2)) && (ypos[ypos.length-1]>= appleY-(d/2))) {
      //increase points 
      total = total + 1;
      //new location of apple 
      appleX = random(width);
      appleY = random(height);
      showFood();
      song.play();
      //increase tail length 
      xpos = (int[]) append(xpos, xpos[xpos.length-1]);
      ypos = (int[]) append(ypos, ypos[ypos.length-1]);
    }
  }
}
