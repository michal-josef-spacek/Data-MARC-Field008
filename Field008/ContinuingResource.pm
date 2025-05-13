package Data::MARC::Field008::ContinuingResource;

use strict;
use warnings;

use Data::MARC::Field008::Utils qw(check_conference_publication
	check_continuing_resource_entry_convention
	check_continuing_resource_form_of_original_item
	check_continuing_resource_frequency
	check_continuing_resource_nature_of_content
	check_continuing_resource_nature_of_entire_work
	check_continuing_resource_original_alphabet_or_script
	check_continuing_resource_regularity
	check_continuing_resource_type
	check_government_publication check_item_form);
use Error::Pure qw(err);
use Error::Pure::Utils qw(err_get);
use Mo qw(build is);
use Mo::utils 0.22 qw(check_length_fix check_required);

our $STRICT = 1;

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

	# Check 'raw'.
	check_length_fix($self, 'raw', 17);

	# Check 'conference_publication'.
	eval { check_conference_publication($self, 'conference_publication'); };

	# Check 'entry_convention'.
	eval {check_continuing_resource_entry_convention($self, 'entry_convention'); };

	# Check 'form_of_item'.
	eval { check_item_form($self, 'form_of_item'); };

	# Check 'form_of_original_item'.
	eval { check_continuing_resource_form_of_original_item($self, 'form_of_original_item'); };

	# Check 'frequency'.
	eval { check_continuing_resource_frequency($self, 'frequency'); };

	# Check 'government_publication'.
	eval { check_government_publication($self, 'government_publication'); };

	# Check 'nature_of_content'.
	eval { check_continuing_resource_nature_of_content($self, 'nature_of_content'); };

	# Check 'nature_of_entire_work'.
	eval { check_continuing_resource_nature_of_entire_work($self, 'nature_of_entire_work'); };

	# Check 'original_alphabet_or_script_of_title'.
	eval { check_continuing_resource_original_alphabet_or_script($self, 'original_alphabet_or_script_of_title'); };

	# Check 'regularity'.
	eval { check_continuing_resource_regularity($self, 'regularity'); };

	# Check 'type_of_continuing_resource'.
	eval { check_continuing_resource_type($self, 'type_of_continuing_resource'); };

	if ($STRICT) {
		my @errors = err_get();
		if (@errors) {
			err "Couldn't create data object of continuing resource.",
				defined $self->raw ? ('Raw string', $self->raw) : (),
			;
		}
	}

	return;
}

1;
