InsertSort:
        push    rbp
        mov     rbp, rsp
        mov     QWORD PTR [rbp-56], rdi
        cmp     QWORD PTR [rbp-56], 0
        je      .L2
        mov     rax, QWORD PTR [rbp-56]
        mov     rax, QWORD PTR [rax+8]
        test    rax, rax
        jne     .L3
.L2:
        mov     rax, QWORD PTR [rbp-56]
        jmp     .L4
.L3:
        mov     rax, QWORD PTR [rbp-56]
        mov     QWORD PTR [rbp-16], rax
        mov     rax, QWORD PTR [rbp-56]
        mov     rax, QWORD PTR [rax+8]
        mov     QWORD PTR [rbp-8], rax
        mov     rax, QWORD PTR [rbp-16]
        mov     QWORD PTR [rax+8], 0
        jmp     .L5
.L14:
        mov     rax, QWORD PTR [rbp-16]
        movss   xmm0, DWORD PTR [rax]
        mov     rax, QWORD PTR [rbp-8]
        movss   xmm1, DWORD PTR [rax]
        comiss  xmm0, xmm1
        jbe     .L16
        mov     rax, QWORD PTR [rbp-8]
        mov     QWORD PTR [rbp-40], rax
        mov     rax, QWORD PTR [rbp-8]
        mov     rax, QWORD PTR [rax+8]
        mov     QWORD PTR [rbp-8], rax
        mov     rax, QWORD PTR [rbp-40]
        mov     rdx, QWORD PTR [rbp-16]
        mov     QWORD PTR [rax+8], rdx
        mov     rax, QWORD PTR [rbp-40]
        mov     QWORD PTR [rbp-16], rax
        jmp     .L5
.L16:
        mov     rax, QWORD PTR [rbp-16]
        mov     QWORD PTR [rbp-24], rax
        jmp     .L8
.L12:
        mov     rax, QWORD PTR [rbp-24]
        mov     rax, QWORD PTR [rax+8]
        movss   xmm0, DWORD PTR [rax]
        mov     rax, QWORD PTR [rbp-8]
        movss   xmm1, DWORD PTR [rax]
        comiss  xmm0, xmm1
        ja      .L17
        mov     rax, QWORD PTR [rbp-24]
        mov     rax, QWORD PTR [rax+8]
        mov     QWORD PTR [rbp-24], rax
.L8:
        mov     rax, QWORD PTR [rbp-24]
        mov     rax, QWORD PTR [rax+8]
        test    rax, rax
        jne     .L12
        jmp     .L11
.L17:
        nop
.L11:
        mov     rax, QWORD PTR [rbp-24]
        mov     rax, QWORD PTR [rax+8]
        test    rax, rax
        je      .L13
        mov     rax, QWORD PTR [rbp-8]
        mov     QWORD PTR [rbp-32], rax
        mov     rax, QWORD PTR [rbp-8]
        mov     rax, QWORD PTR [rax+8]
        mov     QWORD PTR [rbp-8], rax
        mov     rax, QWORD PTR [rbp-24]
        mov     rdx, QWORD PTR [rax+8]
        mov     rax, QWORD PTR [rbp-32]
        mov     QWORD PTR [rax+8], rdx
        mov     rax, QWORD PTR [rbp-24]
        mov     rdx, QWORD PTR [rbp-32]
        mov     QWORD PTR [rax+8], rdx
        jmp     .L5
.L13:
        mov     rax, QWORD PTR [rbp-24]
        mov     rdx, QWORD PTR [rbp-8]
        mov     QWORD PTR [rax+8], rdx
        mov     rax, QWORD PTR [rbp-8]
        mov     rax, QWORD PTR [rax+8]
        mov     QWORD PTR [rbp-8], rax
        mov     rax, QWORD PTR [rbp-24]
        mov     rax, QWORD PTR [rax+8]
        mov     QWORD PTR [rax+8], 0
        nop
.L5:
        cmp     QWORD PTR [rbp-8], 0
        jne     .L14
        mov     rax, QWORD PTR [rbp-16]
.L4:
        pop     rbp
        ret
.LC0:
        .string "%f "
print:
        push    rbp
        mov     rbp, rsp
        sub     rsp, 32
        mov     QWORD PTR [rbp-24], rdi
        mov     DWORD PTR [rbp-28], esi
        mov     DWORD PTR [rbp-4], 0
        jmp     .L19
.L20:
        mov     eax, DWORD PTR [rbp-4]
        cdqe
        lea     rdx, [0+rax*4]
        mov     rax, QWORD PTR [rbp-24]
        add     rax, rdx
        movss   xmm0, DWORD PTR [rax]
        pxor    xmm1, xmm1
        cvtss2sd        xmm1, xmm0
        movq    rax, xmm1
        movq    xmm0, rax
        mov     edi, OFFSET FLAT:.LC0
        mov     eax, 1
        call    printf
        add     DWORD PTR [rbp-4], 1
.L19:
        mov     eax, DWORD PTR [rbp-4]
        cmp     eax, DWORD PTR [rbp-28]
        jl      .L20
        mov     edi, 10
        call    putchar
        nop
        leave
        ret
PrintBuckets:
        push    rbp
        mov     rbp, rsp
        sub     rsp, 32
        mov     QWORD PTR [rbp-24], rdi
        mov     rax, QWORD PTR [rbp-24]
        mov     QWORD PTR [rbp-8], rax
        jmp     .L22
.L23:
        mov     rax, QWORD PTR [rbp-8]
        movss   xmm0, DWORD PTR [rax]
        pxor    xmm1, xmm1
        cvtss2sd        xmm1, xmm0
        movq    rax, xmm1
        movq    xmm0, rax
        mov     edi, OFFSET FLAT:.LC0
        mov     eax, 1
        call    printf
        mov     rax, QWORD PTR [rbp-8]
        mov     rax, QWORD PTR [rax+8]
        mov     QWORD PTR [rbp-8], rax
.L22:
        cmp     QWORD PTR [rbp-8], 0
        jne     .L23
        nop
        nop
        leave
        ret
.LC2:
        .string "B[%d]: "
.LC3:
        .string "Bucktets after sorting:"
BucketSort:
        push    rbp
        mov     rbp, rsp
        push    rbx
        sub     rsp, 72
        mov     QWORD PTR [rbp-72], rdi
        mov     DWORD PTR [rbp-76], esi
        mov     DWORD PTR [rbp-80], edx
        mov     eax, DWORD PTR [rbp-80]
        cdqe
        sal     rax, 3
        mov     rdi, rax
        call    malloc
        mov     QWORD PTR [rbp-40], rax
        mov     DWORD PTR [rbp-20], 0
        jmp     .L25
.L26:
        mov     eax, DWORD PTR [rbp-20]
        cdqe
        lea     rdx, [0+rax*8]
        mov     rax, QWORD PTR [rbp-40]
        add     rax, rdx
        mov     QWORD PTR [rax], 0
        add     DWORD PTR [rbp-20], 1
.L25:
        mov     eax, DWORD PTR [rbp-20]
        cmp     eax, DWORD PTR [rbp-80]
        jl      .L26
        mov     DWORD PTR [rbp-20], 0
        jmp     .L27
.L28:
        mov     eax, DWORD PTR [rbp-20]
        cdqe
        lea     rdx, [0+rax*4]
        mov     rax, QWORD PTR [rbp-72]
        add     rax, rdx
        movss   xmm1, DWORD PTR [rax]
        movss   xmm0, DWORD PTR .LC1[rip]
        mulss   xmm0, xmm1
        cvttss2si       eax, xmm0
        mov     DWORD PTR [rbp-44], eax
        mov     edi, 16
        call    malloc
        mov     QWORD PTR [rbp-56], rax
        mov     eax, DWORD PTR [rbp-20]
        cdqe
        lea     rdx, [0+rax*4]
        mov     rax, QWORD PTR [rbp-72]
        add     rax, rdx
        movss   xmm0, DWORD PTR [rax]
        mov     rax, QWORD PTR [rbp-56]
        movss   DWORD PTR [rax], xmm0
        mov     eax, DWORD PTR [rbp-44]
        cdqe
        lea     rdx, [0+rax*8]
        mov     rax, QWORD PTR [rbp-40]
        add     rax, rdx
        mov     rdx, QWORD PTR [rax]
        mov     rax, QWORD PTR [rbp-56]
        mov     QWORD PTR [rax+8], rdx
        mov     eax, DWORD PTR [rbp-44]
        cdqe
        lea     rdx, [0+rax*8]
        mov     rax, QWORD PTR [rbp-40]
        add     rdx, rax
        mov     rax, QWORD PTR [rbp-56]
        mov     QWORD PTR [rdx], rax
        add     DWORD PTR [rbp-20], 1
.L27:
        mov     eax, DWORD PTR [rbp-20]
        cmp     eax, DWORD PTR [rbp-76]
        jl      .L28
        mov     DWORD PTR [rbp-20], 0
        jmp     .L29
.L30:
        mov     eax, DWORD PTR [rbp-20]
        mov     esi, eax
        mov     edi, OFFSET FLAT:.LC2
        mov     eax, 0
        call    printf
        mov     eax, DWORD PTR [rbp-20]
        cdqe
        lea     rdx, [0+rax*8]
        mov     rax, QWORD PTR [rbp-40]
        add     rax, rdx
        mov     rax, QWORD PTR [rax]
        mov     rdi, rax
        call    PrintBuckets
        mov     edi, 10
        call    putchar
        add     DWORD PTR [rbp-20], 1
.L29:
        mov     eax, DWORD PTR [rbp-20]
        cmp     eax, DWORD PTR [rbp-80]
        jl      .L30
        mov     DWORD PTR [rbp-20], 0
        jmp     .L31
.L32:
        mov     eax, DWORD PTR [rbp-20]
        cdqe
        lea     rdx, [0+rax*8]
        mov     rax, QWORD PTR [rbp-40]
        add     rax, rdx
        mov     rax, QWORD PTR [rax]
        mov     edx, DWORD PTR [rbp-20]
        movsx   rdx, edx
        lea     rcx, [0+rdx*8]
        mov     rdx, QWORD PTR [rbp-40]
        lea     rbx, [rcx+rdx]
        mov     rdi, rax
        call    InsertSort
        mov     QWORD PTR [rbx], rax
        add     DWORD PTR [rbp-20], 1
.L31:
        mov     eax, DWORD PTR [rbp-20]
        cmp     eax, DWORD PTR [rbp-80]
        jl      .L32
        mov     edi, 10
        call    putchar
        mov     edi, OFFSET FLAT:.LC3
        call    puts
        mov     edi, 10
        call    putchar
        mov     DWORD PTR [rbp-20], 0
        jmp     .L33
.L34:
        mov     eax, DWORD PTR [rbp-20]
        mov     esi, eax
        mov     edi, OFFSET FLAT:.LC2
        mov     eax, 0
        call    printf
        mov     eax, DWORD PTR [rbp-20]
        cdqe
        lea     rdx, [0+rax*8]
        mov     rax, QWORD PTR [rbp-40]
        add     rax, rdx
        mov     rax, QWORD PTR [rax]
        mov     rdi, rax
        call    PrintBuckets
        mov     edi, 10
        call    putchar
        add     DWORD PTR [rbp-20], 1
.L33:
        mov     eax, DWORD PTR [rbp-20]
        cmp     eax, DWORD PTR [rbp-80]
        jl      .L34
        mov     DWORD PTR [rbp-24], 0
        mov     DWORD PTR [rbp-20], 0
        jmp     .L35
.L38:
        mov     eax, DWORD PTR [rbp-20]
        cdqe
        lea     rdx, [0+rax*8]
        mov     rax, QWORD PTR [rbp-40]
        add     rax, rdx
        mov     rax, QWORD PTR [rax]
        mov     QWORD PTR [rbp-32], rax
        jmp     .L36
.L37:
        mov     eax, DWORD PTR [rbp-24]
        lea     edx, [rax+1]
        mov     DWORD PTR [rbp-24], edx
        cdqe
        lea     rdx, [0+rax*4]
        mov     rax, QWORD PTR [rbp-72]
        add     rdx, rax
        mov     rax, QWORD PTR [rbp-32]
        movss   xmm0, DWORD PTR [rax]
        movss   DWORD PTR [rdx], xmm0
        mov     rax, QWORD PTR [rbp-32]
        mov     rax, QWORD PTR [rax+8]
        mov     QWORD PTR [rbp-32], rax
.L36:
        cmp     QWORD PTR [rbp-32], 0
        jne     .L37
        add     DWORD PTR [rbp-20], 1
.L35:
        mov     eax, DWORD PTR [rbp-20]
        cmp     eax, DWORD PTR [rbp-80]
        jl      .L38
        nop
        mov     rbx, QWORD PTR [rbp-8]
        leave
        ret
.LC4:
        .string "Enter No. of Floating Point Integers(p):"
.LC5:
        .string "%d"
.LC6:
        .string "\nEnter No. of Buckets(n):"
.LC7:
        .string "%f"
.LC8:
        .string "Initial array: "
.LC9:
        .string "Sorted array: "
main:
        push    rbp
        mov     rbp, rsp
        push    r15
        push    r14
        push    r13
        push    r12
        push    rbx
        sub     rsp, 40
        mov     rax, rsp
        mov     rbx, rax
        mov     edi, OFFSET FLAT:.LC4
        mov     eax, 0
        call    printf
        lea     rax, [rbp-76]
        mov     rsi, rax
        mov     edi, OFFSET FLAT:.LC5
        mov     eax, 0
        call    __isoc99_scanf
        mov     edi, OFFSET FLAT:.LC6
        mov     eax, 0
        call    printf
        lea     rax, [rbp-80]
        mov     rsi, rax
        mov     edi, OFFSET FLAT:.LC5
        mov     eax, 0
        call    __isoc99_scanf
        mov     edi, 10
        call    putchar
        mov     eax, DWORD PTR [rbp-76]
        movsx   rdx, eax
        sub     rdx, 1
        mov     QWORD PTR [rbp-64], rdx
        movsx   rdx, eax
        mov     r14, rdx
        mov     r15d, 0
        movsx   rdx, eax
        mov     r12, rdx
        mov     r13d, 0
        cdqe
        lea     rdx, [0+rax*4]
        mov     eax, 16
        sub     rax, 1
        add     rax, rdx
        mov     ecx, 16
        mov     edx, 0
        div     rcx
        imul    rax, rax, 16
        sub     rsp, rax
        mov     rax, rsp
        add     rax, 3
        shr     rax, 2
        sal     rax, 2
        mov     QWORD PTR [rbp-72], rax
        mov     DWORD PTR [rbp-52], 0
        jmp     .L41
.L42:
        mov     eax, DWORD PTR [rbp-52]
        cdqe
        lea     rdx, [0+rax*4]
        mov     rax, QWORD PTR [rbp-72]
        add     rax, rdx
        mov     rsi, rax
        mov     edi, OFFSET FLAT:.LC7
        mov     eax, 0
        call    __isoc99_scanf
        add     DWORD PTR [rbp-52], 1
.L41:
        mov     eax, DWORD PTR [rbp-76]
        cmp     DWORD PTR [rbp-52], eax
        jl      .L42
        mov     edi, 10
        call    putchar
        mov     edi, OFFSET FLAT:.LC8
        mov     eax, 0
        call    printf
        mov     edx, DWORD PTR [rbp-76]
        mov     rax, QWORD PTR [rbp-72]
        mov     esi, edx
        mov     rdi, rax
        call    print
        mov     edi, 10
        call    putchar
        mov     edx, DWORD PTR [rbp-80]
        mov     ecx, DWORD PTR [rbp-76]
        mov     rax, QWORD PTR [rbp-72]
        mov     esi, ecx
        mov     rdi, rax
        call    BucketSort
        mov     edi, 10
        call    putchar
        mov     edi, OFFSET FLAT:.LC9
        mov     eax, 0
        call    printf
        mov     edx, DWORD PTR [rbp-76]
        mov     rax, QWORD PTR [rbp-72]
        mov     esi, edx
        mov     rdi, rax
        call    print
        mov     eax, 0
        mov     rsp, rbx
        lea     rsp, [rbp-40]
        pop     rbx
        pop     r12
        pop     r13
        pop     r14
        pop     r15
        pop     rbp
        ret
.LC1:
        .long   1092616192