#!/usr/bin/perl
#------------------------------
# Mitali Deshpande
# mdesh2
# CSC 368 - Project 2
# Nov 11, 2016
#------------------------------
	
  my $minnumber = 0; # minimum number 
  my $maxnumber = 50; # maximum number 
  my $attempts = 0; # counter for number of attempts to guess a number
  my $random_number = int rand $maxnumber; # rand function is used for generating random number

  RANDOM_GUESS:  # we define a labelled loop
  while() {
   	print "Please guess any number between 1 and $maxnumber:\n";
	chomp( my $guess = <STDIN> ); # chomp operator removes any newline character from the end of a string
	$attempts++;
	
	if($guess =~ (/\D/)) # we check where the input is a number or not 
        {
		if(($guess eq 'exit') || ($guess eq 'quit')) # if the input is either exit/quit exit the program
                {
			exit;
		}else{
			print "Invalid Input\n";           # if it is apart from exit/quit then print Invalid input
                        print "Type exit or quit to leave\n";
			next;      # next operator jumps to the inside of the loop. Here the loop starts executing again where we have defined the labelled loop
		}
	}else{                                                  # else block if the input is a number
		if(($guess <= $maxnumber) && ($guess > 0)) # we check if the number is within the range of 50 and 1
                {
			if ($guess == $random_number) {	# we check if the input number guessed is equal to random number
					print "Congratulations! $guess was the random number.\n";
					print "The number was guessed in $attempts attempts.\n";
					exit;                                            # exit the program
			} elsif ($guess < $random_number) { # to check whether the input guessed is less than random number
					print "Your guess was lower..Try Again.\n";
			} elsif ($guess > $random_number) { # to check if the input guessed is greater than random number
					print "Your guess was higher..Try Again.\n"
			}
		}else{
			print "Number is not within the range\n";
                        print "Type exit or quit to leave\n";
			next;
		}
	}
		
  }
