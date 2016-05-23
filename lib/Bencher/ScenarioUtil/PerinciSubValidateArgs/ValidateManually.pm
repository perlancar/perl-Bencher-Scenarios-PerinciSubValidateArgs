package Bencher::ScenarioUtil::PerinciSubValidateArgs::ValidateManually;

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
};
sub foo {
    my %args = @_;
    exists($args{a1}) or return [400, "Missing required argument 'a1'"];
    for (keys %args) {
        ($_ eq 'a1' || $_ eq 'a2') or return [400, "Unknown argument '$_'"];
    }
    if (exists $args{a1}) {
        defined($args{a1}) or return [400, "Validation failed for argument 'a1': Missing required value"];
        $args{a1} =~ /\A-?[0-9]+\z/ or return [400, "Validation failed for argument 'a1': Not an integer"];
    }
    if (!defined($args{a2})) { $args{a2} = [1] }
    if (exists $args{a2}) {
        if (defined($args{a2})) {
            ref($args{a2}) eq 'ARRAY' or return [400, "Validation failed for argument 'a2': Not an array"];
            for my $i (0..$#{ $args{a2} }) {
                my $el = $args{a2}[$i];
                defined($el) or return [400, "Validation failed for argument 'a1': [$i] Missing required value"];
                $el =~ /\A-?[0-9]+\z/ or return [400, "Validation failed for argument 'a1': [$i] Not an integer"];
            }
        }
    }
    [200, "OK"];
}

1;
# ABSTRACT: An example module that uses hand-written validation code
