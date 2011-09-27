use strict;
use warnings;

package Data::DDI::Variable;

# ABSTRACT: Variable description class

sub new {
    my $class = shift;
    my $rh    = shift;
    return bless $rh, $class;
}

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

=cut


1;

sub source {
    my $self = shift;
    return $self->{respUnit};
}

sub range {
    my $self = shift;
    return $self->{valrng};
}

sub decimals {
    my $self = shift;
    return $self->{dcml};
}

sub raw {
    my $self = shift;
    return $self;
}

sub id {
    my $self = shift;
    return $self->{id};
}

sub location {
    my $self = shift;
    return $self->{location};
}

sub files {
    my $self = shift;
    return $self->{files};
}

sub name {
    my $self = shift;
    return $self->{name};
}

sub label {
    my $self = shift;
    return $self->{labl};
}

sub definition {
    my $self = shift;
    return $self->{txt};
}

sub notes {
    my $self = shift;
    return $self->{notes};
}

sub format {
    my $self = shift;
    return $self->{varFormat};
}

sub categories {
    my $self = shift;
    return $self->{catgry};
}

sub intervals {
    my $self = shift;
    return $self->{intrvl};
}
