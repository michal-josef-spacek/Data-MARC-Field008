package Data::MARC::Field008::ComputerFile;

use strict;
use warnings;

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

has target_audience => (
	is => 'ro',
);

has type_of_computer_file => (
	is => 'ro',
);

sub BUILD {
	my $self = shift;

	# Check 'form_of_item'.
	# TODO

	# Check 'government_publication'.
	# TODO

	# Check 'raw'
	check_required($self, 'raw');
	check_length_fix($self, 'raw', 16);

	# Check 'target_audience'.
	# TODO

	# Check 'type_of_computer_file'.
	# TODO

	return;
}

1;
