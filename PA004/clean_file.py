#!/usr/bin/python3

"""
Ziad Arafat
03/22/2023

This program will clean a corrupted file based on a specific pattern of 
Corrupted data

"""

import argparse
import re

# Constants

# Regex pattern to match the corruption in the input text
CORRUPTION_REGEX = r'\x03(?:\x03|(?:(?![\x0A\x02]).)*\x0A)*?(?:(?![\x0A\x02]).)*\x02'



def sanitized_string(dirty_string):
        """
        Remove the corrupted parts from the input text based on the
        CORRUPTION_REGEX pattern.
        
        Args:
                dirty_string (str): The input text containing the corrupted parts.
        
        Returns:
                str: The cleaned text with the corrupted parts removed.
        """
        pattern = re.compile(CORRUPTION_REGEX, re.DOTALL)
        # pattern = CORRUPTION_REGEX
        cleaned_string = re.sub(
                pattern,
                "", 
                dirty_string
        )
        
        return cleaned_string

# MAIN

# Setup argument parser
parser = argparse.ArgumentParser(
        description='A program to clean a file based on a specific \
                pattern'
)

# Add input file path argument
parser.add_argument(
        'input_file_path',
        type=str,
        help='path to a input file to be cleaned'
)

# Add optional output file path argument
parser.add_argument(
        '-o', '--output_file_path',
        type=str,
        help='path to an output file if applicable',
        default=None
)

# Parse the arguments and store them
args = parser.parse_args()

# If an output file is provided, write the sanitized text to the output file
if args.output_file_path is not None:
        with open(args.input_file_path, 'r') as input_file, \
        open(args.output_file_path, 'w') as output_file:
                dirty_text = input_file.read()
                sanitized_text = sanitized_string(dirty_text)
                output_file.write(sanitized_text)
# If no output file is provided, print the sanitized text to the console
else:
        with open(args.input_file_path, 'r') as input_file:
                dirty_text = input_file.read()
                sanitized_text = sanitized_string(dirty_text)
                print(sanitized_text, end="")
