package Data::MARC::Field008::Map;

use strict;
use warnings;

use Mo qw(build is);
use Mo::utils 0.22 qw(check_length_fix check_required check_strings);

our $VERSION = 0.01;

has form_of_item => (
	is => 'ro',
);

has government_publication => (
	is => 'ro',
);

has index => (
	is => 'ro',
);

has projection => (
	is => 'ro',
);

has raw => (
	is => 'ro',
);

has relief => (
	is => 'ro',
);

has special_format_characteristics => (
	is => 'ro',
);

has type_of_cartographic_material => (
	is => 'ro',
);

sub BUILD {
	my $self = shift;

	# Check 'form_of_item'.
	# TODO

	# Check 'government_publication'.
	# TODO

	# Check 'index'.
	# TODO

	# Check 'projection'.
	# TODO

	# Check 'raw'
	check_required($self, 'raw');
	check_length_fix($self, 'raw', 16);

	# Check 'relief'.
	check_relief($self, 'relief');

	# Check 'special_format_characteristics'.
	# TODO

	# Check 'type_of_cartographic_material'.
	# TODO

	return;
}

1;
