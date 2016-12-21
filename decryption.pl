#!/usr/bin/perl
# -------------------
# Mitali Deshpande
# mdesh2
# CSC 368 - Project 4
# November 25, 2016
# -------------------
if ((@ARGV > 1)||(@ARGV == 0))   
 {
     print "Please enter name of only one file. \n";   # we provide filename as a command line argument and it is stored in an array @ARGV
     exit ;											   # we accept only one file name as argument
 }
 
my $filename = @ARGV[0];            
chomp $filename;
print "Entered filename: ".$filename."\n";
                                                                     
my ($ext) = $filename =~ /(\.[^.]+)$/;		       # we check the extension of the given file name.
 
if ( ($ext) ne ".enc" ){			       # we accept only those files having .enc(encrypted file) extension.
print "The input file should only be encrypted file\n";
exit;
}




$f = $filename;						
$f =~ s/(.+)\.[^.]+$/$1/;	                   # we extract the file name without extension and provide same filename for decrypted file


$f .= ".dec";

print "$f will be the decrypted file.\n";
if ( -e $f ){
 print "$f already exists. Delete the file first\n";	# if same filename already exists we delete the file.

exit;
}
(open CHECK,$filename) or die
    	print "Unable to read from the given file";
	
							# we create a new decrypted file with decrypted content to write 
(open CHECK2, "+>" , $f) or die

print "Unable to create decrypted file\n";
	
foreach $lines(<CHECK>)
{

my %replace = (
a => 'z', b => 'y', c => 'x', d => 'w' , e => 'v' , f => 'u' , g => 't' , h => 's' , i => 'r',
j => 'q' , k => 'p' , l => 'o' ,  m => 'n' , n => 'm' , o => 'l' , p => 'k' , q => 'j' , r => 'i' , s =>'h' ,
t => 'g' , u => 'f' ,  v => 'e' , w => 'd' , x => 'c' , y => 'b' ,  z => 'a', 
A => 'Z' , B => 'Y', C => 'X', D => 'W', E => 'V', F => 'U' , G => 'T' , H => 'S' , I => 'R',
J => 'Q' , K => 'P' , L => 'O' , M => 'N', N => 'M' , O => 'L' , P => 'K' , Q => 'J' , R => 'I', S => 'H',
T => 'G' , U => 'F' , V => 'E', W => 'D' , X => 'C' , Y => 'B' , Z => 'A',
abc => '1' , esd => '2', 'oih' => '3', wsa => '4' , '%' => '5', '@'  => '6' , '^' => '7' ,  '#' => '8' ,  '*' => '9' ,  '+' => '0',
);												# this is the decryption method used in program.

my $chars = join '', keys %replace;
$lines =~ s/([$chars])/$replace{$1}/g;
print CHECK2 $lines;

}
close CHECK1;
close CHECK2;


