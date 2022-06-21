extern scanf
 
;nasm -f elf64 파일명.asm -o 파일명.o 	#64bit 파일
;nasm -f elf 파일명.asm -o 파일명.o	#32bit 파일

;64bit 바이너리에서는 syscall 로 시스템 콜을 하고
;32bit 바이너리에서는 int 0x80 으로 시스템 콜을 합니다.

segment .data   ;data영역
    star:    dw '*'
   enter:    dw 0x0a
    d_fmt:    db "%d",0
 
segment .text
    global _start

_start:
    push rbp
    mov rbp,rsp
    sub rsp, 0xc
and rsp,0xffffffffffffff00
    lea rsi, [rbp-0xc] ;n
    mov rdi, d_fmt
    mov rax,0
    call scanf
    mov DWORD [rbp-0x8],0 ; i
roop:
    mov eax, DWORD [rbp-0xc]
    cmp [rbp-0x8], eax
    jae end
    mov DWORD [rbp-0x4],0
roop2:
    mov eax,DWORD [rbp-0x8]
    cmp DWORd[rbp-0x4],eax
    jg roop_enter
    mov rdx,1
    mov rsi,star
    mov rdi,1
    mov rax,1
    syscall
    add DWORD [rbp-0x4],1
    jmp roop2
roop_enter:
    mov rdx,1
    mov rsi,enter
    mov rdi,1
    mov rax,1
    syscall
    add DWORD [rbp-0x8],1
    jmp roop
 
end:
    add rsp,0
   mov eax,60
xor rdi,rdi
syscall