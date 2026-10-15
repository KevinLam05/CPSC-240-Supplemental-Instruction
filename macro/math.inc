; This is an include file for the program Macro Practice

; Macro computes the area of a triangle using float numbers
%macro area_of_a_trinagle 3
; %1 = length of side 1 as qword float
; %2 = length of side 2 as qword float
; %3 = area of the triangle as qword float
; Area of a triangle = 1/2 * base * height
movsd xmm13, %1
mulsd xmm13, %2
mov rbx, 2
cvtsi2sd xmm14, rbx
divsd xmm13, xmm14
movsd %3, xmm13
%endmacro

; Macro computes the third angle of a right trangle
%macro third_angle 3
; %1 = 180.0
; %2 = angle 1 as qword float
; %3 = angle 2 as qword float
; Third angle of a triangle = 180 - angle1 - angle2
movsd xmm15, %1
subsd xmm15, %2
subsd xmm15, %3
movsd %1, xmm15
%endmacro

; Macro that backs up all the GPRs
%macro create_activation_record 0    
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
   pushf
%endmacro


; Macro that deletes activation record 
%macro delete_activation_record 0
popf
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
%endmacro