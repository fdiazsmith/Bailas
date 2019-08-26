//https://github.com/processing/processing/wiki/Library-Basics
// import processing.video.*;
import peasy.PeasyCam;

PeasyCam cam;
Openpose openpose;

JSONObject settings;	


Pixel[] joints;
color bg = color(33,33,33,255*0.18 );


/**
* - useful to always have in a Pricessing day/
* @method settings
*/
void settings( ){

  settings = loadJSONObject("settings.json");
  

  JSONObject size;
  size = settings.getJSONObject("size");

  size(size.getInt("width"), size.getInt("height") , P3D );
 
}
/**
*
* @method setup
*/
boolean oneloopCompleted = false;
void setup() {
  cam = new PeasyCam(this, 400);
  
  surface.setResizable(true);
  
  
  openpose = new Openpose("movers/pancitadeleche_1");

  joints = new Pixel[openpose.bodyFormat];
  for (int i = 0; i < joints.length; ++i) {
    joints[i] = new Pixel( new PVector(0,0), 10);
  }
  fill(bg);
  rect(0, 0, width, height);
}
/**
*
* @method draw
*/
void draw( ) {
  // clear();
    fill( bg );
    noStroke( );
    rect( 0, 0, width, height );
  // camera(mouseX, mouseY, (height) / tan(PI/6), width/2, height/2, 0, 0, 1, 0);
    openpose.loadFrame();

  // The second is using an enhanced loop:
  for (Body pose : openpose.bodies) {
    //  pose.display();
    for (int l = 0; l < pose.keypoints.length; l++) {
      joints[l].setPos( pose.keypoints[l] );
      joints[l].setSize(pose.keypointsConfidence[l] );
      joints[l].update();
    }
  }
    

    openpose.update(); 

}

/**
*
* @method keyReleased
*/
void keyReleased( ) {
  // grid.released(key);
}

/**
*
* @method keyPressed
*/
void keyPressed( ) {
  // grid.pressed(key);
}

/**
*
* @method mouseMoved
*/
void mouseMoved( ) {
  // grid.mouseMoved();
}
/**
*
* @method mousePressed
*/
void mousePressed() {
  // grid.mousePressed();
}



