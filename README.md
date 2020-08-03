# Right triangles
---
The purpose of this program is to become familiar with using floating point
numbers in X86 assembly programs.

This program will do the following:
* Input two floating numbers - **assuming ONLY POSITIVE floats are entered**
* Outputs the two floating point numbers to the terminal
* Computes and displays the area of the triangle in floating point numbers
* Computes and displays the hypotenuse of the triangle in floating point numbers
* Returns the hypotenuse found in X86 to main function written in C language

This program has three different source files:
* A driver file, which is written in C language.
* An X86 assembly file, which is a function written in X86 language and
is called from the driver program. This program inputs, computes, and outputs the
area and hypotenuse of the triangle in floating point numbers.
* A bash script is used to compile the two previously mentioned files, link
them to create one executable file, and lastly load that newly created
executable file.

## Prerequisites
---
* A virtual machine
* Install g++, gcc, and nasm

## Instruction on how to run the program
---
Choose one of the following:
1. chmod +x run.sh then ./run.sh              
2. sh run.sh
