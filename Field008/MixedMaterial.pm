package Data::MARC::Field008::MixedMaterial;

use strict;
use warnings;

use Mo qw(build is);
use Mo::utils 0.22 qw(check_length_fix check_required check_strings);
use Readonly;

Readonly::Array our @FORM_OF_ITEM => (' ', 'a', 'b', 'c', 'd', 'f', 'o', 'q', 'r', 's', '|');

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
	check_required($self, 'form_of_item');
	check_strings($self, 'form_of_item', \@FORM_OF_ITEM);

	# Check 'raw'
	check_required($self, 'raw');
	check_length_fix($self, 'raw', 16);

	return;
}

1;
