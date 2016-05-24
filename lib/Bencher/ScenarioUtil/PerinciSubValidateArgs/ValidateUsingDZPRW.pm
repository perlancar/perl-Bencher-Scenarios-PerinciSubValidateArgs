package Bencher::ScenarioUtil::PerinciSubValidateArgs::ValidateUsingDZPRW;

# DATE
# VERSION

use strict;
use warnings;

use Exporter qw(import);
our @EXPORT_OK = qw(foo_dzprw);

our %SPEC;

$SPEC{foo_dzprw} = {
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
sub foo_dzprw {
    #IFUNBUILT
    die "Can only be used in built version";
    #END IFUNBUILT

    my %args = @_;
    [200, "OK"];
}

1;
# ABSTRACT: An example module that uses Rinci::Wrap dzil plugin
