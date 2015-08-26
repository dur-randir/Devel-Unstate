use 5.010;
use Test::More;

for (1..3) {
    state $foo;
    is($foo, $_ == 1 ? undef : 2);
    $foo = 2;
}

use Test::NoState;

for (1..3) {
    state $foo;
    is($foo, undef);
    $foo = 2;
}

done_testing;
