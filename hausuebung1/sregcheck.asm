.macro sregcheck_save ()
addi $sp, $sp, -32
sw $s0, 0($sp)
sw $s1, 4($sp)
sw $s2, 8($sp)
sw $s3, 12($sp)
sw $s4, 16($sp)
sw $s5, 20($sp)
sw $s6, 24($sp)
sw $s7, 28($sp)
.end_macro

.macro sregcheck_cmpone(%o, %x)
lw $t1, %o($sp)
seq $t1, $t1, %x
and $t0, $t0, $t1

.end_macro

.data
sregfail: .asciiz "s-registers are changed or stack is corrupted!\n"

.macro sregcheck_compare ()

addi $t0, $0, 1
sregcheck_cmpone(0, $s0)
sregcheck_cmpone(4, $s1)
sregcheck_cmpone(8, $s2)
sregcheck_cmpone(12, $s3)
sregcheck_cmpone(16, $s4)
sregcheck_cmpone(20, $s5)
sregcheck_cmpone(24, $s6)
sregcheck_cmpone(28, $s7)
addi $sp, $sp, 32

bnez $t0, afteroutput

la $a0, sregfail
addi $v0, $0, 4
syscall


afteroutput:

.end_macro
