//https://github.com/processing/processing/wiki/Library-Basics
import processing.video.*;
import peasy.PeasyCam;

Grid grid;
JSONObject settings;	

File[] frames;
Pixel[] joints;
color bg = color(33,33,33,255*0.18 );
JSONObject currentFrame;
// number of joints comming in
int bodyFormat = 25;
int frameIndex = 0;

/**
* - useful to always have in a Pricessing day/
* @method settings
*/
void settings( ){

  settings = loadJSONObject("settings.json");
  

  JSONObject size;
  size = settings.getJSONObject("size");

  size(size.getInt("width"), size.getInt("height") );
  // here we could add a check to see if the widht and height ar defined
  // go go full screen if they are not.
  // fullScreen( );
}
/**
*
* @method setup
*/
boolean oneloopCompleted = false;
void setup() {
  
  /** NOTE:  DON'T UPDATES THIS, USE THE settings.json **/
  // size(600, 600);
  surface.setResizable(true);
  grid = new Grid( this );
  frames = listFiles("data");

  joints = new Pixel[bodyFormat];
  for (int i = 0; i < bodyFormat; ++i) {
    joints[i] = new Pixel( new PVector(0,0), 10);
  }
  fill(0, 0, 0);
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
  
  // grid.set(myMovie);
  // grid.update();
  // image(myMovie, 0, 0, 200, 200);
  // for (int i = 0; i < frames.length-2; ++i) {
    
    currentFrame = loadJSONObject("test-dance_"+padNumber(frameIndex)+"_keypoints.json");
     JSONArray peps = currentFrame.getJSONArray("people");
  
      for (int o = 0; o < peps.size(); o++) {
        
        JSONObject pep = peps.getJSONObject(o); 

        // int id = pep.pose_keypoints_2d("id");
        JSONArray poseKeypoints2d = pep.getJSONArray("pose_keypoints_2d");
        
        int body25Index = 0;
      for (int l = 0; l < poseKeypoints2d.size(); l+=3) {
        joints[body25Index].setPos( new PVector(poseKeypoints2d.getFloat(l), poseKeypoints2d.getFloat(l+1)) );
        joints[body25Index].update();
        joints[body25Index].setSize(poseKeypoints2d.getFloat(l+2)*10);
        body25Index++;
        
      }
        
      }
  
  if( frameIndex < frames.length-3) {
    frameIndex++;
  }
  else{
    frameIndex = 0;
    oneloopCompleted = true;
  }
  if(!oneloopCompleted) {
    saveFrame("frames/lola-######.jpg");
    }
}

/**
*
* @method keyReleased
*/
void keyReleased( ) {
  grid.released(key);
}

/**
*
* @method keyPressed
*/
void keyPressed( ) {
  grid.pressed(key);
}

/**
*
* @method mouseMoved
*/
void mouseMoved( ) {
  grid.mouseMoved();
}
/**
*
* @method mousePressed
*/
void mousePressed() {
  grid.mousePressed();
}

String padNumber(long _num ){
  String padded = "";
  
  if(_num < 10){
    padded = "00000000000"+_num;
  }
  else if(_num < 100){
    padded = "0000000000"+_num;
  }
  else if(_num < 1000){
    padded = "000000000"+_num;
  }
  else if(_num < 10000){
    padded = "00000000"+_num;
  }
  else if(_num < 100000){
    padded = "0000000"+_num;
  }
  else if(_num < 1000000){
    padded = "000000"+_num;
  }
  else if(_num < 10000000){
    padded = "00000"+_num;
  }
  else if(_num < 100000000){
    padded = "0000"+_num;
  }
  else if(_num < 1000000000){
    padded = "000"+_num;
  }
  else if(_num < 10000000000L ){
    padded = "00"+_num;
  }
  else if(_num < 100000000000L ){
    padded = "0"+_num;
  }
  return padded;
}

/**
  * @method listFiles – get
  * @returns {File[]} - array of filepath.
  */
File[] listFiles( String dir ) {
  File file = new File( sketchPath() + "/"+dir );
  if ( file.isDirectory() ) {
    File[] files = file.listFiles( );
    return files;
  } else {
    // If it's not a directory
    return null;
  }
}