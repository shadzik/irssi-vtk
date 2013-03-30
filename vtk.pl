# vtk.pl
# Bartosz "shadzik" Świątek <shadzik@gmail.com>
# pl_TK for irssi
# uses vtk from vtk-c package

use strict;

use vars qw($VERSION %IRSSI);

$VERSION = "0.1-20061202";

%IRSSI = (
	authors		=>	"Bartosz 'shadzik' Swiatek",
	contact		=>	"shadzik\@gmail.com",
	name		=>	"vtk",
	description	=>	"Virtual Tomasz Kłoczko, pl_TK for irssi",
	license		=>	"GPLv2",
	changed		=>	"$VERSION",
	commands	=>	"vtk"
);

use Irssi 20020324;

sub cmd_vtk ($$$)
{
	my ($arg, $server, $witem) = @_;

	if ($witem && ($witem->{type} eq 'CHANNEL' || $witem->{type} eq 'QUERY'))
	{
		$witem->command("/EXEC -out echo $arg |vtk");
	}
}

Irssi::command_bind('vtk',\&cmd_vtk);

print "%B>>%n ".$IRSSI{name}." ".$VERSION." loaded";
