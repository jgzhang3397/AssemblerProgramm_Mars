# floating point arithmetic

.data
	num1: .float 3.14
	num2: .float 2.71
	
	num3: .double 3.14
	num4: .double 2.71
	
	newline: .asciiz "\n"
.text
	lwc1 $f0, num1
	lwc1 $f2, num2
	
	add.s $f12, $f0, $f2
	
	# print als float format
	li $v0, 2
	syscall
	
	# '\n'
	li $v0, 4
	la $a0, newline
	syscall
	
	ldc1 $f4, num3
	ldc1 $f6, num4
	
	add.s $f14, $f4, $f6
	
	# print als double format
	li $v0, 3
	syscall
	
	