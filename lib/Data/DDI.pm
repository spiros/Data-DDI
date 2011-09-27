use strict;
use warnings;

package Data::DDI;

use XML::Simple;

use Data::DDI::DocumentDescription;
use Data::DDI::File;
use Data::DDI::Variable;
   
# ABSTRACT: Parse DDI2 documents.

=head1 DESCRIPTION

The Data Documentation Initiative (DDI) is an effort to create an international standard for describing data 
from the social, behavioral, and economic sciences. Expressed in XML, the DDI metadata specification now 
supports the entire research data life cycle. DDI metadata accompanies and enables data
conceptualization, collection, processing, distribution, discovery, analysis, repurposing, and archiving.

This module implements a quick and dirty way for parsing Data Documentation Initiative (DDI) 
files from version 2 onwards (up to but not including version 3).

At the moment, the module only supports the DDI Lite specification which can 
be found here L<http://www.ddialliance.org/sites/default/files/ddi-lite.html>

=head1 FUNCTIONS

=cut

=head2 new 

Create a new instance of the object. The DDI can be supplied as either a local file using the
I<filename> parameter or as a scalar containing the raw XML using the I<content> parameter.

   my $rh = { filename => 'moo.xml' };
   my $DD = Data::DDI->new( $rh ) ;
   
=cut

sub new {
   my $class     = shift;
   my $rh_params = shift;
   
   unless ( defined ( $rh_params ) && ref( $rh_params ) eq 'HASH' ) { 
      die "Missing mandatory instatiation paramaters."; }
   
   my $self      = { };  
   my $filename = $rh_params->{ filename };
   my $content  = $rh_params->{ content };
   
   my $data;
         
   if ( ! defined $content ) {
      unless ( defined $filename && -e $filename ) {
         die "The filename: $filename does not seem to exist.\n";
      }
      $data = $filename;  
   } else {
      $data = $content;   
   }
            
   $self->{xml} = XML::Simple->new();
   
   $self->{data} = 
      $self->{xml}->XMLin( $data, 
         'KeepRoot'       => 1,
         'NormaliseSpace' => 2,
         
         ## This must be set since the `ID` field is the unique identifier
         ## for variables described in DDI 2 - the `name` attribute 
         ## is a non-unique field and will cause several warnings
         ## during parsing.
         
         'KeyAttr'        => [ 'ID', 'name' ] );
    
   return bless $self, $class;
   
}

=head2 get_document_description

   my $DDObject = $DD->get_document_description();

Returns a document description object and I<undef> on error.

=cut

sub get_document_description {
   my $self = shift;
   
   if ( exists $self->{data}{codeBook}{stdyDscr} ) {
      return Data::DDI::DocumentDescription->new( $self->{data}{codeBook}{docDscr} )
   } else{
      return undef;
   } 
}

=head2 get_files

    my $ra_files = $DD->get_files();
    
Returns a reference to an array of Data::DDI::File objects.

=cut

sub get_files {
    my $self     = shift;
    my $rh_files = $self->{data}{codeBook}{fileDscr};
    
    my $ra_out = [ ];
    
    foreach my $file_id ( keys %$rh_files ) {
        my $rh_file_data = $rh_files->{ $file_id };
        $rh_file_data->{id} = $file_id;
        push( @$ra_out, Data::DDI::File->new( $rh_file_data ) );
    }

    return $ra_out;
}

=head2 get_variables

    my $ra_files = $DD->get_variables();
    
Returns a reference to an array of Data::DDI::Variable objects.

=cut

sub get_variables {
    my $self = shift;
    my $rh_variables = $self->{data}{codeBook}{dataDscr}{var};
    
    my $ra_out = [ ];
    
    foreach my $var_id ( keys %$rh_variables ) {
        my $rh_var_data = $rh_variables->{ $var_id };
        $rh_var_data->{id} = $var_id;
        push( @$ra_out, Data::DDI::Variable->new( $rh_var_data ) );
    }
    
    return $ra_out;
}



1;