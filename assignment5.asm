;---------------------------------------------------------
;Author:        Kien Truong
;Program name:  Assignment 5
;Course ID:     CPSC 240
;---------------------------------------------------------

extern printf

extern scanf

global hypo_triangle

segment .data

initialMess db "Welcome to Right Triangle Analyzer",10,0

promptMess  db "Enter the lengths of the two legs of a right triangle separated "
            db "by ws and press enter.",0

lengthMess  db "The length of the sides of the triangle are %lf and %lf.",10,0

areaMess    db "The area of the triangle is %5.4lf units squared",10,0

hypoMess    db "The hypotenuse has length %5.7lf units.",10,0

returnMess  db "This module will now return the hypotenuse to the caller.",10,10,0

stringFormat db "%s",0

floatFormat db "%lf %lf",0

segment .bss
;empty


segment .text
hypo_triangle:

  push rbp
  mov rbp, rsp
  push rbx
  push rcx
  push rdx
  push rdi
  push rsi
  push r8
  push r9
  push r10
  push r11
  push r12
  push r13
  push r14
  push r15

  ;====Show the initial message====
  mov qword rax, 0              ;No floating points
  mov       rdi, stringFormat   ;"%s"
  mov       rsi, initialMess    ;"Welcome to Right Triangle Analyzer"
  call      printf              ;output

  ;====Show the prompt message====
  mov qword rax, 0              ;No floating points
  mov       rdi, stringFormat   ;"%s"
  mov       rsi, promptMess     ;"Enter the lengths of the two legs of a right triangle separated"
                                ;"by white-space and press enter."
  call      printf              ;output

  ;====Reading 2 floats====
  push qword 99                   ;Get on boundary
  ;Create space for 2 float numbers
  push qword -1
  push qword -2
  mov   rdi, floatFormat          ;"%lf %lf"
  mov   rsi, rsp                  ;rsi points to first qword on the stack
  mov   rdx, rsp
  add   rdx, 8                    ;rdx points to second qword on the stack
  call  scanf                     ;input

  movsd xmm15, [rsp]              ;stores the 1st float to xmm15
  movsd xmm14, [rsp+8]            ;stores the 2nd float to xmm14
  pop   rax                       ;reserve the previous push qword -2
  pop   rax                       ;reserve the previous push qword -1
  pop   rax                       ;reserve the previous push qword -99

  ;===Show length message===
  push qword 99                   ;get on the boundary
  mov  rax, 2                     ;2 floats need to be outputted
  mov   rdi, lengthMess           ;"The length of the sides of the triangle are %5.2lf and 5.2lf."
  movsd xmm0, xmm15               ;copying 1st float from xmm15 to xmm0 for outputting
  movsd xmm1, xmm14               ;copying 2nd float from xmm14 to xmm1 for outputting
  call  printf                    ;output
  pop   rax                       ;reserve the previous push qword 99

  ;===Backing up 1 side of triangle for calc. hypo===
  movsd xmm13, xmm14

  ;===Calculating area of the right triangle===
  mulsd xmm14, xmm15              ;multiplying 2 sides of triangle
  mov   rbx, 0x3FE0000000000000   ;moves float number 0.5 to rbx
  push  rbx                       ;pushes 0.5 onto the stack
  mulsd xmm14, [rsp]              ;performs (0.5) times xmm14
  pop   rax                       ;reserve the previous push rbx

  ;===Show the area of the right triangle===
  push  qword 99
  mov   rax, 1                ;1 float needs to be outputted
  mov   rdi, areaMess         ;"The area of the triangle is %5.4lf units squared"
  movsd xmm0, xmm14           ;copying the area in xmm14 to xmm0 for outputting
  call  printf                ;output
  pop   rax                   ;reserve the previous push rbx

  ;===Calculating hypotenuse===
  mulsd   xmm13, xmm13        ;xmm13 *= xmm13 (1st side of the triangle)
  mulsd   xmm15, xmm15        ;xmm15 *= xmm15 (2nd side of the triangle)
  addsd   xmm13, xmm15        ;adding the square of two calculated sides
  sqrtsd  xmm13, xmm13        ;taking the square root of xmm13

  ;===Show the hypotenuse message===
  push  qword 99
  mov   rax, 1                ;1 float needs to be outputted
  mov   rdi, hypoMess         ;"The hypotenuse has length %5.7lf units."
  movsd xmm0, xmm13           ;copying the hypotenuse to xmm0 to output
  call  printf                ;print to the terminal
  pop   rax

  ;===Return main message===
  mov   qword rax, 0          ;no float numbers
  mov   rdi, stringFormat     ;"%s"
  mov   rsi, returnMess       ;"This module will now return the hypotenuse to the caller."
  call  printf

  movsd xmm0, xmm13           ;returns the hypotenuse back to main function

  pop r15
  pop r14
  pop r13
  pop r12
  pop r11
  pop r10
  pop r9
  pop r8
  pop rsi
  pop rdi
  pop rdx
  pop rcx
  pop rbx
  pop rbp

  ret
