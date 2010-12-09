#!/usr/bin/perl
use Getopt::Long;
use Term::ANSIColor;


# pdf4mergeunix has been written by Didier F.B Casse <didier@microtronyx.com>

############################################################################

#  This is pdfmerge4unix version 1.0-2.
# pdfmerge4unix is a command line utility program that merges pdf files in unix-based platforms.

#   Copyright (C) 2003 Didier F.B Casse
#
#   This program is free software; you can redistribute it and/or modify
#   it under the terms of the GNU General Public License as published by
#   the Free Software Foundation; either version 2 of the License, or
#   (at your option) any later version.
#
#   This program is distributed in the hope that it will be useful,
#   but WITHOUT ANY WARRANTY; without even the implied warranty of
#   MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
#   GNU General Public License for more details.
#
#   You should have received a copy of the GNU General Public License
#   along with this program; if not, write to the Free Software
#   Foundation, Inc., 675 Mass Ave, Cambridge, MA 02139, USA.
#
# Author: Didier F.B Casse, Singapore Synchrotron Light Source (SSLS).  
# Email: didier@microtronyx.com 
# URL : http://pdfmerge4unix.sourceforge.net

############################################################################



GetOptions('help', 'h');

$usage = <<"END_OF_USAGE";
This is pdfmerge4unix version 1.0-2. pdfmerge4unix is a command line utility program that merges pdf files in unix-based platforms

Syntax:  pdfmerge file1.pdf file2.pdf... fileN.pdf outfile.pdf

Options:      
            --help                  displays this brief help; same as -h
Author:    Didier F.B Casse <didier\@microtronyx.com>
URL:       http://www.microtronyx.com/pdfmerge4unix
END_OF_USAGE

die $usage if ($opt_help or $opt_h or (scalar(@ARGV)==0));



$incantation = << "END_OF_INCANTATION";
%!PS
/_begin_job_
{
        /tweak_save save def
        /tweak_dc countdictstack def
        /tweak_oc count 1 sub def
        userdict begin
}bind def

/_end_job_
{
        count tweak_oc sub{pop}repeat
        countdictstack tweak_dc sub{end}repeat
        tweak_save restore
}bind def

END_OF_INCANTATION





# get it started


if (!scalar(@ARGV)==0){


# $mergedfile gets the output file!
$mergedfile=pop(@ARGV);

if (-e $mergedfile){print color("red"), "outfile.pdf should not exists, it's the name of your output file!\n", color("reset"); exit 0;}


# Dealing with merged.ps 

open(FILE,">merged.ps") || die "can't open merged.ps";
print FILE $incantation;


foreach $ARGV (@ARGV){

print FILE "\n_begin_job_\n"; 
print FILE "(./$ARGV)run\n";print FILE "_end_job_\n";

 }

} # end of !scalar...
	
close(FILE);

`ps2pdf merged.ps $mergedfile`;

#cleanup

unlink("./merged.ps");















