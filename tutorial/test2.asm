.data 
	arr: 	.word 1
		.word 2
		.word 3
		.word 4
		.word 5
		.word 6
	
.text
.globl main

r:
	bne	$a1, $0, l1 
	addi	$v0, $0, 1	# if exp == 0 then return 1
	jr	$ra 
	l1:
		addi 	$sp, $sp, -4 
		sw	$ra, 0($sp)
		addi	$a1, $a1, -1 # exp --
		jal	r	     # r(x, exp -1), 
			             # jedes mal zurueckspringen zum r, bis zum exp == 1, a1 == 0
			             # dann einen neuen $sp stack erstellt, so r(x, exp -1) behalten 
		
		mul 	$v0, $v0, $a0 # a0 = x
		lw	$ra, 0($sp)
		addi	$sp, $sp, 4
		jr 	$ra
polyr:
	addi	$sp, $sp, -24
	sw	$ra, 0($sp)
	sw	$s0, 4($sp)
	sw	$s1, 8($sp)
	sw	$s2, 12($sp)
	sw	$s3, 16($sp)
	sw	$s4, 20($sp)
	
	addi	$s0, $0, 0 	# s0 = erg = 0
	addi	$s1, $0, 0 	# s1 = i   = 0
	
	add	$s2, $0, $a0 	# *arrpointer, a0 = the first elements-addresse of arrays
	add	$s3, $0, $a1 	# arraysize
	add	$s4, $0, $a2 	# x

loop:
	slt	$t0, $s1, $s3 	# i < arraysize ?
	beq	$t0, $0, lend
	
	add	$a0, $0, $s4  	# r(x, i) = r(a0, a1)
	add	$a1, $0, $s1
	jal	r	     	# $v0 get the result
	
	sll	$t1, $s1, 2  	# index schieben 
	add	$t2, $t1, $s2	# addresse berechnen
	lw	$t3, 0($t2)	# array auslesen ==> t3 = arraypointer[i]
	
	mul	$t4, $v0, $t3   # t4 = r(x, i)*arraypointer[i] 
	add	$s0, $s0, $t4 	# erg = erg + t4
	
	addi	$s1, $s1, 1	# i ++
	b 	loop
	
	lend:
		move 	$v1, $s0	# erg in $v1 schiben
		lw	$ra, 0($sp)
		lw	$s0, 4($sp)
		lw	$s1, 8($sp)
		lw	$s2, 12($sp)
		lw	$s3, 16($sp)
		lw	$s4, 20($sp)
		addi	$sp, $sp, 24
		jr 	$ra 
main:
	la 	$a0, arr
	addi	$a1, $0, 6
	addi	$a2, $0, 5
	jal	polyr 
	
	li	$v0, 1
	move	$a0, $v1
	syscall
	
li	$v0, 10
syscall

		
	
				
