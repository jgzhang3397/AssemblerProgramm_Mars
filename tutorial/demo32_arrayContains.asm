.data

	arr: 	.word 1
		.word 2
		.word 3
		.word 4
		.word 5
		.word 6
.text
.globl main

contains:
	sll $a1, $a1, 2
	add $a1, $a1, $a0 # $a1 is first address of the arrays
loop:
	beq  $a0, $a1, false
	lw   $t0, 0($a0)
	addi $a0, $a0, 4
	beq  $t0, $a2, true
	b    loop

true:
	addi $v0, $zero, 1
	jr   $ra

false:
	addi $v0, $zero, 0
	jr   $ra
	
main:
	lui  $a0, arr
	ori  $a0, $a0, arr
	addi $a1, $0, 4
	addi $a2, $0, 5
	jal  contains
	nop
	nop