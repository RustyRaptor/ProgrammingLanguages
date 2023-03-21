#!/usr/bin/python3

import argparse
import re

# Constants
CONTROL_B = '\x02'
CONTROL_C = '\x03'
CARRIAGE_RET = '\r'


def sanitized_string(dirty_string):
        cleaned_string = re.sub(
                rf'{CONTROL_C}(\r{0,4}{CONTROL_C}*?)*{CONTROL_B}',
                "", 
                dirty_string
        )
        
        return cleaned_string

# MAIN
parser = argparse.ArgumentParser(
        description='A program to clean a file based on a specific \
                pattern'
)
parser.add_argument(
        'input_file_path',
        type=str,
        help='path to a input file to be cleaned'
)
parser.add_argument(
        '-o', '--output_file_path',
        type=str,
        help='path to an output file if applicable',
        default=None
)

args = parser.parse_args()

if args.output_file_path is not None:
        with open(args.input_file_path, 'r') as input_file, \
        open(args.output_file_path, 'w') as output_file:
                
                for dirty_line in input_file:
                        sanitized_line = sanitized_string(dirty_line)
                        output_file.write(sanitized_line)
else:
        with open(args.input_file_path, 'r') as input_file:
                for dirty_line in input_file:
                        sanitized_line = sanitized_string(dirty_line)
                        print(sanitized_line)

