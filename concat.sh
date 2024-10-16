#!/bin/bash

# Function to display usage
usage() {
    echo "Usage: $0 -o output_file input_files..."
    echo "Options:"
    echo "  -o    Specify the output file"
    echo "  -h    Show this help message"
    exit 1
}

# Function to validate file names using a regular expression
validate_file() {
    local file=$1
    # Regular expression to match valid text files (ending in .txt)
    if [[ ! "$file" =~ ^[a-zA-Z0-9_-]+\.txt$ ]]; then
        echo "Error: Invalid file name '$file'. File names must end in .txt and contain only alphanumeric characters, underscores, or dashes."
        exit 1
    fi
}

# Check if no arguments are provided
if [ $# -eq 0 ]; then
    usage
fi

# Variables for options
output_file=""
show_help=false

# Parse command-line options
while getopts ":o:h" opt; do
    case $opt in
        o)
            output_file=$OPTARG
            ;;
        h)
            show_help=true
            ;;
        *)
            echo "Error: Invalid option"
            usage
            ;;
    esac
done

# Show help message if -h is passed
if $show_help; then
    usage
fi

# Shift the arguments to get input files
shift $((OPTIND - 1))

# Validate that output file is provided
if [ -z "$output_file" ]; then
    echo "Error: Output file not specified."
    usage
fi

# Validate the output file name using regular expression
validate_file "$output_file"

# Check if there are any input files
if [ $# -lt 1 ]; then
    echo "Error: No input files provided."
    usage
fi

# Validate input files and check their existence
for input_file in "$@"; do
    validate_file "$input_file"
    if [ ! -f "$input_file" ]; then
        echo "Error: Input file '$input_file' does not exist."
        exit 1
    fi
done

# Concatenate the input files into the output file
cat "$@" > "$output_file"

# Display success message
echo "Files concatenated into '$output_file' successfully."
