class Block {
  float x0;
  float vx0;
  float x1;
  float vx1;
  
  float x0i;
  float vx0i;
  float x1i;
  float vx1i;
  
  float y;
  float h;
  
  color col;
  
  Block( float _x, float _y ) {
    this.x0i = _x;
    this.vx0i = ( 0.5 + xorshift() * 0.5 ) * width * 0.5;
    this.x1i = _x;
    this.vx1i = 0.0;
    
    this.y = _y;
    this.h = height / 150.0;
    
    this.col = gradColor( xorshift() );
    
    this.init();
  }
  
  void init() {
    this.x0 = this.x0i;
    this.vx0 = this.vx0i;
    this.x1 = this.x1i;
    this.vx1 = this.vx1i;
  }
  
  void draw() {
    pushStyle();
    
    this.vx0 *= exp( -DELTATIME * 5.0 );
    this.vx1 += DELTATIME * width * 0.2;
    
    this.x0 += this.vx0 * DELTATIME;
    this.x1 += this.vx1 * DELTATIME;
    
    if ( this.x0 < this.x1 ) {
      return;
    }
    
    rectMode( CORNERS );
    fill( this.col );
    stroke( 44, 51, 67 );
    strokeWeight( width / 400.0 );
    
    rect(
      this.x0,
      this.y - this.h / 2.0,
      this.x1,
      this.y + this.h / 2.0
    );
    
    rect(
      this.x0 - width,
      this.y - this.h / 2.0,
      this.x1 - width,
      this.y + this.h / 2.0
    );
    
    popStyle();
  }
}