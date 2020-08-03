#!/bin/bash


#Author: Kien Truong
#Program name: Assignment 5
#Course ID: CPSC 240

rm *.o
rm *.out

echo "This is program <Finding hypotenuse and area of a right triangle>"

echo "Assemble the module assignment5.asm"
nasm -f elf64 -l assignment5.lis -o assign5.o assignment5.asm

echo "Compile the C module assignment5.c"
gcc -c -m64 -Wall -std=c11 -o assignment5.o assignment5.c -fno-pie -no-pie

echo "Link the object files already created"
g++ -m64 -o assignment5.out assignment5.o assign5.o -fno-pie -no-pie -std=c++14

echo "The program will run"
./assignment5.out

echo "The bash script file is now closing."
