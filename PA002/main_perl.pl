#!/usr/bin/perl

use strict;
use warnings;

# Function that prints a string when we don't have short-circuit evaluation. 
sub print_answer {
    print "We DO NOT have short-circuit evaluation!\n";
    return 1;
}

# Set A to false to see if it skips (0 is false in perl)
my $A = 0;

# If they are both true print that they are both true
# Else print a string to helpdetermine if w have short circuit evaluation. 
if ($A && print_answer()) {
    print "Both A and B are true\n";
} else {
    print "If you only see this then we DO have short circuit evaluation\n";
}
