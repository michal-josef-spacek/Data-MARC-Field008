package Data::MARC::Field008::MixedMaterial;

use strict;
use warnings;

use Data::MARC::Field008::Utils qw(check_item_form);
use Mo qw(build is);
use Mo::utils 0.22 qw(check_length_fix check_required check_strings);

our $VERSION = 0.01;

has form_of_item => (
	is => 'ro',
);

has raw => (
	is => 'ro',
);

sub BUILD {
	my $self = shift;

	# Check 'form_of_item'.
	check_item_form($self, 'form_of_item');

	# Check 'raw'
	check_length_fix($self, 'raw', 16);

	return;
}

1;
