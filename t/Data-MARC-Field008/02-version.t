use strict;
use warnings;

use Data::MARC::Field008;
use Test::More 'tests' => 2;
use Test::NoWarnings;

# Test.
is($Data::MARC::Field008::VERSION, 0.01, 'Version.');
