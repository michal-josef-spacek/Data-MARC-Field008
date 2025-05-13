use strict;
use warnings;

use Data::MARC::Field008::Book;
use English;
use Error::Pure::Utils qw(clean err_get);
use Test::More 'tests' => 6;
use Test::NoWarnings;

# Test.
my $obj = Data::MARC::Field008::Book->new(
	'biography' => ' ',
	'conference_publication' => '0',
	'festschrift' => '0',
	'form_of_item' => 'r',
	'government_publication' => ' ',
	'illustrations' => '    ',
	'index' => '0',
	'literary_form' => '0',
	'nature_of_content' => '    ',
	'target_audience' => ' ',
);
isa_ok($obj, 'Data::MARC::Field008::Book');

# Test.
eval {
	Data::MARC::Field008::Book->new(
		'biography' => 'x',
		'conference_publication' => '0',
		'festschrift' => '0',
		'form_of_item' => 'r',
		'government_publication' => ' ',
		'illustrations' => '    ',
		'index' => '0',
		'literary_form' => '0',
		'nature_of_content' => '    ',
		'target_audience' => ' ',
	);
};
is($EVAL_ERROR, "Couldn't create data object of book.\n",
	"Couldn't create data object of book.");
my @errors = err_get;
is($errors[0]->{'msg'}->[0], "Parameter 'biography' has bad value.",
	"Parameter 'biography' has bad value.");
is($errors[0]->{'msg'}->[1], "Value", "Error key (Value).");
is($errors[0]->{'msg'}->[2], "x", "Error key value (x).");
clean();
