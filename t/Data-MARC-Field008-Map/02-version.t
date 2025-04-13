use strict;
use warnings;

use Data::MARC::Field008::Map;
use Test::More 'tests' => 2;
use Test::NoWarnings;

# Test.
is($Data::MARC::Field008::Map::VERSION, 0.01, 'Version.');
