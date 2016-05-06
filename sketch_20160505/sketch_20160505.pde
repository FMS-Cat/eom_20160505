final int NBLOCK = 2000;
final int NSPAWN = 20;
final int FRAMES = NBLOCK / NSPAWN;
final float DELTATIME = 1.0 / 50.0; 

Block[] blocks = new Block[ NBLOCK ];
int cBlock = 0;

void setup() {
  size( 1600, 1600 );
  frameRate( 50 );
  
  for ( int iBlock = 0; iBlock < NBLOCK; iBlock ++ ) {
    float x = 0.0;
    float y = 0.0;
    
    while( 0.4 < dist( 0.5, 0.5, x, y ) ) {
      x = xorshift();
      y = xorshift();
      break;
    }
    
    blocks[ iBlock ] = new Block(
      x * width,
      ( int( y * 50.0 ) + 0.5 ) / 50.0 * height
    );
  }
}

void draw() {
  background( 44, 51, 67 );
  
  cBlock = ( cBlock + NSPAWN ) % NBLOCK;
  
  for ( int iBlock = 0; iBlock < NSPAWN; iBlock ++ ) {
    blocks[ cBlock + iBlock ].init();
  }
  
  for ( int iBlock = 0; iBlock < NBLOCK; iBlock ++ ) {
    blocks[ ( iBlock + cBlock + NSPAWN ) % NBLOCK ].draw();
  }
  
  if ( FRAMES <= frameCount && frameCount < FRAMES * 2 ) {
    saveFrame( "out/####.png" );
  } else if ( frameCount == FRAMES * 2 ) {
    exit();
  }
}