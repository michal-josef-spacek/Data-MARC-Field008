use strict;
use warnings;

use Data::MARC::Field008::Map;
use Test::More 'tests' => 3;
use Test::NoWarnings;

# Test.
my $obj = Data::MARC::Field008::Map->new(
	'form_of_item' => ' ',
	'government_publication' => ' ',
	'index' => '|',
	'projection' => 'aa',
	'relief' => 'z   ',
	'special_format_characteristics' => '  ',
	'type_of_cartographic_material' => 'a',
);
isa_ok($obj, 'Data::MARC::Field008::Map');

# Test.
$obj = Data::MARC::Field008::Map->new(
	'form_of_item' => ' ',
	'government_publication' => ' ',
	'index' => 1,
	'projection' => '  ',
	'relief' => 'z   ',
	'raw' => 'z      e     1  ',
	'special_format_characteristics' => '  ',
	'type_of_cartographic_material' => 'e',
);
isa_ok($obj, 'Data::MARC::Field008::Map');
