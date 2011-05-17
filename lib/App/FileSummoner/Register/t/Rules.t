use strict;
use warnings;

use Test::More tests => 6;
use App::FileSummoner::Register;
use App::FileSummoner::Register::Rules;

ok( ruleMatches( HasExt('pm'), 'file.pm' ) );
ok( !ruleMatches( HasExt('pm'), 'file.php' ) );
ok( ruleMatches( BelowDirectory('models'), '/models/file.pm' ) );
ok( !ruleMatches( BelowDirectory('models'), '/path/file.pm' ) );
ok( ruleMatches( InsideDirectory('models'), '/models/file.pm' ) );
ok( !ruleMatches( InsideDirectory('models'), '/models/other/file.pm' ) );

sub ruleMatches {
    my ( $rule, $fileName ) = @_;
    return App::FileSummoner::Register::ruleMatches( $rule, $fileName );
}

