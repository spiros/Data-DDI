use strict;
use warnings;

use Test::More;
use Test::Deep;

use_ok('Data::DDI');

my $rh_params = { filename => './t/test.xml' };

my $DD = Data::DDI->new( $rh_params );

isa_ok( $DD, 'Data::DDI' );

my $ra_variables =
    $DD->get_variables;

foreach my $Variable ( @$ra_variables ) {
    
    my $id = $Variable->id;
    
    ok( $Variable->raw, 'raw'               );
    
    ok( $Variable->location, "$id location"     ); 
    ok( $Variable->files, 'files'           );
    ok( $Variable->name, 'name'             );
    ok( $Variable->label, 'label'           );
    ok( $Variable->definition, 'definition' );
    ok( $Variable->id, 'id'                 );
    
}





done_testing();

