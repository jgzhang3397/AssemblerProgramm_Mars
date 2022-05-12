# subtractInteger

.data
	num1: .word 20
	num2: .word 8
.text
	lw $s0, num1 # num1 = 20
	lw $s1, num2 # num2 = 8
	
	sub $t0, $s0, $s1 # t0 = num1 - num2
	
	li $v0, 1 # print out integer 
	
	move $a0, $t0 # a0 == t0
	
	syscall