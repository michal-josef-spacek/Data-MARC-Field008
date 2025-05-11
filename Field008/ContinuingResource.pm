package Data::MARC::Field008::ContinuingResource;

use strict;
use warnings;

use Data::MARC::Field008::Utils qw(check_conference_publication
	check_continuing_resource_entry_convention
	check_continuing_resource_form_of_original_item
	check_continuing_resource_frequency
	check_continuing_resource_nature_of_content
	check_continuing_resource_nature_of_entire_work
	check_continuing_resource_regularity
	check_continuing_resource_type
	check_government_publication check_item_form);
use Mo qw(build is);
use Mo::utils 0.22 qw(check_length_fix check_required);

our $VERSION = 0.01;

has conference_publication => (
	is => 'ro',
);

has entry_convention => (
	is => 'ro',
);

has form_of_item => (
	is => 'ro',
);

has form_of_original_item => (
	is => 'ro',
);

has frequency => (
	is => 'ro',
);

has government_publication => (
	is => 'ro',
);

has nature_of_content => (
	is => 'ro',
);

has nature_of_entire_work => (
	is => 'ro',
);

has original_alphabet_or_script_of_title => (
	is => 'ro',
);

has raw => (
	is => 'ro',
);

has regularity => (
	is => 'ro',
);

has type_of_continuing_resource => (
	is => 'ro',
);

sub BUILD {
	my $self = shift;

	# Check 'conference_publication'.
	check_conference_publication($self, 'conference_publication');

	# Check 'entry_convention'.
	check_continuing_resource_entry_convention($self, 'entry_convention');

	# Check 'form_of_item'.
	check_item_form($self, 'form_of_item');

	# Check 'form_of_original_item'.
	check_continuing_resource_form_of_original_item($self, 'form_of_original_item');

	# Check 'frequency'.
	check_continuing_resource_frequency($self, 'frequency');

	# Check 'government_publication'.
	check_government_publication($self, 'government_publication');

	# Check 'nature_of_content'.
	check_continuing_resource_nature_of_content($self, 'nature_of_content');

	# Check 'nature_of_entire_work'.
	check_continuing_resource_nature_of_entire_work($self, 'nature_of_entire_work');

	# Check 'original_alphabet_or_script_of_title'.
	# TODO

	# Check 'raw'
	check_length_fix($self, 'raw', 16);

	# Check 'regularity'.
	check_continuing_resource_regularity($self, 'regularity');

	# Check 'type_of_continuing_resource'.
	check_continuing_resource_type($self, 'type_of_continuing_resource');

	return;
}

1;
