use strict;
use warnings;

package Data::DDI::File;
# ABSTRACT: File description class

use Moose;
use MooseX::Aliases;

has 'fileTxt' => ( is => 'ro', alias => 'file_description' );
has 'URI'     => ( is => 'ro', alias => 'uri'              );
has 'id'      => ( is => 'ro', alias => 'file_id'          );

=head2 Accessors

    $Object->file_description();
    $Object->uri();
    $Object->file_id();

=cut

1;