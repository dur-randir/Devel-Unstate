package Test::NoState;
use 5.010;
use strict;

our $VERSION = '0.01';

require XSLoader;
XSLoader::load('Test::NoState', $VERSION);

1;
