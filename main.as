EXTRN ExitProcess: PROC
EXTRN AllocConsole: PROC
EXTRN GetStdHandle: PROC
EXTRN WriteConsoleA: PROC

.data
    hello db "Hai you", 0

.code

CONOUT proc
    sub rsp, 8 ; numberofcarswritten
    mov r9, rsp
    sub rsp, 40
    mov r8, rdx
    mov rdx, rcx
    mov rcx, -11
    call GetStdHandle
    ;BOOL WriteConsoleA
    ;(HANDLE  hConsoleOutput(rcx),
    ; VOID* lpBuffer(rdx),
    ; DWORD nNumberOfCharsToWrite(r8),
    ; LPDWORD lpNumberOfCharsWritten(r9),
    ; LPVOID lpReserved)
    mov rcx, rax
    ;xor r9, r9
    call WriteConsoleA
    add rsp, 48
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
