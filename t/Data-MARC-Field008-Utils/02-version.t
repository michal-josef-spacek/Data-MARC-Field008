use strict;
use warnings;

use Data::MARC::Field008::Utils;
use Test::More 'tests' => 2;
use Test::NoWarnings;

# Test.
is($Data::MARC::Field008::Utils::VERSION, 0.02, 'Version.');
