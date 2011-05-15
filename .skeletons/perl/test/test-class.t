package Some::Test;

use strict;
use warnings;

use base 'Test::Class';
use Test::More;

sub test_ok : Tests {
    ok(1);
}

INIT { Test::Class->runtests }

1;
