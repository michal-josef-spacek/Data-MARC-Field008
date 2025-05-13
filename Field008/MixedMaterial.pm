package Data::MARC::Field008::MixedMaterial;

use strict;
use warnings;

use Data::MARC::Field008::Utils qw(check_item_form);
use Error::Pure qw(err);
use Error::Pure::Utils qw(err_get);
use Mo qw(build is);
use Mo::utils 0.22 qw(check_length_fix check_required check_strings);

our $STRICT = 1;

our $VERSION = 0.01;

has form_of_item => (
	is => 'ro',
);

has raw => (
	is => 'ro',
);

sub BUILD {
	my $self = shift;

	# Check 'raw'
	check_length_fix($self, 'raw', 17);

	# Check 'form_of_item'.
	eval { check_item_form($self, 'form_of_item'); };

	if ($STRICT) {
		my @errors = err_get();
		if (@errors) {
			err "Couldn't create data object of mixed material.",
				defined $self->raw ? ('Raw string', $self->raw) : (),
			;
		}
	}

	return;
}

1;
