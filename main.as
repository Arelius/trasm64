EXTRN ExitProcess: PROC
EXTRN GetStdHandle: PROC
EXTRN WriteConsoleA: PROC

.data
    hello db "Hai you", 0

.code

CONOUT proc
    mov rdx, rcx
    mov r8, rdx
    mov rcx, -11
    call GetStdHandle
    mov rcx, -11
    call GetStdHandle
    ;BOOL WriteConsoleA
    ;(HANDLE  hConsoleOutput(rcx),
    ; VOID* lpBuffer(rdx),
    ; DWORD nNumberOfCharsToWrite(r8),
    ; LPDWORD lpNumberOfCharsWritten(r9),
    ; LPVOID lpReserved)
    mov rcx, rax
    xor r9, r9
    push 0
    call WriteConsoleA
    ; add esp, 4
    add rsp, 8
    ret
CONOUT endp

MAIN proc
    sub rsp, 28h                ; Some stack?
    lea rcx, hello
    mov rdx, 7
    call CONOUT
    ;add rsp, 28h
    xor rcx, rcx                ; return 0
    call ExitProcess
MAIN endp

end
