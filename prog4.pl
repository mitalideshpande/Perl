#! /usr/bin/perl
#------------------------------
# Mitali Deshpande
# mdesh2
# CSC 368 - Assignment 4
# October 22, 2016
#------------------------------


print "Enter radius of circle\n";
$radius = <>;
$pi=3.14;
if($radius >= 0){
   print "Circumference of circle is:" . 2*$pi*$radius."\n";
}
else{
  print "Circumference of circle is 0\n";
}

# using if-else conditional statement we execute block of code depending upon the provided condition.
