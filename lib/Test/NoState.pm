package Test::NoState;
use 5.010;
use strict;

our $VERSION = '0.01';

require XSLoader;
XSLoader::load('Test::NoState', $VERSION);

1;
__END__

=head1 NAME

Test::NoState - Disable 'state' keyword statelessness

=head1 DESCRIPTION

This module makes all B<state> variables behave as if they were
B<my> variables. This can be useful for testing, when you cache
some data in your application, but want to get fresh values on each
test iteration.

The effect of the C<Test::NoState> is global. But only variable declarations
compiled after it is loaded are affected.

=head1 COPYRIGHT AND LICENSE

Copyright (C) 2015 by Sergey Aleynikov

This library is free software; you can redistribute it and/or modify
it under the same terms as Perl itself, either Perl version 5.10.1 or,
at your option, any later version of Perl 5 you may have available.

=cut
