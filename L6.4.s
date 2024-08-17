InsertSort:
        addiu  $sp,$sp,-80
        sd      $fp,72($sp)
        move    $fp,$sp
        sd      $4,48($fp)
        ld      $2,48($fp)
        beq     $2,$0,.L2
        nop

        ld      $2,48($fp)
        ld      $2,8($2)
        bne     $2,$0,.L3
        nop

.L2:
        ld      $2,48($fp)
        b       .L4
        nop

.L3:
        ld      $2,48($fp)
        sd      $2,8($fp)
        ld      $2,48($fp)
        ld      $2,8($2)
        sd      $2,0($fp)
        ld      $2,8($fp)
        sd      $0,8($2)
        b       .L5
        nop

.L14:
        ld      $2,8($fp)
        lwc1    $f1,0($2)
        ld      $2,0($fp)
        lwc1    $f0,0($2)
        c.lt.s  $f0,$f1
        bc1f    .L16
        nop

        ld      $2,0($fp)
        sd      $2,24($fp)
        ld      $2,0($fp)
        ld      $2,8($2)
        sd      $2,0($fp)
        ld      $2,24($fp)
        ld      $3,8($fp)
        sd      $3,8($2)
        ld      $2,24($fp)
        sd      $2,8($fp)
        b       .L5
        nop

.L16:
        ld      $2,8($fp)
        sd      $2,16($fp)
        b       .L8
        nop

.L12:
        ld      $2,16($fp)
        ld      $2,8($2)
        lwc1    $f1,0($2)
        ld      $2,0($fp)
        lwc1    $f0,0($2)
        c.lt.s  $f0,$f1
        bc1t    .L17
        nop

        ld      $2,16($fp)
        ld      $2,8($2)
        sd      $2,16($fp)
.L8:
        ld      $2,16($fp)
        ld      $2,8($2)
        bne     $2,$0,.L12
        nop

        b       .L11
        nop

.L17:
        nop
.L11:
        ld      $2,16($fp)
        ld      $2,8($2)
        beq     $2,$0,.L13
        nop

        ld      $2,0($fp)
        sd      $2,32($fp)
        ld      $2,0($fp)
        ld      $2,8($2)
        sd      $2,0($fp)
        ld      $2,16($fp)
        ld      $3,8($2)
        ld      $2,32($fp)
        sd      $3,8($2)
        ld      $2,16($fp)
        ld      $3,32($fp)
        sd      $3,8($2)
        b       .L5
        nop

.L13:
        ld      $2,16($fp)
        ld      $3,0($fp)
        sd      $3,8($2)
        ld      $2,0($fp)
        ld      $2,8($2)
        sd      $2,0($fp)
        ld      $2,16($fp)
        ld      $2,8($2)
        sd      $0,8($2)
        nop
.L5:
        ld      $2,0($fp)
        bne     $2,$0,.L14
        nop

        ld      $2,8($fp)
.L4:
        move    $sp,$fp
        ld      $fp,72($sp)
    addiu  $sp,$sp,80
        j       $31
        nop

.LC0:
        .ascii  "%f \000"
print:
    addiu  $sp,$sp,-64
        sd      $31,56($sp)
        sd      $fp,48($sp)
        sd      $28,40($sp)
        move    $fp,$sp
        lui     $28,%hi(%neg(%gp_rel(print)))
        daddu   $28,$28,$25
    addiu  $28,$28,%lo(%neg(%gp_rel(print)))
        sd      $4,16($fp)
        move    $2,$5
        sll     $2,$2,0
        sw      $2,24($fp)
        sw      $0,0($fp)
        b       .L19
        nop

.L20:
        lw      $2,0($fp)
        dsll    $2,$2,2
        ld      $3,16($fp)
        daddu   $2,$3,$2
        lwc1    $f0,0($2)
        cvt.d.s $f0,$f0
        dmfc1   $5,$f0
        ld      $2,%got_page(.LC0)($28)
    addiu  $4,$2,%got_ofst(.LC0)
        ld      $2,%call16(printf)($28)
        move    $25,$2
        nop

        lw      $2,0($fp)
        addiu   $2,$2,1
        sw      $2,0($fp)
.L19:
        lw      $3,0($fp)
        lw      $2,24($fp)
        slt     $2,$3,$2
        bne     $2,$0,.L20
        nop

        li      $4,10                 # 0xa
        ld      $2,%call16(putchar)($28)
        move    $25,$2
        nop

        nop
        move    $sp,$fp
        ld      $31,56($sp)
        ld      $fp,48($sp)
        ld      $28,40($sp)
    addiu  $sp,$sp,64
        j       $31
        nop

PrintBuckets:
    addiu  $sp,$sp,-64
        sd      $31,56($sp)
        sd      $fp,48($sp)
        sd      $28,40($sp)
        move    $fp,$sp
        lui     $28,%hi(%neg(%gp_rel(PrintBuckets)))
        daddu   $28,$28,$25
    addiu  $28,$28,%lo(%neg(%gp_rel(PrintBuckets)))
        sd      $4,16($fp)
        ld      $2,16($fp)
        sd      $2,0($fp)
        b       .L22
        nop

.L23:
        ld      $2,0($fp)
        lwc1    $f0,0($2)
        cvt.d.s $f0,$f0
        dmfc1   $5,$f0
        ld      $2,%got_page(.LC0)($28)
    addiu  $4,$2,%got_ofst(.LC0)
        ld      $2,%call16(printf)($28)
        move    $25,$2
        nop

        ld      $2,0($fp)
        ld      $2,8($2)
        sd      $2,0($fp)
.L22:
        ld      $2,0($fp)
        bne     $2,$0,.L23
        nop

        nop
        move    $sp,$fp
        ld      $31,56($sp)
        ld      $fp,48($sp)
        ld      $28,40($sp)
    addiu  $sp,$sp,64
        j       $31
        nop

.LC2:
        .ascii  "B[%d]: \000"
.LC3:
        .ascii  "Bucktets after sorting:\000"
BucketSort:
    addiu  $sp,$sp,-96
        sd      $31,88($sp)
        sd      $fp,80($sp)
        sd      $28,72($sp)
        sd      $16,64($sp)
        move    $fp,$sp
        lui     $28,%hi(%neg(%gp_rel(BucketSort)))
        daddu   $28,$28,$25
    addiu  $28,$28,%lo(%neg(%gp_rel(BucketSort)))
        sd      $4,48($fp)
        move    $3,$5
        move    $2,$6
        sll     $3,$3,0
        sw      $3,56($fp)
        sll     $2,$2,0
        sw      $2,60($fp)
        lw      $2,60($fp)
        dsll    $2,$2,3
        move    $4,$2
        ld      $2,%call16(malloc)($28)
        move    $25,$2
        nop

        sd      $2,16($fp)
        sw      $0,0($fp)
        b       .L25
        nop

.L26:
        lw      $2,0($fp)
        dsll    $2,$2,3
        ld      $3,16($fp)
        daddu   $2,$3,$2
        sd      $0,0($2)
        lw      $2,0($fp)
        addiu   $2,$2,1
        sw      $2,0($fp)
.L25:
        lw      $3,0($fp)
        lw      $2,60($fp)
        slt     $2,$3,$2
        bne     $2,$0,.L26
        nop

        sw      $0,0($fp)
        b       .L27
        nop

.L28:
        lw      $2,0($fp)
        dsll    $2,$2,2
        ld      $3,48($fp)
        daddu   $2,$3,$2
        lwc1    $f1,0($2)
        ld      $2,%got_page(.LC1)($28)
        lwc1    $f0,%got_ofst(.LC1)($2)
        mul.s   $f0,$f1,$f0
        trunc.w.s $f0,$f0
        mfc1    $2,$f0
        sw      $2,24($fp)
        li      $4,16                 # 0x10
        ld      $2,%call16(malloc)($28)
        move    $25,$2
        nop

        sd      $2,32($fp)
        lw      $2,0($fp)
        dsll    $2,$2,2
        ld      $3,48($fp)
        daddu   $2,$3,$2
        lwc1    $f0,0($2)
        ld      $2,32($fp)
        swc1    $f0,0($2)
        lw      $2,24($fp)
        dsll    $2,$2,3
        ld      $3,16($fp)
        daddu   $2,$3,$2
        ld      $3,0($2)
        ld      $2,32($fp)
        sd      $3,8($2)
        lw      $2,24($fp)
        dsll    $2,$2,3
        ld      $3,16($fp)
        daddu   $2,$3,$2
        ld      $3,32($fp)
        sd      $3,0($2)
        lw      $2,0($fp)
        addiu   $2,$2,1
        sw      $2,0($fp)
.L27:
        lw      $3,0($fp)
        lw      $2,56($fp)
        slt     $2,$3,$2
        bne     $2,$0,.L28
        nop

        sw      $0,0($fp)
        b       .L29
        nop

.L30:
        lw      $2,0($fp)
        move    $5,$2
        ld      $2,%got_page(.LC2)($28)
    addiu  $4,$2,%got_ofst(.LC2)
        ld      $2,%call16(printf)($28)
        move    $25,$2
        nop

        lw      $2,0($fp)
        dsll    $2,$2,3
        ld      $3,16($fp)
        daddu   $2,$3,$2
        ld      $2,0($2)
        move    $4,$2
        ld      $2,%got_disp(PrintBuckets)($28)
        move    $25,$2
        nop

        li      $4,10                 # 0xa
        ld      $2,%call16(putchar)($28)
        move    $25,$2
        nop

        lw      $2,0($fp)
        addiu   $2,$2,1
        sw      $2,0($fp)
.L29:
        lw      $3,0($fp)
        lw      $2,60($fp)
        slt     $2,$3,$2
        bne     $2,$0,.L30
        nop

        sw      $0,0($fp)
        b       .L31
        nop

.L32:
        lw      $2,0($fp)
        dsll    $2,$2,3
        ld      $3,16($fp)
        daddu   $16,$3,$2
        lw      $2,0($fp)
        dsll    $2,$2,3
        ld      $3,16($fp)
        daddu   $2,$3,$2
        ld      $2,0($2)
        move    $4,$2
        ld      $2,%got_disp(InsertSort)($28)
        move    $25,$2
        nop

        sd      $2,0($16)
        lw      $2,0($fp)
        addiu   $2,$2,1
        sw      $2,0($fp)
.L31:
        lw      $3,0($fp)
        lw      $2,60($fp)
        slt     $2,$3,$2
        bne     $2,$0,.L32
        nop

        li      $4,10                 # 0xa
        ld      $2,%call16(putchar)($28)
        move    $25,$2
        nop

        ld      $2,%got_page(.LC3)($28)
    addiu  $4,$2,%got_ofst(.LC3)
        ld      $2,%call16(puts)($28)
        move    $25,$2
        nop

        li      $4,10                 # 0xa
        ld      $2,%call16(putchar)($28)
        move    $25,$2
        nop

        sw      $0,0($fp)
        b       .L33
        nop

.L34:
        lw      $2,0($fp)
        move    $5,$2
        ld      $2,%got_page(.LC2)($28)
    addiu  $4,$2,%got_ofst(.LC2)
        ld      $2,%call16(printf)($28)
        move    $25,$2
        nop

        lw      $2,0($fp)
        dsll    $2,$2,3
        ld      $3,16($fp)
        daddu   $2,$3,$2
        ld      $2,0($2)
        move    $4,$2
        ld      $2,%got_disp(PrintBuckets)($28)
        move    $25,$2
        nop

        li      $4,10                 # 0xa
        ld      $2,%call16(putchar)($28)
        move    $25,$2
        nop

        lw      $2,0($fp)
        addiu   $2,$2,1
        sw      $2,0($fp)
.L33:
        lw      $3,0($fp)
        lw      $2,60($fp)
        slt     $2,$3,$2
        bne     $2,$0,.L34
        nop

        sw      $0,4($fp)
        sw      $0,0($fp)
        b       .L35
        nop

.L38:
        lw      $2,0($fp)
        dsll    $2,$2,3
        ld      $3,16($fp)
        daddu   $2,$3,$2
        ld      $2,0($2)
        sd      $2,8($fp)
        b       .L36
        nop

.L37:
        lw      $2,4($fp)
        addiu   $3,$2,1
        sw      $3,4($fp)
        dsll    $2,$2,2
        ld      $3,48($fp)
        daddu   $2,$3,$2
        ld      $3,8($fp)
        lwc1    $f0,0($3)
        swc1    $f0,0($2)
        ld      $2,8($fp)
        ld      $2,8($2)
        sd      $2,8($fp)
.L36:
        ld      $2,8($fp)
        bne     $2,$0,.L37
        nop

        lw      $2,0($fp)
        addiu   $2,$2,1
        sw      $2,0($fp)
.L35:
        lw      $3,0($fp)
        lw      $2,60($fp)
        slt     $2,$3,$2
        bne     $2,$0,.L38
        nop

        nop
        move    $sp,$fp
        ld      $31,88($sp)
        ld      $fp,80($sp)
        ld      $28,72($sp)
        ld      $16,64($sp)
    addiu  $sp,$sp,96
        j       $31
        nop

.LC4:
        .ascii  "Enter No. of Floating Point Integers(p):\000"
.LC5:
        .ascii  "%d\000"
.LC6:
        .ascii  "\012Enter No. of Buckets(n):\000"
.LC7:
        .ascii  "%f\000"
.LC8:
        .ascii  "Initial array: \000"
.LC9:
        .ascii  "Sorted array: \000"
main:
    addiu  $sp,$sp,-144
        sd      $31,136($sp)
        sd      $fp,128($sp)
        sd      $28,120($sp)
        sd      $23,112($sp)
        sd      $22,104($sp)
        sd      $21,96($sp)
        sd      $20,88($sp)
        sd      $19,80($sp)
        sd      $18,72($sp)
        sd      $17,64($sp)
        sd      $16,56($sp)
        move    $fp,$sp
        lui     $28,%hi(%neg(%gp_rel(main)))
        daddu   $28,$28,$25
    addiu  $28,$28,%lo(%neg(%gp_rel(main)))
        move    $2,$sp
        sd      $2,32($fp)
        ld      $2,%got_page(.LC4)($28)
    addiu  $4,$2,%got_ofst(.LC4)
        ld      $2,%call16(printf)($28)
        move    $25,$2
        nop

    addiu  $2,$fp,24
        move    $5,$2
        ld      $2,%got_page(.LC5)($28)
    addiu  $4,$2,%got_ofst(.LC5)
        ld      $2,%call16(__isoc99_scanf)($28)
        move    $25,$2
        nop

        ld      $2,%got_page(.LC6)($28)
    addiu  $4,$2,%got_ofst(.LC6)
        ld      $2,%call16(printf)($28)
        move    $25,$2
        nop

    addiu  $2,$fp,28
        move    $5,$2
        ld      $2,%got_page(.LC5)($28)
    addiu  $4,$2,%got_ofst(.LC5)
        ld      $2,%call16(__isoc99_scanf)($28)
        move    $25,$2
        nop

        li      $4,10                 # 0xa
        ld      $2,%call16(putchar)($28)
        move    $25,$2
        nop

        lw      $2,24($fp)
        move    $3,$2
    addiu  $3,$3,-1
        sd      $3,8($fp)
        move    $3,$2
        move    $23,$3
        move    $22,$0
        dsrl    $3,$23,59
        dsll    $18,$22,5
        or      $18,$3,$18
        dsll    $19,$23,5
        move    $3,$2
        move    $21,$3
        move    $20,$0
        dsrl    $3,$21,59
        dsll    $16,$20,5
        or      $16,$3,$16
        dsll    $17,$21,5
        dsll    $2,$2,2
    addiu  $2,$2,3
    addiu  $2,$2,15
        dsrl    $2,$2,4
        dsll    $2,$2,4
        dsubu   $sp,$sp,$2
        move    $2,$sp
    addiu  $2,$2,3
        dsrl    $2,$2,2
        dsll    $2,$2,2
        sd      $2,16($fp)
        sw      $0,0($fp)
        b       .L41
        nop

.L42:
        lw      $2,0($fp)
        dsll    $2,$2,2
        ld      $3,16($fp)
        daddu   $2,$3,$2
        move    $5,$2
        ld      $2,%got_page(.LC7)($28)
    addiu  $4,$2,%got_ofst(.LC7)
        ld      $2,%call16(__isoc99_scanf)($28)
        move    $25,$2
        nop

        lw      $2,0($fp)
        addiu   $2,$2,1
        sw      $2,0($fp)
.L41:
        lw      $2,24($fp)
        lw      $3,0($fp)
        slt     $2,$3,$2
        bne     $2,$0,.L42
        nop

        li      $4,10                 # 0xa
        ld      $2,%call16(putchar)($28)
        move    $25,$2
        nop

        ld      $2,%got_page(.LC8)($28)
    addiu  $4,$2,%got_ofst(.LC8)
        ld      $2,%call16(printf)($28)
        move    $25,$2
        nop

        ld      $2,16($fp)
        lw      $3,24($fp)
        move    $5,$3
        move    $4,$2
        ld      $2,%got_disp(print)($28)
        move    $25,$2
        nop

        li      $4,10                 # 0xa
        ld      $2,%call16(putchar)($28)
        move    $25,$2
        nop

        ld      $2,16($fp)
        lw      $3,24($fp)
        lw      $4,28($fp)
        move    $6,$4
        move    $5,$3
        move    $4,$2
        ld      $2,%got_disp(BucketSort)($28)
        move    $25,$2
        nop

        li      $4,10                 # 0xa
        ld      $2,%call16(putchar)($28)
        move    $25,$2
        nop

        ld      $2,%got_page(.LC9)($28)
    addiu  $4,$2,%got_ofst(.LC9)
        ld      $2,%call16(printf)($28)
        move    $25,$2
        nop

        ld      $2,16($fp)
        lw      $3,24($fp)
        move    $5,$3
        move    $4,$2
        ld      $2,%got_disp(print)($28)
        move    $25,$2
        nop

        move    $2,$0
        ld      $sp,32($fp)
        move    $sp,$fp
        ld      $31,136($sp)
        ld      $fp,128($sp)
        ld      $28,120($sp)
        ld      $23,112($sp)
        ld      $22,104($sp)
        ld      $21,96($sp)
        ld      $20,88($sp)
        ld      $19,80($sp)
        ld      $18,72($sp)
        ld      $17,64($sp)
        ld      $16,56($sp)
    addiu  $sp,$sp,144
        j       $31
        nop

.LC1:
        .word   1092616192