use strict;
use warnings;

use Data::MARC::Field008;
use English;
use Error::Pure::Utils qw(clean);
use Test::More 'tests' => 6;
use Test::NoWarnings;

# Test.
my $obj = Data::MARC::Field008->new(
	'date1' => '    ',
	'date2' => '    ',
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
eval {
	Data::MARC::Field008->new(
		'date_entered_on_file' => '      ',
		'date1' => '18  ',
		'date2' => '    ',
		'type_of_date' => 's',
	);
};
is($EVAL_ERROR, "Parameter 'date1' has value with space character.\n",
	"Parameter 'date1' has value with space character (18  ).");
clean();

# Test.
eval {
	Data::MARC::Field008->new(
		'date1' => '18||',
	);
};
is($EVAL_ERROR, "Parameter 'date1' has value with pipe character.\n",
	"Parameter 'date1' has value with pipe character (18||).");
clean();
