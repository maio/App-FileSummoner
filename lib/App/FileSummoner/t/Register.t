package App::FileSummoner::Register::Test;

use strict;
use warnings;

use base 'Test::Class';
use Test::More;
use App::FileSummoner::Register qw(chooseSkeleton registerSkeleton);

sub setup : Test(teardown) {
    App::FileSummoner::Register::unregisterAll();
}

sub testChoseCorrectSkeleton : Tests {
    registerSkeleton(qr/\/t\/.+\.php$/ => 'test.php');
    registerSkeleton(qr/\.pm$/ => 'file.pm');
    registerSkeleton(qr/\.t$/ => 'file.t');
    registerSkeleton(qr/\.php$/ => 'file.php');

    is(chooseSkeleton('/path/file.php'), 'file.php');
    is(chooseSkeleton('/path/t/file.php'), 'test.php');
    is(chooseSkeleton('/path/file.pm'), 'file.pm');
    is(chooseSkeleton('/path/t/file.t'), 'file.t');
    is(chooseSkeleton('/path/unknown.txt'), undef);
}

sub testChoseCorrectSkeletonUsingMultipleMatchersWorksForSingle : Tests {
    registerSkeleton([qr/php/] => 'file.php');
    registerSkeleton([qr/pm/] => 'file.pm');

    is(chooseSkeleton('/path/file.php'), 'file.php');
    is(chooseSkeleton('/path/file.pm'), 'file.pm');
}

sub testChoseCorrectSkeletonUsingMultipleMatchersWorksForMultiple : Tests {
    registerSkeleton([qr/models/, qr/pm/] => 'model-file.pm');
    registerSkeleton([qr/pm/] => 'file.pm');

    is(chooseSkeleton('/path/models/file.pm'), 'model-file.pm');
    is(chooseSkeleton('/path/file.pm'), 'file.pm');
}

sub testChoseCorrectSkeletonCodeRefRule : Tests {
    registerSkeleton([FalseCodeRef()], 'file.php');
    registerSkeleton([TrueCodeRef()], 'file.pm');
    is(chooseSkeleton('/path/anything.ext'), 'file.pm');
}

sub testChoseCorrectSkeletonPassFileNameToCodeRef : Tests {
    registerSkeleton([RegExp('php')], 'file.php');
    registerSkeleton([RegExp('pm')], 'file.pm');

    is(chooseSkeleton('/path/file.php'), 'file.php');
    is(chooseSkeleton('/path/file.pm'), 'file.pm');
}

sub RegExp {
    my ($re) = @_;
    return sub {
        my ($fileName) = @_;
        return $fileName =~ /$re/;
    }
}

sub TrueCodeRef {
    return sub { 1; }
}

sub FalseCodeRef {
    return sub { 0; }
}

Test::Class->runtests;
