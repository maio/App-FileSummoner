use Modern::Perl;
use Test::Spec;

describe Something => sub {
    it "does something" => sub {
        pass;
    };
};

runtests unless caller;
