# bit manipulation
# clear 1 bit

.data
	newLine: .asciiz "\n"
.text
	main:
		li $a1, 11
		jal showNumber
		
		li $a1, 12
		jal clearBitZero
		
		move $a1, $v0
		jal showNumber
		
		
		# end the program
		li $v0, 10
		syscall
		
	showNumber:
		li $v0, 4
		la $a0, newLine
		syscall
		
		li   $v0, 1
		move $a0, $a1
		syscall
		
		jr $ra
	
	clearBitZero:
		# Mask is $s0
		addi $sp, $sp, -4
		sw   $s0, 0($sp)
		
		# Make the Mask
		li  $s0, -1 # Mask : 1 0001 = -1
	        sll $s0, $s0, 1 # Mask =  1 0010 = -2
		add $v0, $a1, $s0 # $a1 = 0 1011
		
		lw   $s0, 0($sp)
		addi $sp, $sp, 4
		
		jr $ra
		
		
		
		
