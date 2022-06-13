# get the maximum value of arr

.data
	arr:  	.word 20
	       	.word 5
	       	.word 4
	      
.text 
.globl main

max:
	lw   $v0, 0($a0)   # $v0 = 20, set maxValue of arr is arr[0]
	
	sll  $a1, $a1, 2   # $a1 = 12
	add  $a1, $a1, $a0 # $a1 = $a0 + 12, $a1 end address of arr
loop:
	beq  $a0, $a1, end # iterate over the array
	lw   $t0, 4($a0)   # $t0 = arr[1]
	addi $a0, $a0, 4   # $a0 ++ 4
	
	slt  $t1, $v0, $t0 # if $v0 < $t0, set $t1 = 1 other then = 0
	beqz $t1, loop 
	add  $v0, $zero, $t0 # if $v0 < $t0, set $v0 = $t0
	
	b    loop
end:
	jr    $ra
	
main:
	lui  $a0, arr   
	ori  $a0, $a0, arr # start address of arr
	addi $a1, $0, 3 # $a1 = 3, Array lenth
	jal  max
	
	nop
	nop
	