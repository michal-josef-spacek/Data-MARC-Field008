package Data::MARC::Field008::Map;

use strict;
use warnings;

use Data::MARC::Field008::Utils qw(check_government_publication check_index
	check_item_form check_map_cartographic_material_type check_map_projection
	check_map_relief check_map_special_format);
use Error::Pure qw(err);
use Error::Pure::Utils qw(err_get);
use Mo qw(build is);
use Mo::utils 0.22 qw(check_length_fix check_required check_strings);

our $STRICT = 1;

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

	# Check 'raw'
	check_length_fix($self, 'raw', 17);

	# Check 'form_of_item'.
	eval { check_item_form($self, 'form_of_item'); };

	# Check 'government_publication'.
	eval { check_government_publication($self, 'government_publication'); };

	# Check 'index'.
	eval { check_index($self, 'index'); };

	# Check 'projection'.
	eval { check_map_projection($self, 'projection'); };

	# Check 'relief'.
	eval { check_map_relief($self, 'relief'); };

	# Check 'special_format_characteristics'.
	eval { check_map_special_format($self, 'special_format_characteristics'); };

	# Check 'type_of_cartographic_material'.
	eval { check_map_cartographic_material_type($self, 'type_of_cartographic_material'); };

	if ($STRICT) {
		my @errors = err_get();
		if (@errors) {
			err "Couldn't create data object of map.",
				defined $self->raw ? ('Raw string', $self->raw) : (),
			;
		}
	}

	return;
}

1;
