use strict;
use warnings;

use Data::MARC::Field008;
use English;
use Error::Pure::Utils qw(clean);
use Test::More 'tests' => 6;
use Test::NoWarnings;

# Test.
my $obj = Data::MARC::Field008->new(
	'type_of_date' => 's',
);
isa_ok($obj, 'Data::MARC::Field008');

# Test.
$obj = Data::MARC::Field008->new(
	'date_entered_on_file' => '      ',
	'date1' => '    ',
	'date2' => '    ',
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

# Test.
$obj = Data::MARC::Field008->new(
	'date_entered_on_file' => '      ',
	'date1' => '18  ',
	'date2' => '    ',
	'type_of_date' => 's',
);
isa_ok($obj, 'Data::MARC::Field008');

# Test.
eval {
	Data::MARC::Field008->new(
		'date1' => '18||',
	);
};
is($EVAL_ERROR, "Parameter 'date1' does not match the specified regular expression.\n",
	"Parameter 'date1' does not match the specified regular expression (18||).");
clean();
