package Data::MARC::Field008::Utils;

use base qw(Exporter);
use strict;
use warnings;

use Error::Pure qw(err);
use List::Util 1.33 qw(none);
use Readonly;

Readonly::Array our @EXPORT_OK => qw(check_book_biography check_book_festschrift
	check_book_illustration check_book_literary_form check_book_nature_of_content
	check_computer_file_item_form check_computer_file_type
	check_conference_publication check_continuing_resource_entry_convention
	check_continuing_resource_form_of_original_item
	check_continuing_resource_frequency check_continuing_resource_nature_of_content
	check_continuing_resource_nature_of_entire_work
	check_continuing_resource_original_alphabet_or_script
	check_continuing_resource_regularity
	check_continuing_resource_type check_date check_government_publication
	check_index check_item_form check_map_cartographic_material_type
	check_map_projection check_map_relief check_map_special_format
	check_music_accompanying_matter check_music_composition_form
	check_music_format check_music_part check_music_transposition_and_arrangement
	check_target_audience check_type_of_date);
Readonly::Array our @BOOK_BIOGRAPHIES => (' ', 'a', 'b', 'c', 'd', '|');
Readonly::Array our @BOOK_FESTSCHRIFTS => qw(0 1 |);
Readonly::Array our @BOOK_LITERARY_FORMS => qw(0 1 d e f h i j m p s u |);
Readonly::Array our @COMPUTER_FILE_ITEM_FORMS => (' ', 'o', 'q', '|');
Readonly::Array our @COMPUTER_FILE_TYPE => qw(a b c d e f g h i j m u z |);
Readonly::Array our @CONFERENCE_PUBLICATIONS => qw(0 1 |);
Readonly::Array our @CONTINUING_RESOURCES_ENTRY_CONVENTIONS => qw(0 1 2 |);
Readonly::Array our @CONTINUING_RESOURCES_FORMS_OF_ORIGINAL_ITEM => (' ', 'a',
	'b', 'c', 'd', 'e', 'f', 'o', 'q', 's', '|');
Readonly::Array our @CONTINUING_RESOURCES_FREQUENCIES => (' ', 'a', 'b', 'c',
	'd', 'e', 'f', 'g', 'h', 'i', 'j', 'k', 'm', 'q', 's', 't', 'u', 'w',
	'z', '|');
Readonly::Array our @CONTINUING_RESOURCES_NATURE_OF_ENTIRE_WORKS => (' ', 'a',
	'b', 'c', 'd', 'e', 'f', 'g', 'h', 'i', 'k', 'l', 'm', 'n', 'o', 'p',
	'q', 'r', 's', 't', 'u', 'v', 'w', 'y', 'z', '5', '6', '|');
Readonly::Array our @CONTINUING_RESOURCES_ORIGINAL_ALPHABETS_OR_SCRIPTS => (' ',
	'a', 'b', 'c', 'd', 'e', 'f', 'g', 'h', 'i', 'j', 'k', 'l', 'u', 'z',
	'|');
Readonly::Array our @CONTINUING_RESOURCES_REGULARITIES => qw(n r u x |);
Readonly::Array our @CONTINUING_RESOURCES_TYPES => (' ', 'd', 'g', 'h', 'j',
	'l', 'm', 'n', 'p', 'r', 's', 't', 'w', '|');
Readonly::Array our @GOVERNMENT_PUBLICATIONS => (' ', 'a', 'c', 'f', 'i',
	'l', 'm', 'o', 's', 'u', 'z', '|');
Readonly::Array our @INDEXES => qw(0 1 |);
Readonly::Array our @ITEM_FORMS => (' ', 'a', 'b', 'c', 'd', 'f', 'o', 'q',
	'r', 's', '|');
Readonly::Array our @MAP_CARTOGRAPHIC_MATERIAL_TYPES => qw(a b c d e f g u z |);
Readonly::Array our @MAP_PROJECTIONS => ('  ', 'aa', 'ab', 'ac', 'ad', 'ae',
	'af', 'ag', 'am', 'an', 'ap', 'au', 'az', 'ba', 'bb', 'bc', 'bd', 'be',
	'bf', 'bg', 'bh', 'bi', 'bj', 'bk', 'bl', 'bo', 'br', 'bs', 'bu', 'bz',
	'ca', 'cb', 'cc', 'ce', 'cp', 'cu', 'cz', 'da', 'db', 'dc', 'dd', 'de',
	'df', 'dg', 'dh', 'dl', 'zz', '||');
Readonly::Array our @MUSIC_COMPOSITION_FORMS => qw(an bd bg bl bt ca cb cc cg ch
	cl cn co cp cr cs ct cy cz df dv fg fl fm ft gm hy jz mc md mi mo mp mr
	ms mu mz nc nn op or ov pg pm po pp pr ps pt pv rc rd rg ri rp rq sd sg
	sn sp st su sy tc tl ts uu vi vr wz za zz ||);
Readonly::Array our @MUSIC_FORMATS => qw(a b c d e g h i j k l m n p u z |);
Readonly::Array our @MUSIC_PARTS => (' ', 'd', 'e', 'f', 'n', 'u', '|');
Readonly::Array our @MUSIC_TRANSPOSITIONS_AND_ARRANGEMENTS => (' ', 'a', 'b',
	'c', 'n', 'u', '|');
Readonly::Array our @TARGET_AUDIENCES => (' ', 'a', 'b', 'c', 'd', 'e', 'f',
	'g', 'j', '|');
Readonly::Array our @TYPE_OF_DATES => qw(b c d e i k m n p q r s t u |);

our $VERSION = 0.01;

sub check_book_biography {
	my ($self, $key) = @_;

	_check_base($self, $key);
	_check_length($self, $key, 1);
	_check_bad_value($self, $key, \@BOOK_BIOGRAPHIES);

	return;
}

sub check_book_festschrift {
	my ($self, $key) = @_;

	_check_base($self, $key);
	_check_length($self, $key, 1);
	_check_bad_value($self, $key, \@BOOK_FESTSCHRIFTS);

	return;
}

sub check_book_illustration {
	my ($self, $key) = @_;

	_check_base($self, $key);
	_check_length($self, $key, 4);
	if ($self->{$key} !~ m/^[\ abcdefghijklmop\|]{4}$/ms) {
		err "Parameter '$key' contains bad book illustration character.",
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

sub check_book_literary_form {
	my ($self, $key) = @_;

	_check_base($self, $key);
	_check_length($self, $key, 1);
	_check_bad_value($self, $key, \@BOOK_LITERARY_FORMS);

	return;
}

sub check_book_nature_of_content {
	my ($self, $key) = @_;

	_check_base($self, $key);
	_check_length($self, $key, 4);
	if ($self->{$key} !~ m/^[\ abcdefgijklmnopqrstuvwyz256\|]{4}$/ms) {
		err "Parameter '$key' has bad value.",
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

sub check_computer_file_item_form {
	my ($self, $key) = @_;

	_check_base($self, $key);
	_check_length($self, $key, 1);
	_check_bad_value($self, $key, \@COMPUTER_FILE_ITEM_FORMS);

	return;
}

sub check_computer_file_type {
	my ($self, $key) = @_;

	_check_base($self, $key);
	_check_length($self, $key, 1);
	_check_bad_value($self, $key, \@COMPUTER_FILE_TYPE);

	return;
}

sub check_conference_publication {
	my ($self, $key) = @_;

	_check_base($self, $key);
	_check_length($self, $key, 1);
	_check_bad_value($self, $key, \@CONFERENCE_PUBLICATIONS);

	return;
}

sub check_continuing_resource_entry_convention {
	my ($self, $key) = @_;

	_check_base($self, $key);
	_check_length($self, $key, 1);
	_check_bad_value($self, $key, \@CONTINUING_RESOURCES_ENTRY_CONVENTIONS);

	return;
}

sub check_continuing_resource_form_of_original_item {
	my ($self, $key) = @_;

	_check_base($self, $key);
	_check_length($self, $key, 1);
	_check_bad_value($self, $key, \@CONTINUING_RESOURCES_FORMS_OF_ORIGINAL_ITEM);

	return;
}

sub check_continuing_resource_frequency {
	my ($self, $key) = @_;

	_check_base($self, $key);
	_check_length($self, $key, 1);
	_check_bad_value($self, $key, \@CONTINUING_RESOURCES_FREQUENCIES);

	return;
}

sub check_continuing_resource_nature_of_content {
	my ($self, $key) = @_;

	_check_base($self, $key);
	_check_length($self, $key, 3);
	if ($self->{$key} !~ m/^[\ abcdefghiklmnopqrstuvwyz56\|]{3}$/ms) {
		err "Parameter '$key' has bad value.",
			'Value', $self->{$key},
		;
	}
	if ($self->{$key} ne '|||' && $self->{$key} =~ m/\|/ms) {
		err "Parameter '$key' has value with pipe character.",
			'Value', $self->{$key},
		;
	}

	return;
}

sub check_continuing_resource_nature_of_entire_work {
	my ($self, $key) = @_;

	_check_base($self, $key);
	_check_length($self, $key, 1);
	_check_bad_value($self, $key, \@CONTINUING_RESOURCES_NATURE_OF_ENTIRE_WORKS);

	return;
}

sub check_continuing_resource_original_alphabet_or_script {
	my ($self, $key) = @_;

	_check_base($self, $key);
	_check_length($self, $key, 1);
	_check_bad_value($self, $key, \@CONTINUING_RESOURCES_ORIGINAL_ALPHABETS_OR_SCRIPTS);

	return;
}

sub check_continuing_resource_regularity {
	my ($self, $key) = @_;

	_check_base($self, $key);
	_check_length($self, $key, 1);
	_check_bad_value($self, $key, \@CONTINUING_RESOURCES_REGULARITIES);

	return;
}

sub check_continuing_resource_type {
	my ($self, $key) = @_;

	_check_base($self, $key);
	_check_length($self, $key, 1);
	_check_bad_value($self, $key, \@CONTINUING_RESOURCES_TYPES);

	return;
}

sub check_date {
	my ($self, $key) = @_;

	_check_base($self, $key);
	_check_length($self, $key, 4);
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

sub check_government_publication {
	my ($self, $key) = @_;

	_check_base($self, $key);
	_check_length($self, $key, 1);
	_check_bad_value($self, $key, \@GOVERNMENT_PUBLICATIONS);

	return;
}

sub check_index {
	my ($self, $key) = @_;

	_check_base($self, $key);
	_check_length($self, $key, 1);
	_check_bad_value($self, $key, \@INDEXES);

	return;
}

sub check_item_form {
	my ($self, $key) = @_;

	_check_base($self, $key);
	_check_length($self, $key, 1);
	_check_bad_value($self, $key, \@ITEM_FORMS);

	return;
}

sub check_map_cartographic_material_type {
	my ($self, $key) = @_;

	_check_base($self, $key);
	_check_length($self, $key, 1);
	_check_bad_value($self, $key, \@MAP_CARTOGRAPHIC_MATERIAL_TYPES);

	return;
}

sub check_map_projection {
	my ($self, $key) = @_;

	_check_base($self, $key);
	_check_length($self, $key, 2);
	_check_bad_value($self, $key, \@MAP_PROJECTIONS);

	return;
}

sub check_map_relief {
	my ($self, $key) = @_;

	_check_base($self, $key);
	_check_length($self, $key, 4);
	if ($self->{$key} !~ m/^[\ abcdefgijkmz\|]{4}$/ms) {
		err "Parameter '$key' contains bad relief character.",
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

sub check_map_special_format {
	my ($self, $key) = @_;

	_check_base($self, $key);
	_check_length($self, $key, 2);
	if ($self->{$key} !~ m/^[\ ejklnoprz\|]{2}$/ms) {
		err "Parameter '$key' contains bad special format characteristics character.",
			'Value', $self->{$key},
		;
	}
	if ($self->{$key} ne '||' && $self->{$key} =~ m/\|/ms) {
		err "Parameter '$key' has value with pipe character.",
			'Value', $self->{$key},
		;
	}

	return;
}

sub check_music_accompanying_matter {
	my ($self, $key) = @_;

	_check_base($self, $key);
	_check_length($self, $key, 5);
	if ($self->{$key} !~ m/^[\ abcdefghikrsz\|]{5}$/ms) {
		err "Parameter '$key' contains bad music accompanying matter character.",
			'Value', $self->{$key},
		;
	}

	return;
}

sub check_music_composition_form {
	my ($self, $key) = @_;

	_check_base($self, $key);
	_check_length($self, $key, 2);
	_check_bad_value($self, $key, \@MUSIC_COMPOSITION_FORMS);

	return;
}

sub check_music_format {
	my ($self, $key) = @_;

	_check_base($self, $key);
	_check_length($self, $key, 1);
	_check_bad_value($self, $key, \@MUSIC_FORMATS);

	return;
}

sub check_music_part {
	my ($self, $key) = @_;

	_check_base($self, $key);
	_check_length($self, $key, 1);
	_check_bad_value($self, $key, \@MUSIC_PARTS);

	return;
}

sub check_music_transposition_and_arrangement {
	my ($self, $key) = @_;

	_check_base($self, $key);
	_check_length($self, $key, 1);
	_check_bad_value($self, $key, \@MUSIC_TRANSPOSITIONS_AND_ARRANGEMENTS);

	return;
}

sub check_target_audience {
	my ($self, $key) = @_;

	_check_base($self, $key);
	_check_length($self, $key, 1);
	_check_bad_value($self, $key, \@TARGET_AUDIENCES);

	return;
}

sub check_type_of_date {
	my ($self, $key) = @_;

	_check_base($self, $key);
	_check_length($self, $key, 1);
	_check_bad_value($self, $key, \@TYPE_OF_DATES);

	return;
}

sub _check_bad_value {
	my ($self, $key, $keys_ar) = @_;

	if (none { $self->{$key} eq $_ } @{$keys_ar}) {
		err "Parameter '$key' has bad value.",
			'Value', $self->{$key},
		;
	}

	return;
}

sub _check_base {
	my ($self, $key) = @_;

	if (! exists $self->{$key} || ! defined $self->{$key}) {
		err "Parameter '$key' is required.";
	}
	if (ref $self->{$key} ne '') {
		err "Parameter '$key' must be a scalar value.",
			'Reference', (ref, $self->{$key}),
		;
	}

	return;
}

sub _check_length {
	my ($self, $key, $exp_length) = @_;

	if (length $self->{$key} != $exp_length) {
		err "Parameter '$key' length is bad.",
			'Length', (length $self->{$key}),
			'Value', $self->{$key},
			'Expected length', $exp_length,
		;
	}

	return;
}

1;
