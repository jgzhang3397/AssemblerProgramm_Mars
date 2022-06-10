rotateLeft60X:

#SOLUTION_START
	li $t0, 227023
	mul $t0, $a1, $t0
	sra $t0, $t0, 17
	add $v0, $a0, $t0
	sra $v0, $v0, 1

#SOLUTION_END
	jr $ra 

rotateLeft60Y:

#SOLUTION_START
	li $t0, 227023
	mul $t0, $a0, $t0
	sra $t0, $t0, 17
	sub $v0, $a1, $t0
	sra $v0, $v0, 1

#SOLUTION_END
	jr $ra

kochLine:

#SOLUTION_START
	lw $t0, 0($sp)
	# Tail Call
	beqz $t0, bresenham
	addi $sp, $sp, -36
	sw $ra, 0($sp)
	sw $s0, 4($sp)
	sw $s1, 8($sp)
	sw $s2, 12($sp)
	sw $s3, 16($sp)
	sw $s4, 20($sp)
	sw $s5, 24($sp)
	sw $s6, 28($sp)
	sw $s7, 32($sp)
	addi $sp, $sp, -4
	addi $t0, $t0, -1
	sw $t0, 0($sp)
	
	addi $s0, $a0, 0 #x0
	addi $s1, $a1, 0 #y0
	addi $s2, $a2, 0 #x1
	addi $s3, $a3, 0 #y1
	
	sub $t0, $a2, $a0
	addi $t1, $0, 3
	div $t0, $t1
	mflo $s4 # delta X
	
	
	sub $t0, $a3, $a1
	addi $t1, $0, 3
	div $t0, $t1
	mflo $s5 # delta Y
	
	addi $a0, $s0, 0
	addi $a1, $s1, 0
	add $a2, $s0, $s4
	add $a3, $s1, $s5
	jal kochLine
	
	
	
	addi $a0, $s4, 0
	addi $a1, $s5, 0
	jal rotateLeft60X
	addi $s6, $v0, 0 # rotX
	
	addi $a0, $s4, 0
	addi $a1, $s5, 0
	jal rotateLeft60Y
	addi $s7, $v0, 0 # rotY
	
	add $s6, $s6, $s0
	add $s6, $s4, $s6 #topX
	add $s7, $s7, $s1
	add $s7, $s5, $s7 #topY
	
	add $a0, $s0, $s4
	add $a1, $s1, $s5
	addi $a2, $s6, 0
	addi $a3, $s7, 0
	jal kochLine
	
	addi $a0, $s6, 0
	addi $a1, $s7, 0
	add $t0, $s4, $s4
	add $a2, $s0, $t0
	add $t0, $s5, $s5
	add $a3, $s1, $t0
	jal kochLine
	
	
	
	add $t0, $s4, $s4
	add $a0, $s0, $t0
	add $t0, $s5, $s5
	add $a1, $s1, $t0
	addi $a2, $s2, 0
	addi $a3, $s3, 0
	jal kochLine
	
	
	addi $sp, $sp, 4
	lw $ra, 0($sp)
	lw $s0, 4($sp)
	lw $s1, 8($sp)
	lw $s2, 12($sp)
	lw $s3, 16($sp)
	lw $s4, 20($sp)
	lw $s5, 24($sp)
	lw $s6, 28($sp)
	lw $s7, 32($sp)
	addi $sp, $sp, 36

#SOLUTION_END
	jr $ra
