package Bencher::ScenarioUtil::PerinciSubValidateArgs::ValidateUsingTypeTiny;

# DATE
# VERSION

use 5.010001;
use strict;
use warnings;
use Type::Params qw(compile);
use Types::Standard qw(slurpy ArrayRef Dict Int Maybe Optional);

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
    state $check = compile(
        slurpy Dict[
            a1 => Int,
            a2 => Optional[Maybe[ArrayRef[Int]]],
        ],
    );
    my ($args) = $check->(@_);

    # Types::Params doesn't support supplying default value, so we need to do
    # that ourselves.
    $args->{a2} //= [1];

    [200, "OK"];
}

1;
# ABSTRACT: An example module that uses Perinci::Sub::ValidateArgs
