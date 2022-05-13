# arrays

.data
	myArray: .space 12
.text
	addi $s0, $zero, 1
	addi $s1, $zero, 2
	addi $s2, $zero, 10
	
	# Index $t0 = 0
	addi $t0, $zero, 0
	
	# store the values to array
	sw $s0, myArray($t0)
	
	addi $t0, $t0, 4
	sw $s1, myArray($t0)
	
	addi $t0, $t0, 4
	sw $s2, myArray($t0)
	
	# load the values form array
	addi $t1, $t0, -4
	lw $t2, myArray($zero)
	lw $t3, myArray($t1)
	lw $t4, myArray($t0)
	
	
	# print the values
	li $v0, 1
	addi $a0, $t2, 0
	syscall
	
	li $v0, 1
	addi $a0, $t3, 0
	syscall
	
	li $v0, 1
	addi $a0, $t4, 0
	syscall
	
	
	
	