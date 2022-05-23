# .globl      Declare the listed label(s) as global to enable referencing from other files
.globl main
.data 
	n: .word 9
.text
	
	main:
		lw   $a0, n
		jal  fibarr
		
		li   $v0, 1
		add  $a0, $zero, $t0
		syscall
	# end the program
	li $v0, 10
	syscall
	
	fibarr:
		# stack reservieren
		addi $sp, $sp, -4004
		sw   $s0, 4000($sp)
		
		# t5 = array[0] pointer
		add  $t5, $sp, $zero 
		
		# a[0] initialisieren
		sw   $zero, 0($t5)
		
		# a[1] initialisieren
		addi $t0, $zero, 1
		sw   $t0, 4($t5)
		
		# s0 = i = 2
		addi $s0, $zero, 2 
		
		# if(n<1000) $t0 = 1 else $t0 = 0
		slti $t0, $a0, 1000
		beqz $t0, return
		
		while:
			slt  $t0, $a0, $s0 # if(n<i) t0 = 1
			bnez $t0, done     # end program
			
			sll  $t0, $s0, 2   # t0 = i * 4
			add  $t0, $t0, $t5 # speicheraddresse a[i]
			lw   $t2, -4($t0)  # t2 = a[i-1]
			lw   $t3, -8($t0)  # t3 = a[i-2]
			add  $t4, $t3, $t2
			sw   $t4, 0($t0)   # speichert a[i]
			
			addi $s0, $s0, 1   # i++
			j    while
			
			lw   $s0, 4000($sp)
			addi $sp, $sp, 4004 # Stack free
			jr   $ra
		done: 
			sll  $t0, $a0, 2   # offset fuer a[n] auf Stack
			add  $t1, $t0, $t5 # absoluten Wert errechnen
			lw   $v0, 0($t1)   # $t1 -> $v0
			move $t0, $v0      # $v0 -> $t0
			
			lw   $s0, 4000($sp)
			addi $sp, $sp, 4004 # Stack free
			jr   $ra
			
		return: 
			addi $t0, $zero, 0
			
			lw   $s0, 4000($sp)
			addi $sp, $sp, 4004 # Stack free
			jr   $ra
		
	
		
		
		
		