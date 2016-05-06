color gradColor( float _v ) {
  PVector[] cols = new PVector[ 5 ];
  cols[ 0 ] = new PVector( 91, 142, 148 );
  cols[ 1 ] = new PVector( 111, 191, 177 );
  cols[ 2 ] = new PVector( 242, 239, 187 );
  cols[ 3 ] = new PVector( 242, 178, 99 );
  cols[ 4 ] = new PVector( 242, 144, 87 );
  
  int index = int( _v * 4.0 );
  float amount = ( _v * 4.0 ) % 1.0;
  PVector retCol = cols[ index ].lerp( cols[ index + 1 ], amount );
  return color(
    retCol.x,
    retCol.y,
    retCol.z
  );
}