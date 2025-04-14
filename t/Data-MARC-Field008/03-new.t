use strict;
use warnings;

use Data::MARC::Field008;
use Test::More 'tests' => 4;
use Test::NoWarnings;

# Test.
my $obj = Data::MARC::Field008->new;
isa_ok($obj, 'Data::MARC::Field008');

# Test.
$obj = Data::MARC::Field008->new(
	'date_entered_on_file' => '      ',
	'date1' => '####',
	'date2' => '####',
	'type_of_date' => 'b',
);
isa_ok($obj, 'Data::MARC::Field008');

# Test.
$obj = Data::MARC::Field008->new(
	'date_entered_on_file' => '      ',
	'date1' => '18uu',
	'date2' => '    ',
	'type_of_date' => 's',
);
isa_ok($obj, 'Data::MARC::Field008');
