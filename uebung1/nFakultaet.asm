# n-Fakultaet

.data
	n: .word 5
	f: .word 1
.text
	main:
		lw $s0, n($zero) # n stored in $s0
		lw $t0, f($zero) # f stored in $t0
		
		while:
			beq $s0, $zero, exit
			
			mul $t0, $t0, $s0 # f = f * n
			
			mflo $s1
			
			addi $s0, $s0, -1 # n--
		
			j while
		exit:
			# print the result
			
			li $v0, 1
			move $a0, $s1
			syscall
			
		# the end of program
		li $v0, 10
		syscall