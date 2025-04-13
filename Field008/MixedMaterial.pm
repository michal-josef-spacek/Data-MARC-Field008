package Data::MARC::Field008::MixedMaterial;

use strict;
use warnings;

use Mo qw(build is);
use Mo::utils 0.22 qw(check_length_fix);

our $VERSION = 0.01;

has raw => (
	is => 'ro',
);

sub BUILD {
	my $self = shift;

	# Check 'raw'
	check_length_fix($self, 'raw', 16);

	return;
}

1;
