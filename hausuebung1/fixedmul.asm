.data
	ax: .long 0
	bx: .long 0
	cx: .long 0
.text
fixedmul:
	la $t0, ax
	la $t1, bx
	la $t2, cx

	move $t0, $a0
	move $t1, $a1
	mul  $t2, $t0, $t1
	srl  $t3, $t2, 18
        move $v0, $t3
	jr $ra
