package Handgranat::DB;

# Tags/HTML-module for the Handgranat wiki system - https://savannah.nongnu.org/projects/handgranat/
# Karameller.pm  $Id: DB.pm,v 1.4 2008/10/22 20:28:58 kers Exp $
# 			     $Date: 2008/10/22 20:28:58 $ $Author: kers $

use 5.008008;
use strict;
use warnings;

require Exporter;
# use AutoLoader qw(AUTOLOAD);
use DBI;


our @ISA = qw(Exporter);

# Items to export into callers namespace by default. Note: do not export
# names by default without a very good reason. Use EXPORT_OK instead.
# Do not simply export all your public functions/methods/constants.

# This allows declaration	use Handgranat::DB ':all';
# If you do not need this, moving things directly into @EXPORT or @EXPORT_OK
# will save memory.


#our       %EXPORT_TAGS = ( );     # eg: TAG => [ qw!name1 name2! ],

our %EXPORT_TAGS = ( 'all' => [ qw( &ConnectMYSQL $mysql_connected $dbh $mysql_host $mysql_db $mysql_user $mysql_pass ) ] );


our @EXPORT_OK = ( @{ $EXPORT_TAGS{'all'} } );

our @EXPORT = qw( &ConnectMYSQL $mysql_connected $dbh $mysql_host $mysql_db $mysql_user $mysql_pass );

our $mysql_connected;
our $dbh; 
our $mysql_host;
our $mysql_db;
our $mysql_user;
our $mysql_pass;

# our $VERSION = sprintf "%d.%03d", q$Revision: 1.4 $ =~ /(\d+)/g;
# our $ID_VER=sprintf("%s.%s", q$Id: DB.pm,v 1.4 2008/10/22 20:28:58 kers Exp $);



# Preloaded methods go here.

sub ConnectMYSQL
{
 my $usedb = $_[0];
 
 if ($usedb)
 {
   unless ($mysql_connected) 
	{

	 $dbh = DBI->connect("DBI:mysql:host=$mysql_host;database=$mysql_db",
    		"$mysql_user","$mysql_pass",{ PrintError => 1, RaiseError =>1 });
	$mysql_connected++;
	}
 }
}


# Autoload methods go after =cut, and are processed by the autosplit program.

1;
__END__
# Below is stub documentation for your module. You'd better edit it!

=head1 NAME

Handgranat::Karameller - Perl extension for blah blah blah

=head1 SYNOPSIS

  use Handgranat::Karameller;
  blah blah blah

=head1 DESCRIPTION

Stub documentation for Handgranat::Karameller, created by h2xs. It looks like the
author of the extension was negligent enough to leave the stub
unedited.

Blah blah blah.

=head2 EXPORT

None by default.



=head1 SEE ALSO

Mention other useful documentation such as the documentation of
related modules or operating system documentation (such as man pages
in UNIX), or any relevant external documentation such as RFCs or
standards.

If you have a mailing list set up for your module, mention it here.

If you have a web site set up for your module, mention it here.

=head1 AUTHOR

Christian Bolstad, E<lt>kers@atdt.nuE<gt>

=head1 COPYRIGHT AND LICENSE

Copyright (C) 2008 by Christian Bolstad, kers@atdt.nu 

This program is free software; you can redistribute it and/or modify
it under the terms of the GNU General Public License as published by
the Free Software Foundation; either version 2 of the License, or
(at your option) any later version.

This program is distributed in the hope that it will be useful,
but WITHOUT ANY WARRANTY; without even the implied warranty of
MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
GNU General Public License for more details.

You should have received a copy of the GNU General Public License
along with this program; if not, write to the
    Free Software Foundation, Inc.
    51 Franklin Street, Fifth Floor,
    Boston, MA  02110-1301  USA
  

=cut
