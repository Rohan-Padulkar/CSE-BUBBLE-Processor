.data
    BUCKCAP: .word 10       # Bucket capacity
    nl:     .asciiz "\n"
    arr:    .space 100     # Array of floating point numbers

.text
    # InsertSort function
    InsertSort:
        addi $sp, $sp, -8       # Create stack frame for function call
        sw $ra, 4($sp)          # Save return address

        move $t1, $a0           # t1 = list
        beq $t1, $zero, IS_Exit # if (list == 0)
        lw $t2, ($t1)           # t2 = list->next
        beq $t2, $zero, IS_Exit # if (list->next == 0)

        move $t0, $t1           # t0 = nodeList
        move $t1, $t2           # t1 = k
        move $t0, $zero         # nodeList->next = 0
        IS_Loop:
            lw $t2, ($t1)           # t2 = k->next
            beq $t2, $zero, IS_Last  # if (k->next == 0)

            move $t4, $t0           # ptr = nodeList
            move $t3, $t1           # t3 = k
            IS_CmpLoop:
                lwc1 $f0, ($t4)          # f0 = ptr->data
                lwc1 $f2, ($t3)          # f2 = k->data
                c.lt.s $f0, $f2          # if (ptr->data > k->data)
                bc1t IS_CmpTrue          # then goto IS_CmpTrue
                nop

                move $t4, $t4          # ptr = ptr->next
                j IS_CmpLoop             # Goto IS_CmpLoop
                nop

            IS_CmpTrue:
                move $t3, $t1           # tmp = k
                move $t1, $t2           # k = k->next
                move $t3, $t3          # tmp->next = nodeList
                move $t0, $t3           # nodeList = tmp
                j IS_Loop               # Goto IS_Loop
                nop

            IS_Last:
                move $t4, $t0           # ptr = nodeList
                IS_CmpLoop2:
                    lwc1 $f0, ($t4)      # f0 = ptr->data
                    lwc1 $f2, ($t1)      # f2 = k->data
                    c.lt.s $f0, $f2      # if (ptr->next->data > k->data)
                    bc1t IS_CmpTrue2     # then goto IS_CmpTrue2
                    nop

                    move $t4, $t4      # ptr = ptr->next
                    j IS_CmpLoop2        # Goto IS_CmpLoop2
                    nop

                IS_CmpTrue2:
                    move $t3, $t1           # tmp = k
                    move $t1, $t2           # k = k->next
                    move $t3, $t3          # tmp->next = ptr->next
                    move $t4, $t3           # ptr->next = tmp
                    j IS_Loop               # Goto IS_Loop
