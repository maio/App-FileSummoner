package App::FileSummoner::Register::Test;

use strict;
use warnings;

use base 'Test::Class';
use Test::More;
use App::FileSummoner::Register qw(chooseSkeleton registerSkeleton);

sub testChoseCorrectSkeleton : Tests {
    registerSkeleton(qr/\/t\/.+\.php$/ => 'test.php');
    registerSkeleton(qr/\.pm$/ => 'file.pm');
    registerSkeleton(qr/\.pm$/ => 'file.pm');
    registerSkeleton(qr/\.t$/ => 'file.t');
    registerSkeleton(qr/\.php$/ => 'file.php');

    is(chooseSkeleton('path/file.php'), 'file.php');
    is(chooseSkeleton('path/t/file.php'), 'test.php');
    is(chooseSkeleton('path/file.pm'), 'file.pm');
    is(chooseSkeleton('path/t/file.t'), 'file.t');
    is(chooseSkeleton('path/unknown.txt'), undef);
}

Test::Class->runtests;
