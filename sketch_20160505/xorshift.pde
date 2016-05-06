int seed = 1;

float xorshift() {
  seed = seed ^ ( seed << 13 );
  seed = seed ^ ( seed >>> 17 );
  seed = seed ^ ( seed << 5 );
  return seed / pow( 2.0, 32.0 ) + 0.5;
};