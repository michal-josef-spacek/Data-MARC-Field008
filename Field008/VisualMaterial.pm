package Data::MARC::Field008::VisualMaterial;

use strict;
use warnings;

use Data::MARC::Field008::Utils qw(check_target_audience);
use Mo qw(build is);
use Mo::utils 0.22 qw(check_length_fix check_required);

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

	# Check 'form_of_item'.
	# TODO

	# Check 'government_publication'.
	# TODO

	# Check 'raw'
	check_length_fix($self, 'raw', 16);

	# Check 'running_time_for_motion_pictures_and_videorecordings'.
	# TODO

	# Check 'target_audience'.
	check_target_audience($self, 'target_audience');

	# Check 'technique'.
	# TODO

	# Check 'type_of_visual_material'.
	# TODO

	return;
}

1;
