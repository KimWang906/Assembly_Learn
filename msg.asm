;읽기 쓰기가 가능한 일반적인 데이터를 위한 영역이다.
section .data 
    msg db "Hello World"
    
    ;data영역에 Hello World라는 문자열을 만들어놓고, 
    ;이 위치를 가리키는 포인터 msg를 변수로 두었다.

;실행파일의 소스코드가 들어있는 영역으로, 
;여기서는 text영역에 가장 처음으로 실행되는 start 함수를 정의했다.
section .text
    global _start
    ;_start 함수는 main 함수보다 먼저 실행되는 함수를 의미한다.
    golbal _start1

_start:
    mov rax, 1 ;sys_write mode(쓰기)
    mov rdi, 1
    mov rsi, msg
    mov rdx, 12
    syscall
    ;syscall이란, 프로세스가 하드웨어에 직접 접근해서 필요한 기능을 사용할 수 있게 해주는 기능이다.
    ;syscall을 하기 전, rax에 어떤 값이 담겨있느냐에 따라 syscall의 기능이 달라진다.
    mov rax, 60 ;sys_exit mode(프로그램 종료)
    mov rdi, 0
    syscall