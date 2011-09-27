use strict;
use warnings;

use Test::More;
use Test::Deep;

use_ok('Data::DDI');

my $rh_params = { filename => './t/test.xml' };

my $DD = Data::DDI->new( $rh_params );

isa_ok( $DD, 'Data::DDI' );

my $ra_files =
   $DD->get_files;

is( scalar(@$ra_files), 2 );

foreach my $File (@$ra_files) {
    isa_ok( $File, 'Data::DDI::File' );

    ok( $File->file_description );
    ok( $File->id );
    ok( $File->uri );
    
}

done_testing();

