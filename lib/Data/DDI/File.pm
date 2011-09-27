use strict;
use warnings;

package Data::DDI::File;

# ABSTRACT: File description class

sub new {
    my $class = shift;
    my $rh    = shift;
    return bless $rh, $class;
}

=head2 Accessors

    $Object->file_description();
    $Object->uri();
    $Object->id();

=cut

sub file_description {
    my $self = shift;
    return $self->{fileTxt};
}

sub uri {
    my $self = shift;
    return $self->{URI};
}

sub id {
    my $self = shift;
    return $self->{id};
}

1;