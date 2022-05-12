### getting users inputs double

.data
	prompt: .asciiz "Enter the value of e:"
.text
	#display the prompt
	li $v0, 4
	la $a0, prompt
	syscall
	
	#read the input
	li $v0, 7 # 7 the code for double
	syscall
	
	#display the double input
	li 	$v0, 3
	# $f12: argument Register,
	# $f0: 0.0 , 
	# $f2: any empty Register not used default value == 0.0
	add.d 	$f12, $f0, $f2
	syscall
	


	
	