#!/bin/bash

# Author: Dianella Sy
# Program Name: Arithmetic: Assignment 1 Help
# Purpose: r.sh is a Bash script file which compiles and runs the program

echo "Remove old executable files if there are any"
rm *.out

echo "Assemble the X86 file arithmetic.asm"
nasm -f elf64 -l arithmetic.lis -o arithmetic.o arithmetic.asm

echo "Compile the C++ file main.cpp"
g++ -c -Wall -m64 -no-pie -o main.o main.cpp  -std=c++2a       

echo "Link the two object files main.o arithmetic.o"
g++ -m64 -no-pie -o go.out arithmetic.o main.o -std=c++2a     

echo "Next "Arithmetic: Assignment 1 Help" will run"
./go.out

echo "This bash file will now terminate."