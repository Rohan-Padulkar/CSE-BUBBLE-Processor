.data
BUCKCAP: .word 10
newline: .asciiz "\n"
space: .asciiz " "
format: .asciiz "%f"
prompt_p: .asciiz "Enter No. of Floating Point Integers(p):"
prompt_n: .asciiz "\nEnter No. of Buckets(n):"
initial_array: .asciiz "\nInitial array: "
sorted_array: .asciiz "\nSorted array: "
tmp: .float 0.0

.text
.globl main

# Inserts a node into a sorted linked list
# Sorts the linked list in ascending order
InsertSort:
  addi $sp, $sp, -16
  sw $ra, 0($sp)
  sw $s0, 4($sp)
  sw $s1, 8($sp)
  move $s0, $a0    # $s0 points to the head of the linked list
  li $t0, 0        # $t0 = 0
  lw $s1, ($s0)    # $s1 = $s0->next
  move $s0, $a0    # $s0 points to the head of the linked list
  sw $zero, ($s0)  # $s0->next = NULL
loop:
  beq $s1, $zero, exit # if $s1 is NULL, exit loop
  lw $t1, ($s1)    # $t1 = $s1->data
  bge $t1, $s0->data, next # if $t1 >= $s0->data, go to next iteration
  lw $t2, ($s1)    # $t2 = $s1->data
  sw $s0, ($s1)    # $s1->next = $s0
  sw $t1, ($s0)    # $s0->data = $t1
  sw $t2, ($s1)    # $s1->data = $t2
  move $s0, $s1    # $s0 = $s1
  lw $s1, ($s1)    # $s1 = $s1->next
  j loop
next:
  move $s0, $s1    # $s0 = $s1
  lw $s1, ($s1)    # $s1 = $s1->next
  b loop
exit:
  lw $ra, 0($sp)
  lw $s0, 4($sp)
  lw $s1, 8($sp)
  addi $sp, $sp, 16
  jr $ra

# Prints the contents of an array
# Input:
#   $a0 - the address of the array
#   $a1 - the size of the array
print:
  addi $sp, $sp, -8
  sw $ra, 0($sp)
  sw $s0, 4($sp)
  li $v0, 4
  la $a0, initial_array
  syscall
  li $v0, 1
  li $s0, 0
loop:
  bge $s0, $a1, exit
  lw $f12, ($a0)
  li $v0, 2
  syscall
  li $v0, 4
  la $a
