package Bencher::ScenarioUtil::PerinciSubValidateArgs::ValidateManualDataSah;

# DATE
# VERSION

use strict;
use warnings;

use Data::Sah;

use Exporter qw(import);
our @EXPORT_OK = qw(foo);

our %SPEC;

my $v_a1 = Data::Sah::gen_validator('int*', {return_type=>'str'});
my $v_a2 = Data::Sah::gen_validator([array => of=>'int*'], {return_type=>'str'});

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
    my %args = @_;
    my $err;
    exists($args{a1}) or return [400, "Missing required argument 'a1'"];
    for (keys %args) {
        ($_ eq 'a1' || $_ eq 'a2') or return [400, "Unknown argument '$_'"];
    }
    if (exists $args{a1}) {
        $err = $v_a1->($args{a1});
        if ($err) { return [400, "Validation failed for argument 'a1': $err"] }
    }
    if (!defined($args{a2})) { $args{a2} = [1] }
    if (exists $args{a2}) {
        $err = $v_a2->($args{a2});
        if ($err) { return [400, "Validation failed for argument 'a2': $err"] }
    }
    [200, "OK"];
}

1;
# ABSTRACT: An example module that uses hand-written validation code, but the type validators are generated using Data::Sah
