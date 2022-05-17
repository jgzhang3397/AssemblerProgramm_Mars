# recursion tutorial

.data
	promptMessage: .asciiz "Enter a number to find its factorial:"
	resultMessage: .ascii  "The factorial of the number is "
	theNumber:     .word   0
	theResult:     .word   0
.text
	.globl main
	main:
		# prompt user
		li $v0, 4
		la $a0, promptMessage
		syscall
		
		# read the number from keyborad
		li $v0, 5
		syscall
		
		# stored the number in $v0
		sw $v0, theNumber
		
		# call the factorial function
		lw $a0, theNumber
		jal findFactorial
		sw $v0, theResult
		
		# display the result
		li $v0, 4
		la $a0, resultMessage
		syscall
		
		li $v0, 1
		lw $a0, theResult
		syscall 
		
		# end the program
		li $v0, 10
		syscall
# --------------------------------------------------------------------
# find factorial function
.globl findFactorial
findFactorial:

	# make space for two value
	subu $sp, $sp, 8
	sw   $ra, 0($sp)
	sw   $s0, 4($sp)
	
	# base case the number equal 0
	li $v0, 1  # $v0 == 1
	
	beq $a0, 0, factorialDone
	
	move $s0, $a0
	sub  $a0, $a0, 1
	
	jal  findFactorial
	
	mul  $v0, $s0, $v0 # n = n * 1 
	
	factorialDone: 
		lw   $ra, 0($sp)
		lw   $s0, 4($sp)
		addu $sp, $sp, 8
		
		jr $ra # return back to function

		