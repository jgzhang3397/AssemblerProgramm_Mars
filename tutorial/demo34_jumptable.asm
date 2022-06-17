.data

.text
.globl 	main

func:
	lui   	$t1, jmptb1 
	ori   	$t1, $t1, jmptb1
again:
	sll   	$t0, $a0, 2
	add   	$t0, $t0, $t1
	jr    	$t0

jmptb1:
	j	l1
	j	l4
	j	l3
	j	l2
	j	l5
l1:
	addi	$v0, $0, 42
	j	func_end
l2:
	addi	$v0, $v0, 4
	j	func_end
l3:
l4:
	addi	$a0, $a0, 3
	addi	$v0, $a0, 1
l5:
	addi	$a0, $a0, -2
	b 	again
	
func_end:
	jr 	$ra
	
main:
	addi  	$a0, $zero, 2 	# $a0 = 2
	jal   	func
	nop
	nop

