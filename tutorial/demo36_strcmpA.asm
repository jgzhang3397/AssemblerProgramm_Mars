.data 
	aa:	.asciiz "hiB"
	bb:	.asciiz "hiA"
.text
.globl main

strcmp:
	lb  	$t0, 0($a0)
	lb 	$t1, 0($a1)
	bne 	$t0, $t1, returnval
	beq 	$t0, $0,  returnval
	
	addiu 	$a0, $a0, 1
	addiu 	$a1, $a1, 1
	
	b     	strcmp

returnval:
	
	addi	$v0, $0,  -1
	sltu	$t2, $t0, $t1
	bne	$t2, $0,  return
	
	sltu	$v0, $t1, $t0

return:
	jr	$ra
		
main:
	lui 	$a0, aa # start addresse of aa
	ori 	$a0, $a0, aa
	
	lui 	$a1, bb # start addresse of bb
	ori 	$a1, $a1, bb
	
	jal 	strcmp
	nop
	nop
	
