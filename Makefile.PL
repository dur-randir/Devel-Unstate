use 5.014;
use ExtUtils::MakeMaker;

system 'pod2text lib/Devel/Unstate.pm > README';

WriteMakefile(
    NAME            => 'Devel::Unstate',
    VERSION_FROM    => 'lib/Devel/Unstate.pm',
    AUTHOR          => ['Sergey Aleynikov <randir@cpan.org>'],
    PREREQ_PM       => {
    },
    TEST_REQUIRES   => {
        'Test::More'        => 0,
    },
    META_MERGE      => {
        resources     => {
            repository  => 'https://github.com/dur-randir/Devel-Unstate',
            bugtracker  => 'https://github.com/dur-randir/Devel-Unstate/issues',
        },
        dynamic_config  => 0,
    },
    ABSTRACT_FROM   => 'lib/Devel/Unstate.pm',
    LICENSE         => 'perl',
    MIN_PERL_VERSION=> 5.014,
);

