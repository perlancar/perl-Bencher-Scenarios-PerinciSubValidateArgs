package Bencher::Scenario::PerinciSubValidateArgs::Overhead;

# DATE
# VERSION

use 5.010001;
use strict;
use warnings;

# initialize the validators
use Bencher::ScenarioUtil::PerinciSubValidateArgs::ValidateUsingPSV;
Bencher::ScenarioUtil::PerinciSubValidateArgs::ValidateUsingPSV::foo(a1=>1, a2=>1);

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
    ],
    datasets => [
        {args => {a1=>1, a2=>1}},
    ],
};

1;
# ABSTRACT:
