package Bencher::Scenario::PerinciSubValidateArgs::Startup;

# DATE
# VERSION

use 5.010001;
use strict;
use warnings;

our $scenario = {
    summary => 'Benchmark startup of Perinci::Sub::ValidateArgs',
    participants => [
        {
            name => 'perl',
            summary => 'Load Perinci::Sub::ValidateArgs',
            perl_cmdline => ["-e1"],
        },
        {
            name => 'load_psv',
            summary => 'Load Perinci::Sub::ValidateArgs',
            perl_cmdline => ["-MPerinci::Sub::ValidateArgs", "-e1"],
        },
        {
            name => 'load_psv+first_run',
            summary => 'Load Perinci::Sub::ValidateArgs (PSV) and run a function that uses PSV for the first time',
            perl_cmdline => ["-MBencher::ScenarioUtil::PerinciSubValidateArgs::ValidateUsingPSV", "-e", "Bencher::ScenarioUtil::PerinciSubValidateArgs::ValidateUsingPSV::foo(a1=>1,a2=>1)"],
        },
    ],
};

1;
# ABSTRACT:
