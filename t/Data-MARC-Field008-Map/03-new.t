use strict;
use warnings;

use Data::MARC::Field008::Map;
use Test::More 'tests' => 3;
use Test::NoWarnings;

# Test.
my $obj = Data::MARC::Field008::Map->new(
	'projection' => 'aa',
	'relief' => 'z   ',
);
isa_ok($obj, 'Data::MARC::Field008::Map');

# Test.
$obj = Data::MARC::Field008::Map->new(
	'projection' => '  ',
	'relief' => 'z   ',
	'raw' => 'z      e     1  ',
);
isa_ok($obj, 'Data::MARC::Field008::Map');
