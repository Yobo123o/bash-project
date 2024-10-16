# Text File Concatenator

This script concatenates multiple text files into a single output file. It includes options for customizing output, displaying help, handling invalid arguments, and performing file validations with regular expressions.

## Features

- **Concatenates multiple text files** into one output file.
- **Help Option (`-h`)** to show usage instructions.
- **Regular expression validation** for file names.
- **Handles invalid arguments** and missing files gracefully.
- **File interaction** with input and output files.

## Requirements

- Bash (Most Unix-like systems have Bash pre-installed)

## Usage

### Basic Command

To concatenate text files into an output file:

```bash
./concat.sh -o output.txt file1.txt file2.txt file3.txt
```

- `-o output.txt` specifies the output file where the concatenated content will be written.
- `file1.txt`, `file2.txt`, etc., are the input files to be concatenated.

### Help

To display the usage and help message:

```bash
./concat.sh -h
```

This will output:

```
Usage: ./concat.sh -o output_file input_files...
Options:
  -o    Specify the output file
  -h    Show this help message
```

## Example

Concatenate `file1.txt`, `file2.txt`, and `file3.txt` into `combined.txt`:

```bash
./concat.sh -o combined.txt file1.txt file2.txt file3.txt
```

Output:
```
Files concatenated into 'combined.txt' successfully.
```

## Error Handling

The script checks for:
- **Invalid file names**: Files must end with `.txt` and contain only alphanumeric characters, underscores, or dashes.
- **Missing or incorrect arguments**: Displays a relevant error message when input files or options are missing.

For example, running the script with an invalid file name:

```bash
./concat.sh -o combined.txt file1.doc
```

Will output:
```
Error: Invalid file name 'file1.doc'. File names must end in .txt and contain only alphanumeric characters, underscores, or dashes.
```