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
    
    my $name = $Variable->name;
    
    ok( $name );
    
    next unless ( $name eq 'marital_st' );
    
    is( $Variable->name, 'marital_st'      );
    is( $Variable->files, 'F2'             );
    is( $Variable->label, 'Marital status' );
    is( $Variable->definition, 'Marital status of patient as recorded in the GPRD.' );
    is( $Variable->id, 'V11'     );
    ok( ! $Variable->is_numeric  );
    is( $Variable->source, "GPRD patient file\nGPRD clinical file");
    ok( $Variable->universe );

}

done_testing();

