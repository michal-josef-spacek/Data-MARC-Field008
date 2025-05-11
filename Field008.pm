package Data::MARC::Field008;

use strict;
use warnings;

use Data::MARC::Field008::Utils qw(check_date check_type_of_date);
use Mo qw(build is);
use Mo::utils 0.22 qw(check_isa check_length_fix check_number check_regexp
	check_required check_strings);
use Readonly;

Readonly::Array our @MATERIAL_TYPES => qw(book computer_file continuing_resource
	map mixed_material music visual_material);

our $VERSION = 0.01;

has cataloging_resource => (
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

	# Check 'date_entered_on_file'.
	check_length_fix($self, 'date_entered_on_file', 6);
	if (defined $self->{'date_entered_on_file'} && $self->{'date_entered_on_file'} ne '      ') {
		check_number($self, 'date_entered_on_file');
	}

	# Check 'date1'.
	check_date($self, 'date1');

	# Check 'date2'.
	check_date($self, 'date2');

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

	# Check place_of_publication.
	check_length_fix($self, 'place_of_publication', 3);

	# Check 'raw'
	check_length_fix($self, 'raw', 40);

	# Check 'type_of_date'.
	check_type_of_date($self, 'type_of_date');

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
 my $date_entered_on_file = $obj->date_entered_on_file;
 my $date1 = $obj->date1;
 my $date2 = $obj->date2;
 my $place_of_publication = $obj->place_of_publication;
 my $type_of_date = $obj->type_of_date;
 # TODO

=head1 METHODS

=head2 C<new>

 my $obj = Data::MARC::Field008->new(%params);

Constructor.

=over 8

=item * C<bibliographic_level>

Bibliographic level flag.

Default values is undef.

TODO

=back

Returns instance of object.

=head2 C<bibliographic_level>

 my $bibliographic_level = $obj->bibliographic_level;

Get bibliographic level flag.

Returns character.

TODO

=head1 ERRORS

 new():
         Parameter 'bibliographic_level' must be one of defined strings.
                 String: %s
                 Possible strings: a b c d i m s
         Parameter 'char_coding_scheme' must be one of defined strings.
                 String: %s
                 Possible strings: ' ' a
         Parameter 'descriptive_cataloging_form' must be one of defined strings.
                 String: %s
                 Possible strings: ' ' a c i n u
         Parameter 'encoding_level' must be one of defined strings.
                 String: %s
                 Possible strings: ' ' 1 2 3 4 5 7 8 u z
         Parameter 'impl_def_portion_len' must be one of defined strings.
                 String: %s
                 Possible strings: 0
         Parameter 'indicator_count' must be one of defined strings.
                 String: %s
                 Possible strings: 2
         Parameter 'length_of_field_portion_len' must be one of defined strings.
                 String: %s
                 Possible strings: 4
         Parameter 'multipart_resource_record_level' must be one of defined strings.
                 String: %s
                 Possible strings: ' ' a b c
         Parameter 'raw' has length different than '24'.
                 Value: %s
         Parameter 'starting_char_pos_portion_len' must be one of defined strings.
                 String: %s
                 Possible strings: 5
         Parameter 'status' must be one of defined strings.
                 String: %s
                 Possible strings: a c d n p
         Parameter 'subfield_code_count' must be one of defined strings.
                 String: %s
                 Possible strings: 2
         Parameter 'type' must be one of defined strings.
                 String: %s
                 Possible strings: a c d e f g i j k m o p r t
         Parameter 'type_of_control' must be one of defined strings.
                 String: %s
                 Possible strings: ' ' a
         Parameter 'undefined' must be one of defined strings.
                 String: %s
                 Possible strings: 0

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
