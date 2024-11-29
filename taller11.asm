%macro example_macro 2-3
mov eax, %1
%ifdef %2
mov ebx, %2
%endif
%ifdef %3
mov ecx, %3
%endif
%endmacro