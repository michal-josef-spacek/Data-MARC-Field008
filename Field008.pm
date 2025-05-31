package Data::MARC::Field008;

use strict;
use warnings;

use Data::MARC::Field008::Utils qw(check_cataloging_source check_date
	check_modified_record check_type_of_date);
use Error::Pure qw(err);
use Error::Pure::Utils qw(err_get);
use Mo qw(build is);
use Mo::utils 0.22 qw(check_isa check_length_fix check_number check_regexp
	check_required check_strings);
use Readonly;

Readonly::Array our @MATERIAL_TYPES => qw(book computer_file continuing_resource
	map mixed_material music visual_material);

our $VERSION = 0.01;

has cataloging_source => (
	is => 'ro',
);

has date_entered_on_file => (
	is => 'ro',
);

has date1 => (
	is => 'ro',
);

has date2 => (
	is => 'ro',
);

has language => (
	is => 'ro',
);

has material => (
	is => 'ro',
);

has material_type => (
	is => 'ro',
);

has modified_record => (
	is => 'ro',
);

has place_of_publication => (
	is => 'ro',
);

has raw => (
	is => 'ro',
);

has type_of_date => (
	is => 'ro',
);

sub BUILD {
	my $self = shift;

	# Check 'cataloging_source'.
	check_cataloging_source($self, 'cataloging_source');

	# Check 'date_entered_on_file'.
	check_required($self, 'date_entered_on_file');
	check_length_fix($self, 'date_entered_on_file', 6);
	if (defined $self->{'date_entered_on_file'} && $self->{'date_entered_on_file'} ne '      ') {
		check_number($self, 'date_entered_on_file');
	}

	# Check 'date1'.
	check_date($self, 'date1');

	# Check 'date2'.
	check_date($self, 'date2');

	# Check 'language'.
	check_required($self, 'language');
	check_length_fix($self, 'language', 3);

	# Check 'material_type'.
	check_required($self, 'material_type');
	check_strings($self, 'material_type', \@MATERIAL_TYPES);

	# Check 'material'.
	if ($self->material_type eq 'book') {
		check_isa($self, 'material', 'Data::MARC::Field008::Book');
	} elsif ($self->material_type eq 'computer_file') {
		check_isa($self, 'material', 'Data::MARC::Field008::ComputerFile');
	} elsif ($self->material_type eq 'continuing_resource') {
		check_isa($self, 'material', 'Data::MARC::Field008::ContinuingResource');
	} elsif ($self->material_type eq 'map') {
		check_isa($self, 'material', 'Data::MARC::Field008::Map');
	} elsif ($self->material_type eq 'mixed_material') {
		check_isa($self, 'material', 'Data::MARC::Field008::MixedMaterial');
	} elsif ($self->material_type eq 'music') {
		check_isa($self, 'material', 'Data::MARC::Field008::Music');
	} elsif ($self->material_type eq 'visual_material') {
		check_isa($self, 'material', 'Data::MARC::Field008::VisualMaterial');
	}

	# Check 'modified_record'
	check_modified_record($self, 'modified_record');

	# Check place_of_publication.
	check_required($self, 'place_of_publication');
	check_length_fix($self, 'place_of_publication', 3);

	# Check 'raw'
	check_length_fix($self, 'raw', 40);

	# Check 'type_of_date'.
	check_type_of_date($self, 'type_of_date');

	# Explicit error in case of not strict mode.
	my @errors = err_get();
	if (@errors) {
		err "Field 008 isn't valid.",
			defined $self->{'raw'} ? ('Raw string', $self->{'raw'}) : (),
		;
	}

	return;
}

1;

__END__

=pod

=encoding utf8

=head1 NAME

Data::MARC::Field008 - Data object for MARC leader.

=head1 SYNOPSIS

 use Data::MARC::Field008;

 my $obj = Data::MARC::Field008->new(%params);
 my $cataloging_source = $obj->cataloging_source;
 my $date_entered_on_file = $obj->date_entered_on_file;
 my $date1 = $obj->date1;
 my $date2 = $obj->date2;
 my $language = $obj->language;
 my $material = $obj->material;
 my $material_type = $obj->material_type;
 my $modified_record = $obj->modified_record;
 my $place_of_publication = $obj->place_of_publication;
 my $raw = $obj->raw;
 my $type_of_date = $obj->type_of_date;

=head1 METHODS

=head2 C<new>

 my $obj = Data::MARC::Field008->new(%params);

Constructor.

=over 8

=item * C<cataloging_source>

Cataloging source character.

It's required.

Default value is undef.

=item * C<date_entered_on_file>

Date entered on file.

Default values is undef.

=item * C<date1>

Date 1.

Default value is undef.

=item * C<date2>

Date 2.

Default value is undef.

=item * C<language>

TODO

=item * C<material>

TODO

=item * C<material_type>

TODO

=item * C<modified_record>

TODO

=item * C<place_of_publication>

TODO

=item * C<raw>

TODO

=item * C<type_of_date>

TODO

=back

Returns instance of object.

=head2 C<cataloging_source>

 my $cataloging_source = $obj->cataloging_source;

Get cataloging source flag.

Returns character.

TODO

=head1 ERRORS

 new():
         Parameter 'raw' has length different than '40'.
                 Value: %s

=head1 EXAMPLE

=for comment filename=create_and_dump_marc_field_008.pl

 use strict;
 use warnings;

 use Data::Printer;
 use Data::MARC::Field008;

 my $obj = Data::MARC::Field008->new(
         'bibliographic_level' => 'm',
 );

 # Print out.
 p $obj;

 # Output:
 # TODO

=head1 DEPENDENCIES

L<Data::MARC::Field008::Utils>,
L<Error::Pure>
L<Error::Pure::Utils>
L<Mo>,
L<Mo::utils>,
L<Readonly>.

=head1 REPOSITORY

L<https://github.com/michal-josef-spacek/Data-MARC-Field008>

=head1 AUTHOR

Michal Josef Špaček L<mailto:skim@cpan.org>

L<http://skim.cz>

=head1 LICENSE AND COPYRIGHT

© 2025 Michal Josef Špaček

BSD 2-Clause License

=head1 VERSION

0.01

=cut
