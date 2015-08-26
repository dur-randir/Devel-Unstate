use 5.010;
use Test::More;
use Test::NoState;

for (1..3) {
    state $foo;
    is($foo, undef);
    $foo = 2;
}

done_testing;
