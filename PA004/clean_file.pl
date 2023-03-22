#!/usr/bin/perl

use strict;
use warnings;
use Getopt::Long qw(GetOptions);
use File::Slurp;

# Constants
my $corruption_regex = qr/\x03(?:\x03|(?:(?![\x0A\x02]).)*\x0A)*?(?:(?![\x0A\x02]).)*\x02/s;

sub sanitized_string {
    my ($dirty_string) = @_;
    my $cleaned_string = $dirty_string;
    $cleaned_string =~ s/$corruption_regex//g;
    return $cleaned_string;
}

# MAIN
my $input_file_path;
my $output_file_path;

my $result = GetOptions(
    'input_file_path=s' => \$input_file_path,
    'output_file_path=s' => \$output_file_path,
);

# Print usage help text if not enough arguments are provided
unless ($result && $input_file_path) {
    print "Usage: $0 --input_file_path INPUT_FILE_PATH [--output_file_path OUTPUT_FILE_PATH]\n";
    exit 1;
}

my $dirty_text = read_file($input_file_path);
my $sanitized_text = sanitized_string($dirty_text);
if (defined $output_file_path) {
    write_file($output_file_path, $sanitized_text);
} else {
    print $sanitized_text;
}
