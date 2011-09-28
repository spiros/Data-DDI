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
has 'universe'  => ( is => 'ro' );

sub raw {
    my $self = shift;
    return $self;
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
