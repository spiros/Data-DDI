use strict;
use warnings;

package Data::DDI::DocumentDescription;
# ABSTRACT: Document description class

# TODO: Moose it.

=head2 Accessors

   $Object->document_title;
   $Object->document_id;
   $Object->document_version;
   $Object->document_production_date;
   $Object->document_sw;
   $Object->document_producer;

=cut

sub new {
    my $class = shift;
    my $rh    = shift;
    return bless $rh, $class;
}

sub document_title {
   my $self = shift;
   return $self->{titlStmt}->{titl};
}

sub document_id {
   my $self = shift;
   return $self->{titlStmt}->{IDNo};
}

sub document_production_date {
   my $self = shift;
   return $self->{prodStmt}->{prodDate}->{date};
}

sub document_sw {
   my $self = shift;
   return $self->{prodStmt}->{software};
}

sub document_producer {
   my $self = shift;
   return $self->{prodStmt}->{producer};
}

sub document_version {
   my $self = shift;
   return $self->{verStmt}->{version};
}

1;
