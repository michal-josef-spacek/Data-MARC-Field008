package Data::MARC::Field008::Utils;

use base qw(Exporter);
use strict;
use warnings;

use Error::Pure qw(err);
use List::Util 1.33 qw(none);
use Readonly;

Readonly::Array our @EXPORT_OK => qw(check_type_of_date);
Readonly::Array our @TYPE_OF_DATES => qw(b c d e i k m n p q r s t u |);

our $VERSION = 0.01;

sub check_type_of_date {
	my ($self, $key) = @_;

	if (! exists $self->{$key} || ! defined $self->{$key}) {
		err "Parameter '$key' is required.";
	}
	if (ref $self->{$key} ne '') {
		err "Parameter '$key' must be a scalar value.",
			'Reference', (ref, $self->{$key}),
		;
	}
	if (length $self->{$key} != 1) {
		err "Parameter '$key' length is bad.",
			'Length', (length $self->{$key}),
			'Value', $self->{$key},
		;
	}
	if (none { $self->{$key} eq $_ } @TYPE_OF_DATES) {
		err "Parameter '$key' has bad value.",
			'Value', $self->{$key},
		;
	}

	return;
}

1;
