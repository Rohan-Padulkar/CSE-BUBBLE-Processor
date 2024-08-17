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
        .ascii  "%f"
print:
        addiu  $sp,$sp,-64
        sd      $31,56($sp)
        sd      $fp,48($sp)
        sd      $28,40($sp)
        move    $fp,$sp
        lui $t1,100
        addu   $28,$28,$25
        addiu  $28,$28,-100
        sd      $4,16($fp)
        move    $2,$5
        sll     $2,$2,0
        sw      $2,24($fp)
        sw      $0,0($fp)
        b       .L19
        nop

.L20:
        lw      $2,0($fp)
        sll    $2,$2,2
        ld      $3,16($fp)
        addu   $2,$3,$2
        lwc1    $f0,0($2)
        cvt.d.s $f0,$f0
        dmfc1   $5,$f0
        d       $t1,-100($t2)
        addiu   $t1,$t2,-100
        ld      $t1,-100($t2)
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
        ld      $t1,-100($t2)
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

Index:
        addiu  $sp,$sp,-48
        sd      $fp,40($sp)
        move    $fp,$sp
        lui     $t1,100
        addu   $3,$3,$25
        addiu   $t1,$t2,-100
        swc1    $f12,16($fp)
        move    $2,$5
        sll     $2,$2,0
        sw      $2,20($fp)
        ld      $t1,-100($t2)
        lwc1    $f0,0($2)
        lwc1    $f1,16($fp)
        sub.s   $f1,$f1,$f0
        ld      $t1,-100($t2)
        lwc1    $f2,0($2)
        ld      $t1,-100($t2)
        lwc1    $f0,0($2)
        sub.s   $f0,$f2,$f0
        div.s   $f1,$f1,$f0
        lw      $2,20($fp)
        mtc1    $2,$f0
        cvt.s.w $f0,$f0
        mul.s   $f0,$f1,$f0
        trunc.w.s $f0,$f0
        mfc1    $2,$f0
        sw      $2,0($fp)
        lw      $2,0($fp)
        blez    $2,.L22
        nop

        lw      $2,0($fp)
        addiu   $2,$2,-1
        b       .L23
        nop

.L22:
        move    $2,$0
.L23:
        move    $sp,$fp
        ld      $fp,40($sp)
        addiu  $sp,$sp,48
        j       $31
        nop

BucketSort:
        addiu  $sp,$sp,-112
        sd      $31,104($sp)
        sd      $fp,96($sp)
        sd      $28,88($sp)
        sd      $16,80($sp)
        move    $fp,$sp
        lui     $t1,100
        addu   $28,$28,$25
        addiu   $t1,$t2,-100
        sd      $4,64($fp)
        move    $3,$5
        move    $2,$6
        sll     $3,$3,0
        sw      $3,72($fp)
        sll     $2,$2,0
        sw      $2,76($fp)
        lw      $2,76($fp)
        sll    $2,$2,3
        move    $4,$2
        ld      $t1,-100($t2)
        move    $25,$2
        nop

        sd      $2,32($fp)
        sw      $0,0($fp)
        b       .L25
        nop

.L26:
        lw      $2,0($fp)
        sll    $2,$2,3
        ld      $3,32($fp)
        addu   $2,$3,$2
        sd      $0,0($2)
        lw      $2,0($fp)
        addiu   $2,$2,1
        sw      $2,0($fp)
.L25:
        lw      $3,0($fp)
        lw      $2,76($fp)
        slt     $2,$3,$2
        bne     $2,$0,.L26
        nop

        sw      $0,4($fp)
        b       .L27
        nop

.L28:
        li      $4,16                 # 0x10
        ld $t1,-100($t2)
        move    $25,$2
        nop

        sd      $2,40($fp)
        lw      $2,4($fp)
        sll    $2,$2,2
        ld      $3,64($fp)
        addu   $2,$3,$2
        lwc1    $f0,0($2)
        lw      $2,76($fp)
        move    $5,$2
        mov.s   $f12,$f0
        ld $t1,-100($t2)
        move    $25,$2
        nop

        sw      $2,48($fp)
        lw      $2,4($fp)
        sll    $2,$2,2
        ld      $3,64($fp)
        addu   $2,$3,$2
        lwc1    $f0,0($2)
        ld      $2,40($fp)
        swc1    $f0,0($2)
        lw      $2,48($fp)
        sll    $2,$2,3
        ld      $3,32($fp)
        addu   $2,$3,$2
        ld      $3,0($2)
        ld      $2,40($fp)
        sd      $3,8($2)
        lw      $2,48($fp)
        sll    $2,$2,3
        ld      $3,32($fp)
        addu   $2,$3,$2
        ld      $3,40($fp)
        sd      $3,0($2)
        lw      $2,4($fp)
        addiu   $2,$2,1
        sw      $2,4($fp)
.L27:
        lw      $3,4($fp)
        lw      $2,72($fp)
        slt     $2,$3,$2
        bne     $2,$0,.L28
        nop

        sw      $0,8($fp)
        b       .L29
        nop

.L30:
        lw      $2,8($fp)
        sll    $2,$2,3
        ld      $3,32($fp)
        addu   $16,$3,$2
        lw      $2,8($fp)
        sll    $2,$2,3
        ld      $3,32($fp)
        addu   $2,$3,$2
        ld      $2,0($2)
        move    $4,$2
        ld $t1,-100($t2)
        move    $25,$2
        nop

        sd      $2,0($16)
        lw      $2,8($fp)
        addiu   $2,$2,1
        sw      $2,8($fp)
.L29:
        lw      $3,8($fp)
        lw      $2,76($fp)
        slt     $2,$3,$2
        bne     $2,$0,.L30
        nop

        sw      $0,12($fp)
        sw      $0,16($fp)
        b       .L31
        nop

.L34:
        lw      $2,16($fp)
        sll    $2,$2,3
        ld      $3,32($fp)
        addu   $2,$3,$2
        ld      $2,0($2)
        sd      $2,24($fp)
        b       .L32
        nop

.L33:
        lw      $2,12($fp)
        addiu   $3,$2,1
        sw      $3,12($fp)
        sll    $2,$2,2
        ld      $3,64($fp)
        addu   $2,$3,$2
        ld      $3,24($fp)
        lwc1    $f0,0($3)
        swc1    $f0,0($2)
        ld      $2,24($fp)
        ld      $2,8($2)
        sd      $2,24($fp)
.L32:
        ld      $2,24($fp)
        bne     $2,$0,.L33
        nop

        lw      $2,16($fp)
        addiu   $2,$2,1
        sw      $2,16($fp)
.L31:
        lw      $3,16($fp)
        lw      $2,76($fp)
        slt     $2,$3,$2
        bne     $2,$0,.L34
        nop

        nop
        move    $sp,$fp
        ld      $31,104($sp)
        ld      $fp,96($sp)
        ld      $28,88($sp)
        ld      $16,80($sp)
        addiu  $sp,$sp,112
        j       $31
        nop

max:
        addiu  $sp,$sp,-48
        sd      $fp,40($sp)
        move    $fp,$sp
        lui $t1,100
        addu   $6,$6,$25
        addiu  $t1,$t2,-100
        sd      $4,16($fp)
        move    $2,$5
        sll     $2,$2,0
        sw      $2,24($fp)
        ld      $t1,-100($t2)
        lwc1 $f1,-100($t2)
        swc1    $f0,0($fp)
        sw      $0,4($fp)
        b       .L37
        nop

.L40:
        lw      $2,4($fp)
        sll    $2,$2,2
        ld      $3,16($fp)
        addu   $2,$3,$2
        lwc1    $f1,0($2)
        lwc1    $f0,0($fp)
        c.lt.s  $f0,$f1
        bc1f    .L38
        nop

        lw      $2,4($fp)
        sll    $2,$2,2
        ld      $3,16($fp)
        addu   $2,$3,$2
        lwc1    $f0,0($2)
        swc1    $f0,0($fp)
.L38:
        lw      $2,4($fp)
        addiu   $2,$2,1
        sw      $2,4($fp)
.L37:
        lw      $3,4($fp)
        lw      $2,24($fp)
        slt     $2,$3,$2
        bne     $2,$0,.L40
        nop

        lwc1    $f0,0($fp)
        move    $sp,$fp
        ld      $fp,40($sp)
        addiu  $sp,$sp,48
        j       $31
        nop

min:
        addiu  $sp,$sp,-48
        sd      $fp,40($sp)
        move    $fp,$sp
        lui $t1,100
        addu   $6,$6,$25
        addiu $t1,$t2,-100
        sd      $4,16($fp)
        move    $2,$5
        sll     $2,$2,0
        sw      $2,24($fp)
        ld $t1,-100($t2)
        lwc1 $f1,-100($t2)
        swc1    $f0,0($fp)
        sw      $0,4($fp)
        b       .L44
        nop

.L47:
        lw      $2,4($fp)
        sll    $2,$2,2
        ld      $3,16($fp)
        addu   $2,$3,$2
        lwc1    $f1,0($2)
        lwc1    $f0,0($fp)
        c.lt.s  $f1,$f0
        bc1f    .L45
        nop

        lw      $2,4($fp)
        sll    $2,$2,2
        ld      $3,16($fp)
        addu   $2,$3,$2
        lwc1    $f0,0($2)
        swc1    $f0,0($fp)
.L45:
        lw      $2,4($fp)
        addiu   $2,$2,1
        sw      $2,4($fp)
.L44:
        lw      $3,4($fp)
        lw      $2,24($fp)
        slt     $2,$3,$2
        bne     $2,$0,.L47
        nop

        lwc1    $f0,0($fp)
        move    $sp,$fp
        ld      $fp,40($sp)
        addiu  $sp,$sp,48
        j       $31
        nop

.LC3:
        .ascii  "Enter No of Flaoting Point No: \000"
.LC4:
        .ascii  "%d\000"
.LC5:
        .ascii  "Enter No. of Buckets(n): \000"
.LC6:
        .ascii  "%f\000"
.LC7:
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
        lui $t1,100
        addu   $28,$28,$25
        addiu $t1,$t2,-100
        move    $2,$sp
        sd      $2,32($fp)
        ld $t1,-100($t2)
        addiu $t1,$t2,-100
        ld $t1,-100($t2)
        move    $25,$2
        nop

        addiu  $2,$fp,24
        move    $5,$2
        ld $t1,-100($t2)
        addiu  $4,$2,%got_ofst(.LC4)
        ld      $2,%call16(__isoc99_scanf)($28)
        move    $25,$2
        nop

        ld      $2,%got_page(.LC5)($28)
        addiu  $4,$2,%got_ofst(.LC5)
        ld      $2,%call16(puts)($28)
        move    $25,$2
        nop

        addiu  $2,$fp,28
        move    $5,$2
        ld      $2,%got_page(.LC4)($28)
        addiu  $4,$2,%got_ofst(.LC4)
        ld      $2,%call16(__isoc99_scanf)($28)
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
        sll    $18,$22,5
        or      $18,$3,$18
        sll    $19,$23,5
        move    $3,$2
        move    $21,$3
        move    $20,$0
        dsrl    $3,$21,59
        sll    $16,$20,5
        or      $16,$3,$16
        sll    $17,$21,5
        sll    $2,$2,2
        addiu  $2,$2,3
        addiu  $2,$2,15
        dsrl    $2,$2,4
        sll    $2,$2,4
        dsubu   $sp,$sp,$2
        move    $2,$sp
        addiu  $2,$2,3
        dsrl    $2,$2,2
        sll    $2,$2,2
        sd      $2,16($fp)
        sw      $0,0($fp)
        b       .L51
        nop

.L52:
        lw      $2,0($fp)
        sll    $2,$2,2
        ld      $3,16($fp)
        addu   $2,$3,$2
        move    $5,$2
        ld      $2,%got_page(.LC6)($28)
        addiu  $4,$2,%got_ofst(.LC6)
        ld      $2,%call16(__isoc99_scanf)($28)
        move    $25,$2
        nop

        lw      $2,0($fp)
        addiu   $2,$2,1
        sw      $2,0($fp)
.L51:
        lw      $2,24($fp)
        lw      $3,0($fp)
        slt     $2,$3,$2
        bne     $2,$0,.L52
        nop

        ld      $2,16($fp)
        lw      $3,24($fp)
        move    $5,$3
        move    $4,$2
        ld      $2,%got_disp(max)($28)
        move    $25,$2
        nop

        ld      $2,%got_disp(Max_arr)($28)
        swc1    $f0,0($2)
        ld      $2,16($fp)
        lw      $3,24($fp)
        move    $5,$3
        move    $4,$2
        ld      $2,%got_disp(min)($28)
        move    $25,$2
        nop

        ld      $2,%got_disp(Min_arr)($28)
        swc1    $f0,0($2)
        ld      $2,16($fp)
        lw      $3,24($fp)
        lw      $4,28($fp)
        move    $6,$4
        move    $5,$3
        move    $4,$2
        ld      $2,%got_disp(BucketSort)($28)
        move    $25,$2
        nop

        ld      $2,%got_page(.LC7)($28)
        addiu  $4,$2,%got_ofst(.LC7)
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
        .word   3212836864
.LC2:
        .word   1594541859