#!/usr/bin/perl

use strict;
use warnings;
use Getopt::Long qw(GetOptions);
use File::Slurp;

=pod
Ziad Arafat
03/22/2023

This program will clean a corrupted file based on a specific pattern of 
Corrupted data
=cut

# Constants
my $corruption_regex =
  qr/\x03(?:\x03|(?:(?![\x0A\x02]).)*\x0A)*?(?:(?![\x0A\x02]).)*\x02/s;

# Function to sanitize the input string by removing the corrupted parts
sub sanitized_string {
        my ($dirty_string) = @_;
        my $cleaned_string = $dirty_string;
        $cleaned_string =~ s/$corruption_regex//g;
        return $cleaned_string;
}

# MAIN

# Variables for input and output file paths
my $input_file_path;
my $output_file_path;

# Parse command line options
``
my $result = GetOptions(
        'input_file_path=s'  => \$input_file_path,
        'output_file_path=s' => \$output_file_path,
);

# Print usage help text if not enough arguments are provided
unless ( $result && $input_file_path ) {
        print
"Usage: $0 --input_file_path INPUT_FILE_PATH [--output_file_path OUTPUT_FILE_PATH]\n";
        exit 1;
}

# Read the content of the input file
my $dirty_text = read_file($input_file_path);

# Sanitize the input text
my $sanitized_text = sanitized_string($dirty_text);

# Write the sanitized text to the output file if provided, otherwise print it. 
if ( defined $output_file_path ) {
        write_file( $output_file_path, $sanitized_text );
}
else {
        print $sanitized_text;
}
