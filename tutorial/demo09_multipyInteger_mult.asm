### multiply Integer mult

.data

.text
	addi $t0, $zero, 2000  # t0 = 0 + 2000
	addi $t1, $zero, 10    # t1 = 0 + 10
	
	# the product stored in hi & lo Register
	mult  $t0, $t1 
	
	# move the product form lo, bez the product not so big, stored only in lo Register
	mflo $s0
	mfhi $s1
	
	# display the product to the screen
	li $v0, 1   # print out integer
	
	add $a0, $zero, $s0
	add $a1, $zero, $s1
	
	syscall
	