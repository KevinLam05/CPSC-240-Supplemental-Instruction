; Program Name: "". This program demonstrates.  Copyright (C) 2026  Dianella Sy

; This program is free software: you can redistribute it and/or modify it under the terms of the GNU General Public License  
; version 3 as published by the Free Software Foundation.                                                                    
; This program is distributed in the hope that it will be useful, but WITHOUT ANY WARRANTY; without even the implied         
; warranty of MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE. See the GNU General Public License for more details.      
; A copy of the GNU General Public License v3 is available here: <https://www.gnu.org/licenses/>.

; Author Information:
; Name:
; CWID:
; Section: CPSC 240-#
; Email: @csu.fullerton.edu

; Program Information:
; Name:
; Languages:
; Start Date:
; Completion Date:

; Program's Purpose:
; The "" will teach.

; Project Information:
; Files: 
; Developing Computer: 
; Status:

; Translator Information:
; Linux:
; Linux:


; Declaration Section
%include "macro.inc"    ; Contains macros
extern printf
extern fgets
extern stdin
extern atof
global arithmetic
maximum_number_of_characters_for_input equ 512


; segment .data is where initialized data is declared
segment .data

output_software_maintainance db "For assistance, contact the developer at @csu.fullerton.edu", 10, 0
prompt_number_one db 10, "Enter first number: ", 0
prompt_repeat_number db "Enter another number: ", 0
string_format db "%s", 0





; segment .bss is where uninitialized data is declared
segment .bss
number_one   resb maximum_number_of_characters_for_input
number_two   resb maximum_number_of_characters_for_input
number_three resb maximum_number_of_characters_for_input





; segment .text is the code
segment .text

; The header or label 'arithmetic:' defines the initial program entry point
arithmetic: 

; Macro backs up the GPRs
create_activation_record


; Output the software maintainance message
mov  rax, 0
mov  rdi, string_format
mov  rsi, output_software_maintainance
call printf


; Ask for the first number
mov  rax, 0
mov  rdi, string_format
mov  rsi, prompt_number_one
call printf


; Obtain the first number
mov  rax, 0
mov  rdi, number_one
mov  rsi, maximum_number_of_characters_for_input
mov  rdx, [stdin]
call fgets


; Convert the string of the first number to a floating-point number
mov   rax, 0
mov   rdi, number_one
call  atof
movsd xmm15, xmm0


; Ask for the second number
mov  rax, 0
mov  rdi, string_format
mov  rsi, prompt_repeat_number
call printf


; Obtain the second number
mov  rax, 0
mov  rdi, number_two
mov  rsi, maximum_number_of_characters_for_input
mov  rdx, [stdin]
call fgets


; Convert the string of the second number to a floating-point number
mov   rax, 0
mov   rdi, number_two
call  atof
movsd xmm14, xmm0


; Ask for the third number
mov   rax, 0
mov   rdi, string_format
mov   rsi, prompt_repeat_number
call printf

; Obtain the third number
mov   rax, 0
mov   rdi, number_three
mov   rsi, maximum_number_of_characters_for_input
mov  rdx, [stdin]
call fgets

; Convert the string of number to a floating-point number
mov rax, 0
mov rdi, number_three
call atof
movsd xmm13, xmm0

; Add the first and second number

addsd xmm15, xmm14


; Subtract the first and third number

subsd xmm15, xmm13


; Multiply the second and third number
mulsd xmm14, xmm13

; Divide the first and second number
divsd xmm15, xmm14

; Send the result of xmm15 to main.c
movsd xmm0, xmm15

; Restore original values to general registers
delete_activation_record

; Return
ret