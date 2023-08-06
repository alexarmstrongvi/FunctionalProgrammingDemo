#!/usr/bin/env bash
################################################################################
# Clean up build files from previous compilation
if [ -d build ]; then rm -r build; fi 
mkdir build

################################################################################
file="$1"
if [ ! -f "$file" ]; then
    echo "ERROR :: File not found: $file"
    exit 0
fi
stem="${file%%.cpp}"
exe="${stem}"
echo "Compiling ${file} to build/"
ops=''
ops="$ops -Wall"
ops="$ops -Wextra"
ops="$ops -Wpedantic"
# ops="$ops -Werror"
ops="$ops -Wno-unused-comparison"
ops="$ops -Wno-unused-value"
ops="$ops -Wno-unused-variable"
ops="$ops -std=c17"
# ops="$ops -stdlib=libc"
ops="$ops -g"
ops="$ops -I include"
ops="$ops -o build/${exe}"
clang $ops "$file"

if [ $? -eq 0 ]; then
    printf "Running ./build/${exe}\n\n"
    chmod +x "./build/${exe}"
    ./build/${exe} #2>&1 | tee build/run.log
else
    printf "\n====== FAILED ======\n"
fi
