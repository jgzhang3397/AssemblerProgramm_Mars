
.data
	# in random access memory
	array:   .word 10,2,9
	lenth:   .word 3
	sum:	 .word 0
	avg:	 .word 3
	
	newline: .asciiz "\n"
.text
	main:
	    la $t0, array  # Base Addresse
	    li $t1, 0	   # i = 0;
	    lw $t2, lenth  # $t2 = lenth
	    lw $t3, sum    # $t3 = sum
	    sumLoop:
	    	lw  $t4, 0($t0)   	# $t4 = array[i]
	    	add $t3, $t3, $t4 	# sum = sum + array[i]
	    	
	    	add $t1, $t1, 1   	# i++
	    	add $t0, $t0, 4   	# update the arrays addresse: array[i+4]
	    	blt $t1, $t2, sumLoop   # if i<lenth, then sumLoop again
	    
	    sw $t3, sum 	# $t3 ==> sum
	    
	    # display the sum
	    li 	 $v0, 1
	    move $a0, $t3
	    syscall
	    
	    # enter the newline
	    li $v0, 4
	    la $a0, newline
	    syscall
	    
	    # calculate the avgerage
	    div $t5, $t3, $t2   # $t5 = $t3/$t2, avg = sum/lenth
	    sw  $t5, avg        # $t5 ==> avg
	    
	    # display the avg
	    li 	 $v0, 1
	    move $a0, $t5
	    syscall
	    
	    # terminate the program
	    # end of the program
	    li $v0, 10
	    syscall
	    
	    