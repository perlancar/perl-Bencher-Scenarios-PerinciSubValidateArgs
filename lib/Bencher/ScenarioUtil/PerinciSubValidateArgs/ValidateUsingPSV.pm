package Bencher::ScenarioUtil::PerinciSubValidateArgs::ValidateUsingPSV;

# DATE
# VERSION

use 5.010001;
use strict;
use warnings;
use Perinci::Sub::ValidateArgs qw(gen_args_validator);

use Exporter qw(import);
our @EXPORT_OK = qw(foo);

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
            default => [1],
        },
    },
};
sub foo {
    state $validator = gen_args_validator();
    my %args = @_;
    if (my $err = $validator->(\%args)) { return $err }
    [200, "OK"];
}

1;
# ABSTRACT: An example module that uses Perinci::Sub::ValidateArgs
