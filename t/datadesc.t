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
    
    my $rh_categories = $Variable->get_categories;
    
    my $rh_categories_expected = {
              '6' => 'Unknown or not reported',
              '4' => 'Separated or divorced',
              '1' => 'Single',
              '3' => 'Married or co-habiting',
              '0' => 'Not recorded',
              '2' => 'Possibly married',
              '5' => 'Widowed'
            };
    
    cmp_deeply(
        $rh_categories_expected,
        $rh_categories,
        'get_categories'
    );    

}

done_testing();

