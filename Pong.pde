import ddf.minim.*;  
Minim minim;
AudioSample sound;
PImage backgroundImage;
int pongX;
int pongSY =15;
int pongY;
int pongSX = 15;
void setup(){
  size(500,500);
  minim = new Minim (this);
sound = minim.loadSample("pong.wav", 128);

backgroundImage = loadImage("image.jpg");
}

void draw(){
  background(255,255,255);
  image(backgroundImage,0,0);
  image(backgroundImage,0,0, 500, 500);
    fill(0,0,0);
  stroke(0,0,0);
  ellipse(pongX,pongY,40,40);
  rect(mouseX, 470, 100,100);
  if(pongX>500){
  pongSX=pongSX*-1;
  }
  else if(pongX<0){ 
    pongSX=pongSX*-1;
  }
  pongX+=pongSX;
  if(pongY>500){
   pongSY=pongSY*-1; 
  }
  if(pongY<0){
  pongSY=pongSY*-1;
  }
  pongY+=pongSY; 
if(intersects(pongX, pongY, mouseX, 470, 100)){
 pongSY=pongSY*-1; 
}
if(pongY==510){
 sound.trigger(); 
}
}
boolean intersects(int ballX, int ballY, int paddleX, int paddleY, int paddleLength) {
     if (ballY > paddleY && ballX > paddleX && ballX < paddleX + paddleLength)
          return true;
     else 
          return false;
}