use Modern::Perl;
use Test::Spec;

describe [% name %] => sub {
    it "does something" => sub {
        pass;
    };
};

runtests unless caller;
