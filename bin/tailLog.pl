#!/usr/bin/perl

use strict;
use IO::Handle;

die "HOME not setup in you environment\n" unless exists $ENV{'HOME'};

tailLog( getFile() );

sub getFile
{
  my $WORKDIR = $ENV{'HOME'} . '/work';
  my $DEFAULT_FILE = "$WORKDIR/Webiva/log/development.log";
  my @FOLDERS = ( '/var/log/apache2'
		);

  foreach ( findLogDirectories($WORKDIR) ) {
    chomp;
    push( @FOLDERS, $_ );
  }

  my @logFiles = ();

  foreach my $folder ( @FOLDERS ) {
    my @logs = findLogs( $folder );
    foreach( @logs ) {
      chomp;
      next unless $_ =~ /log$/;
      next if $_ eq $DEFAULT_FILE;
      push( @logFiles, $_ );
    }
  }

  @logFiles = sort( @logFiles );
  unshift( @logFiles, $DEFAULT_FILE );

  die "no files found\n" if $#logFiles == -1;

  my %files = {};
  my $count = 0;
  print "select a file to tail:\n";
  foreach my $file ( @logFiles )
  {
    $files{++$count} = $file;
    print "$count. $file\n";
  }

  STDOUT->autoflush();

  my $id = <STDIN>;
  chomp( $id );
  if( $id eq '' ) {
    $id = 1;
  }

  if( exists $files{$id} ) {
    return $files{$id};
  }

  print "invalid id( $id ) specified - tailing error log(1)\n";
  return $files{1};
}

sub findLogs
{
  my $folder = shift;
  my $cmd = "find $folder -maxdepth 1 -type f";

  if( $#ARGV != -1 ) {
    $cmd = 'ssh ' . $ARGV[0] . ' ' . $cmd;
  }
  return `$cmd`;
}

sub tailLog
{
  my $logFile = shift;
  my $cmd = "tail -f $logFile";

  if( $#ARGV != -1 ) {
    $cmd = 'ssh ' . $ARGV[0] . ' "' . $cmd . '"';
  }
  system( $cmd );
}

sub findLogDirectories
{
  my $folder = shift;
  my $cmd = "find $folder -maxdepth 2 -type d -name log";

  if( $#ARGV != -1 ) {
    $cmd = 'ssh ' . $ARGV[0] . ' ' . $cmd;
  }
  return `$cmd`;
}
