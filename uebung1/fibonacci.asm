# fibonacci folge 
# Fn = Fn-1 + Fn-2
# F0 = 0, F1 = 1, F2 = 1, F3 = 2, F4 = F3 + F2 = 3 ...
# iterativ
# sonderfall n = 0,1

.data
	n: 	.word 9
	erg: 	.word 0
.text
	main:
		la $t0, n
		lw $s0, 0($t0) # $s0 = n
		# == lw $s0, n($zero)
		beq  $s0, 0, nEqualNull # n = 0, jump to  nEqualNull
		beq  $s0, 1, nEqualOne
		
		addi $s1, $zero, 0 # F0 = 0
		addi $s2, $zero, 1 # F1 = 1
		
		addi $s4, $zero, 0 # return value = 0
		
		addi $s0, $s0, -1 # n--
		while:
			beq $s0, $zero, print
			add $s4, $s1, $s2 # tmp = Fn-2 + Fn-1
			add $s1, $s2, $zero # Fn-2 = Fn-1
			add $s2, $s4, $zero # Fn-1 = tmp
			addi $s0, $s0, -1
			j while
		print:
			# print the result
			li $v0, 1
			move $a0, $s4
			syscall
			
			# the end of program
			li $v0, 10
			syscall
			
		nEqualNull: 
			addi, $s4, $zero, 0
			j print
		nEqualOne:
			addi, $s4, $zero, 1
			j print
