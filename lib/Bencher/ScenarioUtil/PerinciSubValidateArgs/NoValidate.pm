package Bencher::ScenarioUtil::PerinciSubValidateArgs::UsesPSV;

# DATE
# VERSION

use strict;
use warnings;
use Perinci::Sub::ValidateArgs;

our %SPEC;

$SPEC{foo} = {
    v => 1.1,
    args => {
        a1 => {
            schema => 'int*',
            req => 1,
        },
        a2 => {
            schema => [array => of=>'int*'],
            default => 'peach',
        },
    },
};
sub foo {
    my %args = @_;
    if (my $err = validate_args(\%args)) { return $err }
    [200, "OK"];
}

1;
# ABSTRACT: An example module that uses Perinci::Sub::ValidateArgs
