#!/usr/bin/python3

import argparse
import re

# Constants
CONTROL_B = '\x02'
CONTROL_C = '\x03'
CARRIAGE_RET = '\n'
CORRUPTION_REGEX = r'\x03(?:\x03|(?:(?![\x0A\x02]).)*\x0A)*?(?:(?![\x0A\x02]).)*\x02'



def sanitized_string(dirty_string):
        pattern = re.compile(CORRUPTION_REGEX, re.DOTALL)
        # pattern = CORRUPTION_REGEX
        cleaned_string = re.sub(
                pattern,
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
                dirty_text = input_file.read()
                sanitized_text = sanitized_string(dirty_text)
                output_file.write(sanitized_text)
else:
        with open(args.input_file_path, 'r') as input_file:
                dirty_text = input_file.read()
                sanitized_text = sanitized_string(dirty_text)
                print(sanitized_text, end="")
