.data
	
.text 
.globl main

poly:
	mul 	$t0, $s3, $s3 # x * x
	mul	$t0, $t0, $s2 # a2 * x * x
	mul	$t1, $s1, $s3 # a1 * x
	add 	$t2, $t1, $t0 # a2 * x * x + a1 * x
	add	$v0, $t2, $s0 # a2 * x * x + a1 * x + a0
	
	jr	$ra
main:
	addi 	$sp, $sp,  -4
	sw	$ra, 0($sp)
	
	addi 	$a0, $zero, 0
	
	addi	$s0, $zero, 4
	addi	$s1, $zero, 2
	addi	$s2, $zero, 5
	addi	$s3, $zero, 23
	
	jal	poly
	
	move 	$a0, $v0
	
	lw	$ra, 0($sp)
	addi 	$sp, $sp, 4
	
	li 	$v0, 1
	add 	$a0, $a0, $zero
	syscall
	
		
li $v0, 10
syscall	
	
	
	