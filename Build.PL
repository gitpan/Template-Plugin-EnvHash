use Module::Build;
# See perldoc Module::Build for details of how this works

Module::Build->new(
		   license     => 'perl',
		   module_name => 'Template::Plugin::EnvHash',
		   requires    => {
				   'Test::More' => 0,
				   'Template'   => 0,
				  },
		   create_readme => 1,
		   sign        => 1,
		   create_makefile_pl => 'passthrough',
		  )->create_build_script;
