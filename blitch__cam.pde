//TV - W/ CAMERA GLITCH

import processing.video.*;
import processing.opengl.*;
import glitchP5.*;

Movie TV_LOOP, BG_LOOP, MUSIC, INTRO_LOOP, STATIC;

GlitchP5 glitchP5;
Capture cam;

int count =10;

int count1 =0;

int tint = 0;

int w=280;
int h=200;
int w1=1350;
int h1=980;

boolean mymovie;

void setup() {
  size(1750, 980, OPENGL);
  glitchP5 = new GlitchP5(this);
  
  TV_LOOP = new Movie(this, "tv.mp4");
  
  //MUSIC = new Movie(this, "music.mp4");

  STATIC = new Movie(this, "static.mp4");

  TV_LOOP.loop();
  TV_LOOP.stop();
  //MUSIC.loop();
  //MUSIC.stop();
  STATIC.loop();
  STATIC.volume(0);

  String[] cameras = Capture.list();
  
  if (cameras.length == 0) {
    println("There are no cameras available for capture.");
    exit();
  } else {
    println("Available cameras:");
    for (int i = 0; i < cameras.length; i++) {
      println(cameras[i]);
    }
    
    cam = new Capture(this, cameras[0]);
    cam.start();
    
  }      
}

void draw() {
  
    if (TV_LOOP.available()) 
    TV_LOOP.read();
   
    //if (MUSIC.available()) 
    //MUSIC.read();
   
    if (STATIC.available()) 
    STATIC.read();

int time =1;

float mt = TV_LOOP.time();
//float md = TV_LOOP.duration();

if(time > mt);{
time =1;

}
  if (cam.available() == true) {
  cam.read();
  }
  image(cam, 1, 1, 1750, 980);

  
  glitchP5.run();

 rect(0,0,displayWidth,displayHeight);
  fill(0,0,0,tint);

  //image(MUSIC, 1, 1, 1, 1);
  image(TV_LOOP, 500, 675, 280, 200);
  image(STATIC, 500, 675, w, h);
  
}

  void mousePressed()
  {
   
  //float tvtime = TV_LOOP.time()+ 60;
  TV_LOOP.play();
  TV_LOOP.jump(random(TV_LOOP.duration()));
  //MUSIC.play(); 
  //MUSIC.volume (+0.1);

  count1++;

  if(count1 == 1){
  STATIC.stop();
    w=0;
    h=0;
    w1=0;
    h1=0;
    }
    
  count*=1.6;
  glitchP5.glitch(50, 100, 100, 100, 100, 100, 1, 100, 100, 100);
  
   
  tint+=5;

  
  println(count);
  }
  