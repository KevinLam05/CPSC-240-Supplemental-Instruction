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


; Declaration Section
%include "math.inc"
extern scanf
extern printf
global macro_practice


; segment .data is where initalized data is declared
segment .data


; New line and float
new_line db 10, 0
double_float db "%lf", 0


; Area of the triangle
prompt_side_one db "Enter the length of the first side of the triangle as a floating point number: ", 0
prompt_side_two db "Enter the length of the second side of the triangle as a floating point number: ", 0
confirm_sides db "Thank you. You entered two sides: %1.5lf and %1.5lf.", 10, 0
area_of_triangle db "The area of the triangle via the macro is %lf", 10, 0


; Third angle of the triangle
one_hundred_eighty dq 180.0, 0
prompt_angle_one db 10, "Enter the first angle as a floating point number: ", 0
prompt_angle_two db "Enter the second angle as a floating point number: ", 0
confirm_angles db "Thank you. You entered two angles: %1.10lf and %1.10lf.", 10, 0
third_angle_message db "The third angle via the macro is %lf", 10, 0





; segment .bss is where uninitialized data is declared 
segment .bss




; segment .text is the code 
segment .text

macro_practice:

; Macro backs up the GPRs
create_activation_record


; ---------- GROUP 1 ----------
; Prompt the user to input the length of the first side of the triangle as a floating point number
mov rax, 0
mov rdi, prompt_side_one
call printf


; Input the length of the first side of the triangle
mov rax, 1
mov rdi, double_float
mov rsi, rsp
call scanf
movsd xmm10, [rsp]

; Prompt the user to input the length of the second side of the triangle as a floating point numbers
mov rax, 0
mov rdi, prompt_side_two
call printf

; Input the length of the second side of the triangle
mov rax, 1
mov rdi, double_float
mov rsi, rsp
call scanf
movsd xmm11, [rsp]

; Output the length of the two sides of the triangle the user inputted
mov rax, 2
mov rdi, confirm_sides
movsd xmm0, xmm10
movsd xmm1, xmm11
call printf
; Call macro to do the computation of area of the triangle
; xmm10 = length of side1
; xmm11 = length of side2
; xmm12 = register that will receive the computed area from the macro
area_of_a_triangle xmm10, xmm11, xmm12
; Output the value in xmm12 as verification that the macro <area_of_a_triangle> really performs correctly
mov rax, 1
mov rdi, area_of_triangle
movsd xmm0, xmm12
call printf




; ---------- GROUP 2 ----------
; Prompt the user to input the first angle of the triangle
mov rax, 0
mov rdi, prompt_angle_one
call printf

; Input the first angle of the triangle
mov rax, 1
mov rdi, double_float
mov rsi, rsp
call scanf
movsd xmm9, [rsp]

; Prompt the user to input the second angle of the triangle
mov rax, 0
mov rdi, prompt_angle_two
call printf

; Input the second angle of the triangle
mov rax, 1
mov rdi, double_float
mov rsi, rsp
call scanf
movsd xmm8, [rsp]


; Output the two angles of the triangle the user inputted
mov rax, 2
mov rdi, confirm_angles
movsd xmm0, xmm9
movsd xmm1, xmm8
call printf

; Move 180.0 to xmm7
movsd xmm7, qword [one_hundred_eighty]

; Call macro to find the third angle of the triangle
; xmm7 = 180.0
; xmm9 = first angle
; xmm8 = second angle
third_angle xmm7, xmm9, xmm8

; Output the value in xmm7 as verification that the macro <third_angle> really performs correctly
mov rax, 1
mov rdi, third_angle_message
movsd xmm0, xmm7
call printf

; Send the area of the triangle back to the driver
movsd xmm0, xmm12




; Restore original values to general registers
delete_activation_record

ret