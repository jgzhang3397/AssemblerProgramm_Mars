# dividing Integer

.data
	newline: .asciiz "\n"
.text
	addi $s0, $zero, 30
	addi $s1, $zero, 8
	
	# method 1
	# div $t0, $s0, $s1
	
	# method 2
	# div $t0, $s0, 2
	
	# method 3 
	div $s0, $s1
	mflo $t0 # Quatient
	mfhi $t1 # Remainder
	
	# print Quatient
	li  $v0, 1
	add $a0, $zero, $t0
	syscall
	
	# print newline
	li  $v0, 4
	la  $a0, newline
	syscall
	
	# print Remainder
	li  $v0, 1
	add $a0, $zero, $t1
	syscall
	
	
