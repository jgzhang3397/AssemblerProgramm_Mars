# print out PI: 3.14// print myFloat

.data
	PI: .float 3.14
.text
	# 1 for Integer, 2 for float
	li $v0, 2
	
	# load word into Coprocessor 1
	lwc1 $f12, PI
	
	# do it!
	syscall
	 