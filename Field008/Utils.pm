package Data::MARC::Field008::Utils;

use base qw(Exporter);
use strict;
use warnings;

use Error::Pure qw(err);
use List::Util 1.33 qw(none);
use Readonly;

Readonly::Array our @EXPORT_OK => qw(check_date check_map_cartographic_material_type
	check_map_government_publication check_map_projection check_map_relief
	check_type_of_date);
Readonly::Array our @TYPE_OF_DATES => qw(b c d e i k m n p q r s t u |);
Readonly::Array our @MAP_CARTOGRAPHIC_MATERIAL_TYPES => qw(a b c d e f g u z |);
Readonly::Array our @MAP_GOVERNMENT_PUBLICATIONS => (' ', 'a', 'c', 'f', 'i',
	'l', 'm', 'o', 's', 'u', 'z', '|');
Readonly::Array our @MAP_PROJECTIONS => ('  ', 'aa', 'ab', 'ac', 'ad', 'ae',
	'af', 'ag', 'am', 'an', 'ap', 'au', 'az', 'ba', 'bb', 'bc', 'bd', 'be',
	'bf', 'bg', 'bh', 'bi', 'bj', 'bk', 'bl', 'bo', 'br', 'bs', 'bu', 'bz',
	'ca', 'cb', 'cc', 'ce', 'cp', 'cu', 'cz', 'da', 'db', 'dc', 'dd', 'de',
	'df', 'dg', 'dh', 'dl', 'zz', '||');

our $VERSION = 0.01;

sub check_date {
	my ($self, $key) = @_;

	if (! exists $self->{$key} || ! defined $self->{$key}) {
		err "Parameter '$key' is required.";
	}
	if (ref $self->{$key} ne '') {
		err "Parameter '$key' must be a scalar value.",
			'Reference', (ref, $self->{$key}),
		;
	}
	if (length $self->{$key} != 4) {
		err "Parameter '$key' length is bad.",
			'Length', (length $self->{$key}),
			'Value', $self->{$key},
		;
	}
	if ($self->{$key} !~ m/^[\ \|\du]{4}$/ms) {
		err "Parameter '$key' has bad value.",
			'Value', $self->{$key},
		;
	}
	if ($self->{$key} ne '    ' && $self->{$key} =~ m/\ /ms) {
		err "Parameter '$key' has value with space character.",
			'Value', $self->{$key},
		;
	}
	if ($self->{$key} ne '||||' && $self->{$key} =~ m/\|/ms) {
		err "Parameter '$key' has value with pipe character.",
			'Value', $self->{$key},
		;
	}

	return;
}

sub check_map_cartographic_material_type {
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
	if (none { $self->{$key} eq $_ } @MAP_CARTOGRAPHIC_MATERIAL_TYPES) {
		err "Parameter '$key' has bad value.",
			'Value', $self->{$key},
		;
	}

	return;
}

sub check_map_government_publication {
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
	if (none { $self->{$key} eq $_ } @MAP_GOVERNMENT_PUBLICATIONS) {
		err "Parameter '$key' has bad value.",
			'Value', $self->{$key},
		;
	}

	return;
}

sub check_map_projection {
	my ($self, $key) = @_;

	if (! exists $self->{$key} || ! defined $self->{$key}) {
		err "Parameter '$key' is required.";
	}
	if (ref $self->{$key} ne '') {
		err "Parameter '$key' must be a scalar value.",
			'Reference', (ref, $self->{$key}),
		;
	}
	if (length $self->{$key} != 2) {
		err "Parameter '$key' length is bad.",
			'Length', (length $self->{$key}),
			'Value', $self->{$key},
		;
	}
	if (none { $self->{$key} eq $_ } @MAP_PROJECTIONS) {
		err "Parameter '$key' has bad value.",
			'Value', $self->{$key},
		;
	}

	return;
}

sub check_map_relief {
	my ($self, $key) = @_;

	if (! exists $self->{$key} || ! defined $self->{$key}) {
		err "Parameter '$key' is required.";
	}
	if (ref $self->{$key} ne '') {
		err "Parameter '$key' must be a scalar value.",
			'Reference', (ref, $self->{$key}),
		;
	}
	if (length $self->{$key} != 4) {
		err "Parameter '$key' length is bad.",
			'Length', (length $self->{$key}),
			'Value', $self->{$key},
		;
	}
	if ($self->{$key} !~ m/^[\ abcdefgijkmz\|]{4}$/ms) {
		err "Parameter '$key' contain bad relief character.",
			'Value', $self->{$key},
		;
	}
	if ($self->{$key} ne '||||' && $self->{$key} =~ m/\|/ms) {
		err "Parameter '$key' has value with pipe character.",
			'Value', $self->{$key},
		;
	}

	return;
}

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
