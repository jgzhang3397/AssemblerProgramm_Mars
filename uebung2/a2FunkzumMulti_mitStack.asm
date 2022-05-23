# .globl      Declare the listed label(s) as global to enable referencing from other files
.globl main

.data 
	# globale Variante z
	z: .word 0
.text
	
	main:
		# platz reservieren
		addi $sp, $sp, -12
		sw   $ra, 0($sp)
		sw   $s0, 4($sp)
		sw   $s1, 8($sp)
		
		
		# int x = 5, y = 6;
		addi $s0, $zero, 5
		addi $s1, $zero, 6
		
		move $v0, $s0
		move $v1, $s1
		
		sw $t0, z
		
		# call multi, return z = $v0
		jal multi
		
		# z = z + x + y, z = $t0
		add $t0, $t0, $s0
		add $t0, $t0, $s1
		
		lw   $ra, 0($sp)
		lw   $s0, 4($sp)
		lw   $s1, 8($sp)
		addi $sp, $sp, 12
		
		# print z on screen
		li  $v0, 1
		add $a0, $zero, $t0
		syscall 
	# end the program
	li $v0, 10
	syscall
	
	multi:
		mul $t0, $v0, $v1
		jr  $ra
		
		
		
