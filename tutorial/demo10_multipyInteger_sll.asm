### multiply Integer sll

.data

.text
	addi $s0, $zero, 5
	
	# shift left logical
	sll $t0, $s0, 3 # $s0 * 2^3
	
	# print it
	li $v0, 1
	add $a0, $zero, $t0 # 40
	syscall
	
	
