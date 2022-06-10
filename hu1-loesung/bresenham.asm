abs:
#SOLUTION_START
	abs $v0, $a0
#SOLUTION_END
	jr $ra

bresenham:
#SOLUTION_START
	addi $sp, $sp, -40
	sw $s0, 0($sp)
	sw $s1, 4($sp)
	sw $s2, 8($sp)
	sw $s3, 12($sp)
	sw $s4, 16($sp)
	sw $s5, 20($sp)
	sw $s6, 24($sp)
	sw $s7, 28($sp)
	sw $ra, 32($sp)
	
	addi $s0, $a0, 0 # x0
	addi $s1, $a1, 0 # y0
	addi $s2, $a2, 0 # x1
	addi $s3, $a3, 0 # y1
	
	sub $a0, $s2, $s0
	jal abs
	addi $s4, $v0, 0 # dx
	slt $s5, $s0, $s2 # sx
	sll $s5, $s5, 1
	addi $s5, $s5, -1
	sub $a0, $s3, $s1
	jal abs
	sub $s6, $0, $v0 #dy
	slt $s7, $s1, $s3 #sy
	sll $s7, $s7, 1
	addi $s7, $s7, -1
	add $t0, $s4, $s6 #err
	
	
	bresenham_loop:
		sw $t0, 36($sp)
		addi $a0, $s0, 0
		addi $a1, $s1, 0
		jal setPixel
		lw $t0, 36($sp)
		
		
		seq $t1, $s0, $s2
		seq $t2, $s1, $s3
		and $t1, $t1, $t2
		bnez $t1, bresenham_afterloop
		
		add $t1, $t0, $t0 #e2
		
		sle $t2, $t1, $s6
		bnez $t2, bresenham_afterif1
		
		add $t0, $t0, $s6
		add $s0, $s0, $s5
		
		bresenham_afterif1:
		slt $t2, $t1, $s4
		beqz $t2, bresenham_loop
		
		
		
		add $t0, $t0, $s4
		add $s1, $s1, $s7
		
		
		
	
		b bresenham_loop
	bresenham_afterloop:
	
	lw $s0, 0($sp)
	lw $s1, 4($sp)
	lw $s2, 8($sp)
	lw $s3, 12($sp)
	lw $s4, 16($sp)
	lw $s5, 20($sp)
	lw $s6, 24($sp)
	lw $s7, 28($sp)
	lw $ra, 32($sp)
	addi $sp, $sp, 40

#SOLUTION_END
	jr $ra
