use strict;
use warnings;

use Test::More;
use Test::Deep;

use_ok('Data::DDI');

my $rh_params = { filename => './t/test.xml' };

my $DD = Data::DDI->new( $rh_params );

isa_ok( $DD, 'Data::DDI' );

my $DocumentDescription =
   $DD->get_document_description;
   
isa_ok( $DocumentDescription, 'Data::DDI::DocumentDescription');

is( $DocumentDescription->document_title(), 'CALIBER' );

is( $DocumentDescription->document_production_date(), '2011-10' );

cmp_deeply( 
   $DocumentDescription->document_sw(),
   {
        'version' => '1.2',
        'date' => '2011-01-07',
        'content' => 'Metadata Editor'
   } );

cmp_deeply(
   $DocumentDescription->document_producer(),
   {
        'abbr' => 'SD',
        'content' => 'Dr. Spiros Denaxas',
        'affiliation' => 'University College London',
   } );
   
is( $DocumentDescription->document_version(), 'v 1.0' );

done_testing();