/**
 * @class Body
 * - 
 */
class Body {
  PVector[] keypoints;
  float[] keypointsConfidence;
  
  int bodyFormat = 25;
  
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
   * @param {int} _bodyFormat
   */
  Body( int _bodyFormat ) {
    bodyFormat = _bodyFormat;
  
    keypoints = new PVector[bodyFormat];
    keypointsConfidence = new float[bodyFormat];
    for (int i = 0; i < bodyFormat; ++i) {
      keypointsConfidence[i] = 0;
      keypoints[i] = new PVector( 0, 0 );
    }
    
  }

  /**
   * @method loadPose
   * asigns the color to draw in this frame.
   */
  void loadPose(  JSONArray _poseKeypoints2d ) {

    int body25Index = 0;
    for (int l = 0; l < _poseKeypoints2d.size(); l+=3) {
      keypoints[body25Index].set( _poseKeypoints2d.getFloat(l), _poseKeypoints2d.getFloat(l+1) );
      keypointsConfidence[body25Index] =  _poseKeypoints2d.getFloat(l+2);
      body25Index++;
    }
        
      
  }

  /**
   * @method update - draws and displays
   */
  void update(  ) {
 
  }



}

