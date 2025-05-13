package Data::MARC::Field008::Book;

use strict;
use warnings;

use Data::MARC::Field008::Utils qw(check_book_biography check_book_festschrift
	check_book_illustration check_book_literary_form check_book_nature_of_content
	check_conference_publication check_government_publication check_index
	check_item_form check_target_audience);
use Error::Pure qw(err);
use Error::Pure::Utils qw(err_get);
use Mo qw(build is);
use Mo::utils 0.22 qw(check_length_fix check_required);

our $STRICT = 1;

our $VERSION = 0.01;

has biography => (
	is => 'ro',
);

has conference_publication => (
	is => 'ro',
);

has festschrift => (
	is => 'ro',
);

has form_of_item => (
	is => 'ro',
);

has government_publication => (
	is => 'ro',
);

has illustrations => (
	is => 'ro',
);

has index => (
	is => 'ro',
);

has literary_form => (
	is => 'ro',
);

has nature_of_content => (
	is => 'ro',
);

has raw => (
	is => 'ro',
);

has target_audience => (
	is => 'ro',
);


sub BUILD {
	my $self = shift;

	# Check 'raw'
	check_length_fix($self, 'raw', 17);

	# Check 'biography'.
	eval { check_book_biography($self, 'biography'); };

	# Check 'conference_publication'.
	eval { check_conference_publication($self, 'conference_publication'); };

	# Check 'festschrift'.
	eval { check_book_festschrift($self, 'festschrift'); };

	# Check 'form_of_item'.
	eval { check_item_form($self, 'form_of_item'); };

	# Check 'government_publication'.
	eval { check_government_publication($self, 'government_publication'); };

	# Check 'illustrations'.
	eval { check_book_illustration($self, 'illustrations'); };

	# Check 'index'.
	eval { check_index($self, 'index'); };

	# Check 'literary_form'.
	eval { check_book_literary_form($self, 'literary_form'); };

	# Check 'nature_of_content'.
	eval { check_book_nature_of_content($self, 'nature_of_content'); };

	# Check 'target_audience'.
	eval { check_target_audience($self, 'target_audience'); };

	if ($STRICT) {
		my @errors = err_get();
		if (@errors) {
			err "Couldn't create data object of book.",
				defined $self->raw ? ('Raw string', $self->raw) : (),
			;
		}
	}

	return;
}

1;
