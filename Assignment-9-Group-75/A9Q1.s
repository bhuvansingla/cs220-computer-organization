.data
input_msg:  .asciiz "Enter n: "
comma:      .asciiz ", "
.text 
.globl main 
fib:        move $t1,$0
            move $t2,$sp
            li $t3,1
            addi $sp,$sp,-4
            sw $t0,0($sp)
rec:        beq $sp,$t2,fib_exit
            lw $t4,0($sp) 
            addi $sp,$sp,4
            bleu $t4,$t3,rec_return
            sub $t4,$t4,1
            addi $sp,$sp,-4
            sw $t4,0($sp)
            sub $t4,$t4,1
            addi $sp,$sp,-4
            sw $t4,0($sp)
            j rec
rec_return: add $t1,$t1,$t4 
            j rec
fib_exit:   jr $ra
main:       li $v0,4 
            la $a0,input_msg
            syscall
            li $v0,5
            syscall 
            addi $t5,$v0,0 
            addi $t5,$t5,1
            move $t0,$0
loop:       beq $t0,$t5,exit 
            jal fib
            beq $t0,$0,go
            jal print 
go:         addi $t0,$t0,1
            j loop
print:      li $v0,1
            addi $a0,$t1,0
            syscall
            addi $t6,$t5,-1
            beq $t6,$t0,label
            li $v0,4 
            la $a0,comma
            syscall
label:      jr $ra
exit:       li $v0,10
            syscall 
