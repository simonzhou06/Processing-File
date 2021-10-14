int W1=100;
int W2=200;
int W3=300;
int H=20;
float mx;
//instructions text
String P="The name of the Game is Racquetball or  Pong Game,";
String O="the best way of playing the game is to use the paddle you ";
String I="select and try to catch the moving ball and not let it touch ";
String U="the bottom of the screen.";
String L="Click on either three of the paddle (red) on the left to";
String K="start the game. However, each size of the paddle correspond ";
String S="to one rate of speed.";
String J="Smaller paddle = Slower speed of ball.";
String H1="Medium paddle = Faster speed of ball comapre to first paddle.";
String G="Larger paddle= Highest speed of ball among three of them.";
String F="In other word, the increase of sizes are with the increase of";
String D="speed.";

//variables
float Px, Py, Speedx, Speedy;
float Rc, Gc, Bc;// random color
float Cx;
float Cy;
float Q=random(0, 4);
int GAP;
boolean draw=true;
boolean stop=false;
int count;//=0;

void setup() {
  size(1000, 800);
  frameRate(1000);
  rectMode(CENTER);
  background(0);
  GAP=height-30;
}

void draw() {
//slection of Game Mode
  if (mousePressed) {
    if (draw&&!stop) {
      if (mouseX>=width/4-W1/2&&mouseX<=width/4+W1/2&&mouseY>=200-H/2&&mouseY<=200+H/2 ) {
        Px=W1;
        Py=H;
        Speedx=1;
        Speedy=1;
        draw=false;
        
      } else if (mouseX>=width/4-W2/2&&mouseX<=width/4+W2/2&&mouseY>=400-H/2&&mouseY<=400+H/2) {
        Px=W2;
        Py=H;
        Speedx=1.5;
        Speedy=1.5;
        draw=false;
       
      } else if (mouseX>=width/4-W3/2&&mouseX<=width/4+W3/2&&mouseY>=600-H/2&&mouseY<=600+H/2) {
        Px=W3;
        Py=H;
        Speedx=2;
        Speedy=2;
        draw=false;
        
      }
    }
  } else {
    if (!draw) {
      background(0);
    }
  }

  if (draw==true) {
    //Heading
    Cx=random(50, 1000);
  Cy=random(20, 50);
  count=0;
    background(0);
    textAlign(CENTER);
    fill(0, 255, 255);
    textSize(60);
    text("Racquetball", width/2, 50);
    textSize(20);
    text("SimonZhou", width/2, 80);
    //instruction
    fill(255);
    rect(750, 400, 400, 600);
    fill(0);
    textSize(40);
    text("Instruction", 750, 150);
    textSize(15);
    text(P, 750, 170);
    text(O, 750, 190);
    text(I, 750, 210);
    text(U, 750, 230);
    text(L, 750, 270);
    text(K, 750, 290);
    text(S, 750, 310);
    text(J, 750, 350);
    text(H1, 750, 370);
    text(G, 750, 390);
    text(F, 750, 410);
    text(D, 750, 430);


    //Game Mode on the left
    fill(255, 0, 0);
    rect(width/4, 200, W1, H);
    rect(width/4, 400, W2, H);
    rect(width/4, 600, W3, H);
    fill(0);
    text("1", width/4, 205);
    text("2", width/4, 405);
    text("3", width/4, 605);
  } else if (!draw&&!stop) {

    //refresh background then go to the game
    Rc=random(0, 255);
    Gc=random(0, 255);
    Bc=random(0, 255);
    fill(Rc, Gc, Bc);
    circle(Cx, Cy, 30);
    //start at top and random go left or right
    if (Q<2) {
      Cy+=Speedy;
      Cx-=Speedx;
    } else if (Q>2) {
      Cy+=Speedy;
      Cx+=Speedx;
    }
    //bounce
    //touch left and right
    if ((Cx-15)<=0||(Cx+15)>=width) {
      Speedx*=-1;
    }
    //touch top
    if ((Cy-15)<=0) {
      Speedy*=-1;
    }
    //touch bottom
    if ((Cy+15)>=height) {
      Speedx*=0;
      Speedy*=0;
      stop=true;
    }
    //paddle
    fill(Gc, Rc, Bc);
    rect(mx, GAP, Px, Py);
    mx=constrain(mouseX, 0+Px/2, width-Px/2);
    //count number
    fill(255);
    text("Points:", 940, 40);
    text(count, 970, 40);
    if (Cx>=mouseX-Px/2&&Cx<=mouseX+Px/2&&Cy+15>=750-H/2&&Cy+15<=750+H/2) {
      Speedy*=-1;
      Speedx*=1.05;
      Speedy*=1.05;
      count=count+1;
    }
  } else if (stop) {
    textSize(80);
    fill(255, 0, 0);
    text("Game Over", width/2, 400);
    text("Press Any Key to Restart", width/2, 450);
    textSize(15);
  }
  

}
void keyPressed(){
  if(stop&&!draw){
  background(0);
  draw=true;
  stop=false;
  
  }
}
