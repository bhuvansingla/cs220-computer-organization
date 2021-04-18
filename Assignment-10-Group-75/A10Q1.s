                .data
array:		    .space 48
msg_entern:	    .asciiz "Enter n: "
msg_number:	    .asciiz "\nInput number: "
msg_search:	    .asciiz "\nEnter number to search: "
msg_found:      .asciiz "\nFound element at index "
msg_notfound:   .asciiz "\nElement was not found"

                .text
                .globl main
main:           li $v0,4
                la $a0,msg_entern
                syscall
                li $v0,5
                syscall
                add $s0,$v0,$0
                add $t0,$s0,$0
                la $s1,array
                add $t1,$s1,$0

loop:           li $v0,4
                la $a0,msg_number
                syscall
                li $v0,5
                syscall
                sw $v0,0($t1)
                bne $t0,$s0,continue
                addi $t7,$v0,0

continue:       addi $t1,$t1,4
                addi $t0,$t0,-1
                bne $t0,$0,loop
                li $v0,4
                la $a0,msg_search
                syscall
                li $v0,5
                syscall
                add $s2,$v0,$0
                add $a0,$s1,$0
                add $a1,$0,$0
                addi $a2,$s0,0
                addi $a3,$s2,0
                slt $t7,$a3,$t7
                beq $t7,1,notfound
                addi $sp,$sp,-4
                sw $ra,0($sp)
                jal binarysearch
                lw $ra,0($sp)
                addi $sp,$sp,4
                add $a3,$v0,$0
                bne $a3,-1,found

notfound:       addi $v0,$0,4
                la $a0,msg_notfound
                syscall
                j jump

found:          addi $v0,$0,4
                la $a0,msg_found
                syscall
                addi $a0,$a3,0
                addi $v0,$0,1
                syscall

jump:           jr $ra

binarysearch:   sltu $t0,$a2,$a1
                beq $t0,$0,dontreturn
                addi $v0,$0,-1
                jr $ra

dontreturn:     add $t0,$a1,$a2
                srl $t0,$t0,1
                sll $t1,$t0,2
                add $t1,$a0,$t1
                lw $t1,0($t1)
                bne $t1,$a3,not_equal
                add $v0,$t0,$0
                jr $ra

not_equal:      sltu $t1,$a3,$t1
                beq $t1,$0,right
                addi $sp,$sp,-4
                sw $ra,0($sp)
                addi $a2,$t0,-1
                jal binarysearch
                lw $ra,0($sp)
                addi $sp,$sp,4
                addi $v0,$v0,0
                jr $ra
                
right:          addi $sp,$sp,-4
                sw $ra,0($sp)
                addi $a1,$t0,1
                jal binarysearch
                lw $ra,0($sp)
                addi $sp,$sp,4
                addi $v0,$v0,0
                jr $ra