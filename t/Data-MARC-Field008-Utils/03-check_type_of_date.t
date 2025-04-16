use strict;
use warnings;

use English;
use Error::Pure::Utils qw(clean);
use Data::MARC::Field008::Utils qw(check_type_of_date);
use Test::More 'tests' => 6;
use Test::NoWarnings;

# Test.
my $self = {
	'key' => 's',
};
my $ret = check_type_of_date($self, 'key');
is($ret, undef, 'Right type of date is present (s).');

# Test.
$self = {};
eval {
	check_type_of_date($self, 'key');
};
is($EVAL_ERROR, "Parameter 'key' is required.\n",
	"Parameter 'key' is required (key not exists).");
clean();

# Test.
$self = {
	'key' => undef,
};
eval {
	check_type_of_date($self, 'key');
};
is($EVAL_ERROR, "Parameter 'key' is required.\n",
	"Parameter 'key' is required (undef).");
clean();

# Test.
$self = {
	'key' => 'foo',
};
eval {
	check_type_of_date($self, 'key');
};
is($EVAL_ERROR, "Parameter 'key' length is bad.\n",
	"Parameter 'key' length is bad (foo).");
clean();

# Test.
$self = {
	'key' => [],
};
eval {
	check_type_of_date($self, 'key');
};
is($EVAL_ERROR, "Parameter 'key' must be a scalar value.\n",
	"Parameter 'key' must be a scalar value ([]).");
clean();
