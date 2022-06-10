computestep:
#SOLUTION_START
	# Save all used regs
	addi $sp, $sp, -32
	sw $ra, 4($sp)
	sw $a0, 8($sp)
	sw $a1, 12($sp)
	sw $a2, 24($sp)
	sw $a3, 28($sp)
	sw $s0, 16($sp) # abssquare
	sw $s1, 20($sp) # xtmp

	# compute abssquare
	addi $a1, $a0, 0
	jal fixedmul
	addi $s0, $v0, 0
	lw $a0, 12($sp)
	addi $a1, $a0, 0
	jal fixedmul
	add $s0, $s0, $v0

	# check z!=50
	lw $t2,32($sp)
	addi $t1, $0, 50
	bne $t1, $t2, chkabs
retzero:
	addi $v0,$0,0
	b maxdepthreached

chkabs: addi $t0, $0, 4
	sll $t0, $t0, 25
	slt $t1, $t0, $s0
	bne $t1, $0, retzero

	# x*x
	lw $a0, 8($sp)
	lw $a1, 8($sp)
	jal fixedmul
	addi $s1, $v0, 0
	
	# x*x - y*y + x0
	lw $a0, 12($sp)
	lw $a1, 12($sp)
	jal fixedmul
	lw $a2, 24($sp)
	sub $t1, $s1, $v0
	add $s1, $t1, $a2

	# x*y
	lw $a0, 8($sp)
	lw $a1, 12($sp)
	jal fixedmul
	addi $a1, $v0, 0
	
	# 2<<28 * x*y
	addi $a0, $0, 2
	sll, $a0, $a0, 25
	jal fixedmul

	lw $a2, 24($sp)
	lw $a3, 28($sp)
	# $a1=(2<<28 * x*y) + y0
	add $a1, $v0, $a3
	addi $a0, $s1, 0

	# pass arg5 to computestep
	lw $t2,32($sp)
	addi $t2, $t2, 1
	sw $t2, 0($sp)
	jal computestep
	addi $v0,$v0,1

maxdepthreachedp:
	lw $s0, 16($sp)
	lw $s1, 20($sp)
	lw $ra, 4($sp)
	addi $sp,$sp,32
#SOLUTION_END
	jr $ra
