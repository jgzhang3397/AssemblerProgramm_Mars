### multiply Integer sll

.data

.text
	addi $s0, $zero, 4
	
	# shift left logical
	sll $t0, $s0, 2
	
	# print it
	li $v0, 1
	add $a0, $zero, $t0
	syscall
	
	
