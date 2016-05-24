package Bencher::ScenarioUtil::PerinciSubValidateArgs::ValidateUsingDZPRV;

# DATE
# VERSION

use strict;
use warnings;

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
    'x.perinci.sub.wrapper.disable_validate_args' => 1,
};
sub foo {
    #IFUNBUILT
    die "Can only be used in built version";
    #END IFUNBUILT

    my %args = @_; # VALIDATE_ARGS
    [200, "OK"];
}

1;
# ABSTRACT: An example module that uses Rinci::Validate dzil plugin
