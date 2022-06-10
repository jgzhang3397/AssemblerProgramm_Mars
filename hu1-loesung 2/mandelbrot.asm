mandelbrot:
#SOLUTION_START
	addi $sp,$sp, -16
	sw $s0, 4($sp) # i
	sw $s1, 8($sp) # j
	sw $ra, 12($sp)

	addi $s0, $0, 0
	addi $s1, $0, 0

	
replines:
	# Set blue pixel
	addi $a0, $0, 255
	jal setColor
	addi $a0, $s0, 0
	addi $a1, $s1, 0
	jal setPixel
	
	# Compute x0
	addi $t0, $0, 3
	sll $t0, $t0, 17
	mul $t0, $s0, $t0
	addi $t1, $0, WIDTH
	div $t0, $t1
	mflo $t0
	sll $t0, $t0, 8
	addi $t1, $0, -2
	sll $t1, $t1, 25
	add $a2, $t1, $t0

	# Compute y0
	addi $t0, $0, 2
	sll $t0, $t0, 17
	mul $t0, $s1, $t0
	addi $t1, $0, HEIGHT
	div $t0, $t1
	mflo $t0
	sll $t0, $t0, 8
	addi $t1, $0, -1
	sll $t1, $t1, 25
	add $a3, $t1, $t0

	# Init remaining params
	sw $0,0($sp) # z
	addi, $a0, $0 ,0
	addi, $a1, $0 ,0

	jal computestep
	addi $a0, $v0, 0
	jal lookupcolor
	addi $a0, $v0, 0
	jal setColor
	addi $a0, $s0, 0
	addi $a1, $s1, 0
	jal setPixel

	# Increment i
	addi $s0, $s0, 1
	
	addi $t0, $0, WIDTH
	slt $t0, $s0, $t0
	bne $t0, $0, replines

	# Increment j, reset i
	addi $s0, $0, 0
	addi $s1, $s1, 1

	addi $t0, $0, HEIGHT
	slt $t0, $s1, $t0
	bne $t0, $0, replines

	lw $s0, 4($sp)
	lw $s1, 8($sp)
	lw $ra 12($sp)
	addi $sp, $sp, 16
#SOLUTION_END
	jr $ra
