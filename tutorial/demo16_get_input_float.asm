### getting users inputs float

.data
	message: 	.asciiz "enter the value of PI: "
	zeroAsFloat: 	.float 0.0 # make own default for zero register
.text

	lwc1 $f4, zeroAsFloat # $f4 == 0.0
	
	# show the message on the screen
	li $v0, 4
	la $a0, message
	syscall
	
	# read users input, the input been returned to $f0
	li $v0, 6 # 6 is the code to read the float
	syscall
	
	# display the input
	li 	$v0, 	2 # 2 the code to display the float
	# add $f0 = input & $f4 == 0.0 then been stored in $f12
	add.s 	$f12, 	$f0, $f4 # $f12 is the argument register, add single precision float
	syscall
	
	