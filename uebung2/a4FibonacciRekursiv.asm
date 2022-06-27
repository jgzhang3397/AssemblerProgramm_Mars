# .globl      Declare the listed label(s) as global to enable referencing from other files
.globl main
.data 
	n: .word 9
.text
	
	main:
		lw   $a0, n
		jal  fibo
		
		# print result to screen
		li   $v0, 1
		add  $a0, $zero, $v1
		syscall
		
	# end the program
	li $v0, 10
	syscall
	
	fibo:
		addi  $v1, $zero, 0
		beqz  $a0, return  # if a == 0 return 0
		
		addi  $v1, $zero, 1 # if a == 1 return 1
		beq   $a0, $v1,   return
		
		addi  $sp, $sp, -12
		sw    $ra, 0($sp)
		sw    $a0, 4($sp)
		addi  $a0, $a0, -1 # a--
		jal   fibo         # fibo(a-1)
		
		sw    $v1, 8($sp)  # save fibo(a-1)
		lw    $a0, 4($sp)  # restore $a0
		addi  $a0, $a0, -2 # a-2
		jal   fibo
		
		lw    $ra, 0($sp)  # restore $ra
		lw    $t0, 8($sp)  # fibo(a-1)--> $t0
		addi  $sp, $sp, 12 # stack free
		add   $v1, $t0, $v1 # fibo(a-1) + fibo(a-2)
	
		return:
			jr   $ra
		
		
		