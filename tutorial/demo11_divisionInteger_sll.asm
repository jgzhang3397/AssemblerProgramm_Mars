### dividing Integer

.data

.text
	addi $s0, $zero, 30
	addi $s1, $zero, 8
	
	#method 1
	#div  $t0, $s0, $s1
	
	#method 2
	#div $t0, $s0, 2
	
	#method 3 
	div $s0, $s1
	mflo $t0 # Quatient
	mfhi $t1 # Remainder
	
	#print it
	li $v0, 1
	add $a0, $zero, $t1
	syscall
	
	
