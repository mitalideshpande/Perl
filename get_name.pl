#!/usr/bin/perl
#----------------------------
# Mitali Deshpande
# mdesh2
# CSC 368 - Project 3
# 18 November 2016.
# ----------------------------
 
$filenm = '/etc/passwd.bak';


 if ((@ARGV > 1)||(@ARGV == 0))     # we provide username as a command line argument and it is stored in an array @ARGV
				    # we check only one username is provided not more or less than that
 {
     print "Please enter 1 argument but not more than 1 \n";
     exit ;
 }

my $username = @ARGV[0];            # we save the argument in variable username to verify whether it exists in /etc/passwd.bak
chomp $username;
print "Entered Username: ".$username."\n";
$flag = 0;

	(open CHECK,$filenm) or die	# we check whether file is open to read
    	print "Could not read from the filename";

 while(<CHECK>)
{
	if($_ =~ /$username/)	
	{
		@fields = split(':');
		print "User ID: ".@fields[3]."\n"; 		# we extract the fields based on field number 
		print "Home Directory: ".@fields[5]."\n";
		$flag=1;					# we set variable flag to 1 if username found
		exit;
	}	

} 
close FILE;
if($flag == 0)							# if flag is 0 that means username is not found
{
	print "Username entered does not exist...Try again\n";
	exit;
}
	
