EXTRN ExitProcess: PROC
EXTRN GetStdHandle: PROC
EXTRN WriteConsoleA: PROC

.data
    hello db "Hai you", 0

.code

MAIN proc
    sub rsp, 28h                ; Some stack?
    mov rcx, -11
    call GetStdHandle
    ;BOOL WriteConsoleA
    ;(HANDLE  hConsoleOutput(rcx),
    ; VOID* lpBuffer(rdx),
    ; DWORD nNumberOfCharsToWrite(r8),
    ; LPDWORD lpNumberOfCharsWritten(r9),
    ; LPVOID lpReserved)
    mov rcx, rax
    lea rdx, hello
    mov r8, 3
    xor r9, r9
    push 0
    call WriteConsoleA
    ; add esp, 4
    add rsp, 8
    ;add rsp, 28h
    xor rcx, rcx                ; return 0
    call ExitProcess
MAIN endp

end
