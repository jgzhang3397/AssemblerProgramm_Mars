# in row major : addr = baseAddr + (rowIndex*colSize + colIndex) * datasize
.data
	myArray:  .word 2, 5, 10
		  .word 3, 7, 8
		  .word 1, 2, 3
		  
	size:	  .word 3 # row = col = 3
	.eqv  DATA_SIZE 4 # like #define DATA_SIZE 4
	
.text
	main:
	    la  $a0, myArray # base addresse 
	    lw  $a1, size
	    jal sumDiagonal  
	    
	    # display the result
	    move $a0, $v0  # $v0 has the sum
	    li   $v0, 1
	    syscall
	    
	    # end the program
	    li $v0, 10
	    syscall
	    
	sumDiagonal:
	    li $v0, 0 # sum = 0
	    li $t0, 0 # $t0 als index
	    
	    # sum = sum + array[i][i]
	    sumLoop:
	    	mul  $t1, $t0, $a1 	 # $t1 = rowIndex * colSize
	    	add  $t1, $t1, $t0 	 # $t1 = ... + colIndex, rowIndex == colIndex, bez we add only Diagonal
	    	mul  $t1, $t1, DATA_SIZE # $t1 = ... * datasize
	    	add  $t1, $t1, $a0 	 # $t1 = ... + base addresse
	    	
	    	lw   $t2, 0($t1)   	 # $t1 == array[i][i], put it in $t2
	    	add  $v0, $v0, $t2  	 # sum = sum + array[i][i] 
	    	
	    	addi $t0, $t0, 1   	 # i++
	    	
	    	blt  $t0, $a1, sumLoop   # if i < size, than loop again
	    	
	jr $ra
	    	
	    	
	    