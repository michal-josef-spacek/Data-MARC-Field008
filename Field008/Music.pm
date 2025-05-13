package Data::MARC::Field008::Music;

use strict;
use warnings;

use Data::MARC::Field008::Utils qw(check_item_form
	check_music_accompanying_matter check_music_composition_form
	check_music_format check_music_literary_text check_music_part
	check_music_transposition_and_arrangement check_target_audience);
use Error::Pure qw(err);
use Error::Pure::Utils qw(err_get);
use Mo qw(build is);
use Mo::utils 0.22 qw(check_length_fix check_required);

our $STRICT = 1;

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

	# Check 'raw'
	check_length_fix($self, 'raw', 17);

	# Check 'accompanying_matter'.
	eval { check_music_accompanying_matter($self, 'accompanying_matter'); };

	# Check 'form_of_composition'.
	eval { check_music_composition_form($self, 'form_of_composition'); };

	# Check 'form_of_item'.
	eval { check_item_form($self, 'form_of_item'); };

	# Check 'format_of_music'.
	eval { check_music_format($self, 'format_of_music'); };

	# Check 'literary_text_for_sound_recordings'.
	eval { check_music_literary_text($self, 'literary_text_for_sound_recordings'); };

	# Check 'music_parts'.
	eval { check_music_part($self, 'music_parts'); };

	# Check 'target_audience'.
	eval { check_target_audience($self, 'target_audience'); };

	# Check 'transposition_and_arrangement'.
	eval { check_music_transposition_and_arrangement($self, 'transposition_and_arrangement'); };

	if ($STRICT) {
		my @errors = err_get();
		if (@errors) {
			err "Couldn't create data object of music.",
				defined $self->raw ? ('Raw string', $self->raw) : (),
			;
		}
	}

	return;
}

1;
