EXTRN ExitProcess: PROC
EXTRN AllocConsole: PROC
EXTRN GetStdHandle: PROC
EXTRN WriteConsoleA: PROC

.data
    hello db "Hai you", 0
    bytesWritten dd ?

.code

CONOUT proc
    sub rsp, 40
    mov rcx, -11 ; STD_OUTPUT_HANDLE:-11
    ;HANDLE(i32)
    ;DWORD(i32)
    ;HANDLE(rax) GetStdHandle(DWORD nStdHandle(rcx))
    call GetStdHandle
    mov rcx, rax
    mov r8, rdx
    lea r9, bytesWritten
    lea rdx, hello
    mov rax, 0
    mov [rsp+32], rax
    ;BOOL(rax) WriteConsoleA 
    ;(HANDLE  hConsoleOutput(rcx),
    ; VOID* lpBuffer(rdx),
    ; DWORD nNumberOfCharsToWrite(r8),
    ; LPDWORD lpNumberOfCharsWritten(r9),
    ; LPVOID lpReserved)
    call WriteConsoleA
    add rsp, 40
    ret
CONOUT endp

MAIN proc
    int 3
    sub rsp, 28h                ; Some stack?
    ;call AllocConsole
    lea rcx, hello
    mov rdx, 3
    call CONOUT
    ;add rsp, 28h
    xor rcx, rcx                ; return 0
    call ExitProcess
MAIN endp

end
