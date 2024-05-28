#!/bin/zsh

# Function to display usage instructions
usage() {
    echo "Usage: $0 <number_of_files> <size_in_mb>"
    exit 1
}

# Check if the correct number of arguments is provided
if [ "$#" -ne 2 ]; then
    usage
fi

# Read the number of files and size in MB from the command line arguments
num_files=$1
size_in_mb=$2

# Check if the provided arguments are positive integers
if ! [[ "$num_files" =~ ^[0-9]+$ ]] || ! [[ "$size_in_mb" =~ ^[0-9]+$ ]]; then
    echo "Error: Both arguments must be positive integers."
    usage
fi

# Generate the specified number of files
for ((i = 1; i <= num_files; i++)); do
    filename="file${i}.txt"
    dd if=/dev/urandom of=$filename bs=1M count=$size_in_mb status=progress
done

echo "Generated $num_files files, each of size $size_in_mb MB."

