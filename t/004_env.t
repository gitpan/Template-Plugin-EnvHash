use strict;
use warnings;
use English;
use Template;
use Test::More;

use Template::Plugin::EnvHash;

# do not test this environment variable
delete $ENV{_};

plan tests => scalar(keys %ENV) * 2 ;


my $env_hash = Template::Plugin::EnvHash->new();
my $tt2 = Template->new({
			 RELATIVE => 1,
			}) || die($Template::ERROR . "\n");

foreach my $var_name (keys %ENV) {
	my $tt2_output;

	is($ENV{$var_name}, $env_hash->{$var_name});

	$tt2->process(
		      './t/test.tt2',
		      {
		       var_name => $var_name,
		      },
		      \$tt2_output
		     ) || die($tt2->error);

	chomp $tt2_output;
	# Not using Test::Env cos the error message says the value of HOME is wrong if
	# they don't match. which might confuse my tester as i'm checking if the value
	# of $tt2_output is correct.
	# No critisim of Test::Env it was just designed to test the environment not
	# things against the environment.
	is($tt2_output, $ENV{$var_name}) or diag("The environment variable i was testing was $var_name");
}
