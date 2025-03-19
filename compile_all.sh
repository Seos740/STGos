#!/bin/bash

# Loop through all .asm files in the directory
for file in *.asm; do
    # Compile the assembly file to binary format
    nasm -f bin -o "${file%.asm}.bin" "$file"
    
    # Optionally, you can link the binaries together (if needed)
    # ld -o output_file "${file%.asm}.bin"  # Uncomment and modify if you need linking
    
    echo "Compiled: $file"
done

