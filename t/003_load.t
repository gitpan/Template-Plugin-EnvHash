# -*- perl -*-

# t/001_load.t - check module loading and create testing directory

use Test::More tests => 3;

BEGIN { use_ok( 'Template::Plugin::EnvHash' ); }

my $object = Template::Plugin::EnvHash->new ();
isa_ok ($object, 'Template::Plugin::EnvHash');

# Does it follow the template Plugin heirarchy?
isa_ok ($object, 'Template::Plugin');
