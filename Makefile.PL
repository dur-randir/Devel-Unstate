use 5.014;
use ExtUtils::MakeMaker;

system 'pod2text lib/Test/NoState.pm > README';

WriteMakefile(
    NAME            => 'Test::NoState',
    VERSION_FROM    => 'lib/Test/NoState.pm',
    AUTHOR          => ['Sergey Aleynikov <randir@cpan.org>'],
    PREREQ_PM       => {
    },
    TEST_REQUIRES   => {
        'Test::More'        => 0,
    },
    META_MERGE      => {
        resources     => {
            repository  => 'https://github.com/dur-randir/Test-NoState',
        },
    },
    ABSTRACT_FROM   => 'lib/Test/NoState.pm',
    LICENSE         => 'perl',
    MIN_PERL_VERSION=> 5.014,
);

