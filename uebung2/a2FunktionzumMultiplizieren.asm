.data 
	# globale Variante z
	z: .word 0
.text
	main:
		# int x = 5, y = 6;
		addi 	$a1, $zero, 5
		addi 	$a2, $zero, 6
		
		# call the function
		jal 	multi
		
		# z = z+x+y
		add 	$v0, $v1, $a1
		add 	$v0, $v0, $a2
		
		lw  	$v1, z 
		move  	$v1, $v0
		
		# print z on screen
		li  $v0, 1
		add $a0, $zero, $v1
		syscall 
	# end the program
	li $v0, 10
	syscall
	
	multi:
		mul $v1, $a1, $a2
		jr  $ra
		
		
		
