use 5.010;
use Test::More;

for (1..3) {
    state $foo = $_;
    is($foo, 1);
}

use Test::NoState;

for (1..3) {
    state $foo = $_;
    is($foo, $_);
}

done_testing;

