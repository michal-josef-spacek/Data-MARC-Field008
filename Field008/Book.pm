package Data::MARC::Field008::Book;

use strict;
use warnings;

use Mo qw(build is);
use Mo::utils 0.22 qw(check_length_fix check_required);

our $VERSION = 0.01;

has biography => (
	is => 'ro',
);

has conference_publication => (
	is => 'ro',
);

has festschrift => (
	is => 'ro',
);

has form_of_item => (
	is => 'ro',
);

has government_publication => (
	is => 'ro',
);

has illustrations => (
	is => 'ro',
);

has index => (
	is => 'ro',
);

has literary_form => (
	is => 'ro',
);

has nature_of_content => (
	is => 'ro',
);

has raw => (
	is => 'ro',
);

has target_audience => (
	is => 'ro',
);


sub BUILD {
	my $self = shift;

	# Check 'biography'.
	# TODO

	# Check 'conference_publication'.
	# TODO

	# Check 'festschrift'.
	# TODO

	# Check 'form_of_item'.
	# TODO

	# Check 'government_publication'.
	# TODO

	# Check 'illustrations'.
	# TODO

	# Check 'index'.
	# TODO

	# Check 'literary_form'.
	# TODO

	# Check 'nature_of_content'.
	# TODO

	# Check 'raw'
	check_required($self, 'raw');
	check_length_fix($self, 'raw', 16);

	# Check 'target_audience'.
	# TODO

	return;
}

1;
