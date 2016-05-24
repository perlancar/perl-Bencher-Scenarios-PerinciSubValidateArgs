package Bencher::Scenario::PerinciSubValidateArgs::Overhead;

# DATE
# VERSION

use 5.010001;
use strict;
use warnings;

our $scenario = {
    summary => 'Measure validation overhead',
    participants => [
        {
            name => 'none',
            fcall_template => 'Bencher::ScenarioUtil::PerinciSubValidateArgs::NoValidate::foo(a1=><a1>, a2=><a2>)',
        },
        {
            name => 'manual',
            fcall_template => 'Bencher::ScenarioUtil::PerinciSubValidateArgs::ValidateManually::foo(a1=><a1>, a2=><a2>)',
        },
        {
            name => 'manual+dsah',
            fcall_template => 'Bencher::ScenarioUtil::PerinciSubValidateArgs::ValidateManualDataSah::foo(a1=><a1>, a2=><a2>)',
        },
        {
            name => 'Rinci::Validate',
            fcall_template => 'Bencher::ScenarioUtil::PerinciSubValidateArgs::ValidateUsingRinciValidate::foo(a1=><a1>, a2=><a2>)',
            include_by_default => 0,
        },
        {
            name => 'PSV',
            fcall_template => 'Bencher::ScenarioUtil::PerinciSubValidateArgs::ValidateUsingPSV::foo(a1=><a1>, a2=><a2>)',
        },
        {
            name => 'Type::Tiny',
            fcall_template => 'Bencher::ScenarioUtil::PerinciSubValidateArgs::ValidateUsingTypeTiny::foo(a1=><a1>, a2=><a2>)',
        },
    ],
    datasets => [
        {args => {a1=>1, a2=>[1]}},
    ],
};

1;
# ABSTRACT:

=head1 BENCHMARK NOTES

The participants (except C<none>, obviously) all should be in the same order of
magnitude because both L<Data::Sah> and L<Type::Tiny> work by generating Perl
code validator and then compiling (C<eval()>) them then execute the compiled
result. The differences are in the details: how the generated Perl code is
structured, what the code for the type checks are (e.g. checking for number can
be done with a regex or L<Scalar::Util>'s C<looks_like_number()> or
L<Scalar::Util::Numeric>, and so on).
