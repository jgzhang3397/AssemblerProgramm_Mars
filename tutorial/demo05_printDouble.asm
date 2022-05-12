# print out double

.data
	myDouble:   .double 7.202
	zeroDouble: .double 0.0
.text
	# load double Coprocessor 1
	ldc1 $f2, myDouble
	ldc1 $f0, zeroDouble
	
	# li: load immediate for 3: print out double
	li $v0, 3
	
	# add.d Floating point addition double precision
	# for integer/character $a0, but for double/float argument Register is $f12
	add.d $f12, $f2, $f0
	
	# do it!
	syscall
	 