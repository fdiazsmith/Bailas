/**
 * @class Openpose
 * - 
 */
class Openpose {
  PVector[] keypoints;
  int[] keypointsConfidence;
  
  File[] frames;
  JSONObject currentFrame;

  float frameIndex = 0;
  boolean oneloopCompleted = false;
  int framesPerSecond = 30;
  float fpsInterval = 1000/framesPerSecond;
  long lastFrameTimeStamp = 0;
  String path;
  String[] subPaths;
  static final int bodyFormat = 25;
  
  static final int Nose = 0;
  static final int Neck = 1;
  static final int RShoulder = 2;
  static final int RElbow = 3;
  static final int RWrist = 4;
  static final int LShoulder = 5;
  static final int LElbow = 6;
  static final int LWrist = 7;
  static final int MidHip = 8;
  static final int RHip = 9;
  static final int RKnee = 10;
  static final int RAnkle = 11;
  static final int LHip = 12;
  static final int LKnee = 13;
  static final int LAnkle = 14;
  static final int REye = 15;
  static final int LEye = 16;
  static final int REar = 17;
  static final int LEar = 18;
  static final int LBigToe = 19;
  static final int LSmallToe = 20;
  static final int LHeel = 21;
  static final int RBigToe = 22;
  static final int RSmallToe = 23;
  static final int RHeel = 24;
  static final int Background = 25;
  
  /**
   * @contructor
   * @param {PVector} _pos
   * @param {int} _size
   */
  Openpose( String _path ) {
    path = _path;
    subPaths = split(_path, '/');
    frames = listFiles(path);

    keypoints = new PVector[bodyFormat];
    keypointsConfidence = new int[bodyFormat];
    for (int i = 0; i < bodyFormat; ++i) {
      keypointsConfidence[i] = 0;
      keypoints[i] = new PVector( 0, 0 );
    }
    
  }

  /**
   * @method loadFrame
   * asigns the color to draw in this frame.
   */
  void loadFrame( ) {
    
    currentFrame = loadJSONObject("./"+subPaths[0]+"/"+subPaths[1]+"/"+subPaths[1]+"_"+padNumber(int(frameIndex))+"_keypoints.json");
    
     JSONArray peps = currentFrame.getJSONArray("people");
  
      for (int o = 0; o < peps.size(); o++) {
        
        JSONObject pep = peps.getJSONObject(o); 
        JSONArray poseKeypoints2d = pep.getJSONArray("pose_keypoints_2d");
        
        int body25Index = 0;
        for (int l = 0; l < poseKeypoints2d.size(); l+=3) {
          keypoints[body25Index].set( poseKeypoints2d.getFloat(l), poseKeypoints2d.getFloat(l+1) );
          body25Index++;
        }
        
      }
  }

  
 
  /**
   * @method update - draws and displays
   */
  void update(  ) {
    // loadFrame();
    if( frameIndex < frames.length-3) {
      if(lastFrameTimeStamp + fpsInterval < millis()){
        frameIndex++;
        lastFrameTimeStamp = millis();
      }
      // frameIndex+= .45;

    }
    else{
      frameIndex = 0;
      oneloopCompleted = true;
    }
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