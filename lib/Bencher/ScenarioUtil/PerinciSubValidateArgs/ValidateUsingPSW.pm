package Bencher::ScenarioUtil::PerinciSubValidateArgs::ValidateUsingPSW;

# DATE
# VERSION

use strict 'subs', 'vars';
use warnings;
use Perinci::Sub::Wrapper;

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
my $foo = sub {
    my %args = @_;
    [200, "OK"];
};

my $res = Perinci::Sub::Wrapper::wrap_sub(sub=>$foo, meta=>$SPEC{foo});
$res->[0] == 200 or die "Can't wrap: $res->[0] - $res->[1]";
*foo = $res->[2]{sub};

1;
# ABSTRACT: An example module that uses Perinci::Sub::ValidateArgs
