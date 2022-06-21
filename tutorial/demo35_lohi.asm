.data
	x:	.word 10
	y:	.word 20
	
.text
.globl main

main:
	lw   $a0, x($zero)
	lw   $a1, y($zero)
	
	# the product stored in hi & lo Register
	mult $a0, $a1  
	
	# move the value from hi register to $a0
	mfhi $a0 
	
	# move the value from lo register to $a1
	mflo $a1 
	
	nop
	nop