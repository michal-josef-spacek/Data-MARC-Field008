package Data::MARC::Field008::ContinuingResource;

use strict;
use warnings;

use Data::MARC::Field008::Utils qw(check_government_publication);
use Mo qw(build is);
use Mo::utils 0.22 qw(check_length_fix check_required);

our $VERSION = 0.01;

has conference_publication => (
	is => 'ro',
);

has entry_convention => (
	is => 'ro',
);

has form_of_item => (
	is => 'ro',
);

has form_of_original_item => (
	is => 'ro',
);

has frequency => (
	is => 'ro',
);

has government_publication => (
	is => 'ro',
);

has nature_of_content => (
	is => 'ro',
);

has nature_of_entire_work => (
	is => 'ro',
);

has original_alphabet_or_script_of_title => (
	is => 'ro',
);

has raw => (
	is => 'ro',
);

has regularity => (
	is => 'ro',
);

has type_of_continuing_resource => (
	is => 'ro',
);

sub BUILD {
	my $self = shift;

	# Check 'conference_publication'.
	# TODO

	# Check 'entry_convention'.
	# TODO

	# Check 'form_of_item'.
	# TODO

	# Check 'form_of_original_item'.
	# TODO

	# Check 'frequency'.
	# TODO

	# Check 'government_publication'.
	check_government_publication($self, 'government_publication');

	# Check 'nature_of_content'.
	# TODO

	# Check 'nature_of_entire_work'.
	# TODO

	# Check 'original_alphabet_or_script_of_title'.
	# TODO

	# Check 'raw'
	check_length_fix($self, 'raw', 16);

	# Check 'regularity'.
	# TODO

	# Check 'type_of_continuing_resource'.
	# TODO

	return;
}

1;
