.data
	n:	.word 3

.text
	# lui 	$t0, 0x1001
	la	$t0, n
	lw	$s0, 0($t0) #	s0 = n
	
	beqz	$s0, write
	
	addi	$s1, $0, 1 #	t1 ++
	
loop:
	lb	$t1, 0($t0)	
	add	$s1, $s1, $t1
	addi	$s0, $s0, -1
	bnez	$s0, loop
	
write:
	sw	$s1, 4($t0)