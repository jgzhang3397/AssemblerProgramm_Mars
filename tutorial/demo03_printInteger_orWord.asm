.data
	age: .word 24
.text
	# 1: print out an Integer or Word
	li $v0, 1
	
	# load word in argument Register0($a0)
	lw $a0, age
	
	# do it!
	syscall
	 