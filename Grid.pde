import controlP5.*;

ControlP5 cp5;


/**
 * @class Grid
 * - this class should coordinate between app (video image input ) and the pixels
 */
class Grid {
  Pixel[] pixels;
  color bg = color(0);

  int pitch = 40;
  float pixelSize = 13;
  

  int wideCount = 4;
  int highCount = 5;
  int count = 20;

  /**
   * @contructor
   * @param {PApplet} _thisPApplet - reference to this
   */
  Grid( PApplet _thisPApplet ) {
    int index = 0;

    pixels = new Pixel[count];
    for (int y = 0; y < highCount; y++) {
      for (int x = 0; x < wideCount; x++) {
        pixels[index++] = new Pixel( new PVector(x*pitch, y*pitch), pixelSize );
      }
    }

  
  }

  /**
   * @method set
   * prepares the Grid to draw the next frame.
   */
  void set(PImage _frame ) {
    int index = 0;
    // println("*******************************************");
    // println("_frame.height: "+_frame.height);
    // println("_frame.width: "+_frame.width);
    // println("_frame.height/16: "+_frame.height/16);
    for (float y = 0; y < _frame.height-5; y+=_frame.height/16) {
      for (float x = 0; x < _frame.width-5; x+=_frame.width/16) {
        
        // println("y "+int(y));
        // println("       x "+int(x)) ;
        pixels[index++].setColor( _frame.get( int(x), int(y) ) );
      }
    }
  }
 

  /**
   * @method released – handles keyReleased events
   * @param {char} _key - key just released
   */
  void released(char _key) {
    if (key == CODED) {
      if (keyCode == UP) {
    
    
      } else if (keyCode == DOWN) {
    
      }
      else if (keyCode == LEFT) {
    
      } 
      else if (keyCode == RIGHT) {

      } 
    }
    else if ( _key == 's' ) {
        // code
    }
  }


  /**
   * @method pressed – handles keyReleased events
   * @param {char} _key - key just pressed
   */
  void pressed(char _key) {
    if ( _key == 'p' ) {
      // code
    }
  }
  /**
   * @method mouseMoved
   */
  void mouseMoved() {
    // do something
  }
  /**
   * @method mousePressed
   */
  void mousePressed() {
    // do something
  }

  /**
   * @method update - draws and displays
   */
  void update( ) {
    background(bg);
      
    int index = 0;
    for (int y = 0; y < highCount; y++) {
      for (int x = 0; x < wideCount; x++) {
        pixels[index++].update( );
      }
    }
  }
  /**
   * @class modal – 
   */
  void modal( String message, float normal ) {
    float alpha = 1-(normal*normal);
    textAlign(CENTER, CENTER);
    fill(50, alpha*150);
    rect(0,0,width, height);
    fill(255, alpha*255);
    textSize(132);
    text(message, width/2, height/2);
  }
  /**
   * @class message – 
   */
  void message( String message, float x, float y ) {
    textAlign(LEFT, CENTER);
    fill(30, 180);
    textSize(16);
    text(message, (int)x, (int)y );
  }
}

