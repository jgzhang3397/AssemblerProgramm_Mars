fixedmul:
#SOLUTION_START
	mult $a0,$a1
	mflo $t0
	srl $t0,$t0,25
	mfhi $t1
	sll $t1,$t1,7
	or $v0,$t1,$t0
#SOLUTION_END
	jr $ra
