# multiply Integer mul

.data

.text
	addi $s0, $zero, 10  # s0 = 0 + 10
	addi $s1, $zero, 20  # s1 = 0 + 20
	
	mul $t0, $s0, $s1    # t0 = s0 * s1
	
	
	# display the product
	li $v0, 1   # print out integer
	
	add $a0, $zero, $t0
	
	syscall
	