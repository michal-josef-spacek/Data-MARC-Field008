package Data::MARC::Field008::Map;

use strict;
use warnings;

use Data::MARC::Field008::Utils qw(check_government_publication check_index
	check_item_form check_map_cartographic_material_type check_map_projection
	check_map_relief check_map_special_format);
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
	check_item_form($self, 'form_of_item');

	# Check 'government_publication'.
	check_government_publication($self, 'government_publication');

	# Check 'index'.
	check_index($self, 'index');

	# Check 'projection'.
	check_map_projection($self, 'projection');

	# Check 'raw'
	check_length_fix($self, 'raw', 16);

	# Check 'relief'.
	check_map_relief($self, 'relief');

	# Check 'special_format_characteristics'.
	check_map_special_format($self, 'special_format_characteristics');

	# Check 'type_of_cartographic_material'.
	check_map_cartographic_material_type($self, 'type_of_cartographic_material');

	return;
}

1;
