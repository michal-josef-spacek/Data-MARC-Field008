package Data::MARC::Field008::Music;

use strict;
use warnings;

use Data::MARC::Field008::Utils qw(check_item_form check_target_audience);
use Mo qw(build is);
use Mo::utils 0.22 qw(check_length_fix check_required);

our $VERSION = 0.01;

has accompanying_matter => (
	is => 'ro',
);

has form_of_composition => (
	is => 'ro',
);

has form_of_item => (
	is => 'ro',
);

has format_of_music => (
	is => 'ro',
);

has literary_text_for_sound_recordings => (
	is => 'ro',
);

has music_parts => (
	is => 'ro',
);

has raw => (
	is => 'ro',
);

has target_audience => (
	is => 'ro',
);

has transposition_and_arrangement => (
	is => 'ro',
);

sub BUILD {
	my $self = shift;

	# Check 'accompanying_matter'.
	# TODO

	# Check 'form_of_composition'.
	# TODO

	# Check 'form_of_item'.
	check_item_form($self, 'form_of_item');

	# Check 'format_of_music'.
	# TODO

	# Check 'literary_text_for_sound_recordings'.
	# TODO

	# Check 'music_parts'.
	# TODO

	# Check 'raw'
	check_length_fix($self, 'raw', 16);

	# Check 'target_audience'.
	check_target_audience($self, 'target_audience');

	# Check 'transposition_and_arrangement'.
	# TODO

	return;
}

1;
