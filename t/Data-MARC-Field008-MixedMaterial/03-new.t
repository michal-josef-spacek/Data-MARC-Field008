use strict;
use warnings;

use Data::MARC::Field008::MixedMaterial;
use English;
use Error::Pure::Utils qw(clean);
use Test::More 'tests' => 4;
use Test::NoWarnings;

# Test.
my $obj = Data::MARC::Field008::MixedMaterial->new(
	'form_of_item' => 'r',
	'raw' => '     r          ',
);
isa_ok($obj, 'Data::MARC::Field008::MixedMaterial');

# Test.
eval {
	Data::MARC::Field008::MixedMaterial->new(
		'raw' => '     r          ',
	);
};
is($EVAL_ERROR, "Parameter 'form_of_item' is required.\n",
	"Parameter 'form_of_item' is required.");
clean();

# Test.
eval {
	Data::MARC::Field008::MixedMaterial->new(
		'form_of_item' => 'r',
	);
};
is($EVAL_ERROR, "Parameter 'raw' is required.\n",
	"Parameter 'raw' is required.");
clean();
