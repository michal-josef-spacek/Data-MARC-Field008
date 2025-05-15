package Data::MARC::Field008::VisualMaterial;

use strict;
use warnings;

use Data::MARC::Field008::Utils qw(check_government_publication check_item_form
	check_visual_material_running_time check_visual_material_technique
	check_target_audience);
use Error::Pure qw(err);
use Error::Pure::Utils qw(err_get);
use Mo qw(build is);
use Mo::utils 0.22 qw(check_length_fix check_required);

our $STRICT = 1;

our $VERSION = 0.01;

has form_of_item => (
	is => 'ro',
);

has government_publication => (
	is => 'ro',
);

has raw => (
	is => 'ro',
);

has running_time_for_motion_pictures_and_videorecordings => (
	is => 'ro',
);

has target_audience => (
	is => 'ro',
);

has technique => (
	is => 'ro',
);

has type_of_visual_material => (
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

	# Check 'running_time_for_motion_pictures_and_videorecordings'.
	eval { check_visual_material_running_time($self, 'running_time_for_motion_pictures_and_videorecordings'); };

	# Check 'target_audience'.
	eval { check_target_audience($self, 'target_audience'); };

	# Check 'technique'.
	eval { check_visual_material_technique($self, 'technique'); };

	# Check 'type_of_visual_material'.
	eval { check_visual_material_type($self, 'type_of_visual_material'); };

	if ($STRICT) {
		my @errors = err_get();
		if (@errors) {
			err "Couldn't create data object of visual material.",
				defined $self->raw ? ('Raw string', $self->raw) : (),
			;
		}
	}

	return;
}

1;
