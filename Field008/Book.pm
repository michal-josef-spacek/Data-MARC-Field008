package Data::MARC::Field008::Book;

use strict;
use warnings;

use Data::MARC::Field008::Utils qw(check_book_biography check_book_festschrift
	check_book_illustration check_book_literary_form check_book_nature_of_content
	check_conference_publication check_government_publication check_index
	check_item_form check_target_audience);
use Mo qw(build is);
use Mo::utils 0.22 qw(check_length_fix check_required);

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

	# Check 'biography'.
	check_book_biography($self, 'biography');

	# Check 'conference_publication'.
	check_conference_publication($self, 'conference_publication');

	# Check 'festschrift'.
	check_book_festschrift($self, 'festschrift');

	# Check 'form_of_item'.
	check_item_form($self, 'form_of_item');

	# Check 'government_publication'.
	check_government_publication($self, 'government_publication');

	# Check 'illustrations'.
	check_book_illustration($self, 'illustrations');

	# Check 'index'.
	check_index($self, 'index');

	# Check 'literary_form'.
	check_book_literary_form($self, 'literary_form');

	# Check 'nature_of_content'.
	check_book_nature_of_content($self, 'nature_of_content');

	# Check 'raw'
	check_length_fix($self, 'raw', 16);

	# Check 'target_audience'.
	check_target_audience($self, 'target_audience');

	return;
}

1;
