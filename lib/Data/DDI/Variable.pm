use strict;
use warnings;

package Data::DDI::Variable;

# ABSTRACT: Variable description class

use Moose;
use MooseX::Aliases;

=head2 Accessors

    $Object->raw();
    
    $Object->location();
    $Object->files();
    $Object->name();
    $Object->label();
    $Object->definition();
    $Object->format();
    $Object->categories();
    $Object->intervals();
    $Object->notes();
    $Object->id();
    $Object->decimals();
    $Object->range();
    $Object->source();
    $Object->universe();

    $Object->get_categories();

Returns a reference to a hash where the keys are the category values
and the values are the category labels. Will return undef if the variable 
is numeric or no categories were supplied.

    $Object->is_numeric();
    
Returns true if the variable is numeric and undef in all other cases.

=cut

has 'labl'      => ( is => 'ro', 'isa' => 'Str', alias => 'label'     );
has 'txt'       => ( is => 'ro', 'isa' => 'Str', alias => 'definition');
has 'id'        => ( is => 'ro', 'isa' => 'Str'        );
has 'respUnit'  => ( is => 'ro',  alias => 'source'    );
has 'valrng'    => ( is => 'ro',  alias => 'range'     );
has 'dcml'      => ( is => 'ro',  alias => 'decimals'  );
has 'catgry'    => ( is => 'ro',  alias => 'catgry'    );
has 'intrvl'    => ( is => 'ro',  alias => 'intervals' );
has 'files'     => ( is => 'ro', 'isa' => 'Str' );
has 'name'      => ( is => 'ro', 'isa' => 'Str' );
has 'location'  => ( is => 'ro',  );
has 'notes'     => ( is => 'ro',  );
has 'catgry'    => ( is => 'ro', alias => 'categories' );
has 'varFormat' => ( is => 'ro', alias => 'format'     );  
has 'concept'   => ( is => 'ro' );
has 'universe'  => ( is => 'ro' );

sub raw {
    my $self = shift;
    return $self;
}

sub get_categories {
    my $self   = shift;
    my $ra_raw = $self->categories;
    
    if ( $self->is_numeric ) {
        return undef;
    }
    
    my $rh_out = { };
    
    foreach my $rh ( @$ra_raw ) {
        
        my $category = $rh->{catValu};
        my $label    = $rh->{labl};
        
        $rh_out->{ $category } = $label;
        
    }

    return $rh_out;
}


sub is_numeric {
    my $self = shift;
    my $rh_format = $self->format;
    if ( $rh_format->{type} eq 'numeric' ) {
        return 1;
    } else {
        return undef;
    }
}

1;
