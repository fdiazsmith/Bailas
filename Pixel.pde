/**
 * @class Pixel
 * - this class should...
 */
class Pixel {
  
  PVector pos;
  float size;
  int minSize = 1;
  color c = color(121,212,21);

  /**
   * @contructor
   * @param {PVector} _pos
   * @param {int} _size
   */
  Pixel( PVector _pos, float _size ) {
    pos = _pos;
    size = _size;
    // ellipseMode(CORNER);
    // x, y, width and height
    
    
    
  }

  /**
   * @method setColor
   * asigns the color to draw in this frame.
   */
  void setColor( color _col ) {
    c = _col;
  }
  /**
   * @method setPos
   * asigns the color to draw in this frame.
   */
  void setPos( PVector _pos ) {
    pos = _pos;
  }
  /**
   * @method setSize
   * sets the absolute size of the pixel
   */
  void setSize( float _size ) {
    if(_size >= minSize ){
      size = _size;
    }
    else{
      size = minSize;
    }
  }
  /**
   * @method setSize
   * increases the size of the pixel
   */
  void incSize( float _inc ) {
    if(size >= minSize ){
      size += _inc;
    }
    else{
      size = minSize;
    }
  }
  
 
  /**
   * @method update - draws and displays
   */
  void update(  ) {
    // println("Pixel._col: "+_col);
    
    fill(c);
    ellipse(pos.x, pos.y, size, size);
    
  }


}
