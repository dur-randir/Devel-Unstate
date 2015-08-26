use 5.010;
use Test::More;
use Test::NoState;

for (1..3) {
    state $foo = $_;
    is($foo, $_);
}

done_testing;
