.text

 	
#Calculate the fnv Hash of the image and store it in the 65 char string at a0
hashImage:
	addi $a2, $a0, 0
	la $a0, buffer
	lw $t0, 4($a0) # width
	lw $t1, 8($a0) # height
	lw $a0, 0($a0)
	mul $a1, $t0, $t1
	sll $a1, $a1, 2
	add $a1, $a0, $a1
	
	addi $v0, $0, 60
	syscall
	
	jr $ra
	
	
	
.data

	str_expected: .asciiz "Expected: "
	str_actual: .asciiz "\nActual:   "
	str_hashok: .asciiz "\nHash OK!\n"
	str_hashfail: .asciiz "\nHash FAILED!\n"
	str_commaspace: .asciiz ", "
.text
	
strEq:

	lb	$t0,0($a0)
	lb	$t1,0($a1)
	bne	$t0,$t1,strEqreturnval
	beq	$t0,$0, strEqreturnval

	addiu	$a0,$a0,1
	addiu	$a1,$a1,1
	b	strEq

strEqreturnval:
	seq $v0, $t0, $t1
	jr $ra
	
testHash:
	addi $sp, $sp, -76
	sw $s0, 68($sp)
	sw $ra, 72($sp)
	
	addi $s0, $a0, 0
	
	la $a0, str_expected
	addi $v0, $0, 4
	syscall
	
	addi $a0, $s0, 0
	syscall
	
	
	la $a0, str_actual
	syscall
	
	
		
        addi $a0, $sp, 0
	jal hashImage
	
	addi $a0, $sp, 0
	addi $v0, $0, 4
	syscall
	
	
	addi $a0, $sp, 0
	addi $a1, $s0, 0
	jal strEq

	
	beqz $v0, hashfailed
	
	la $a0, str_hashok
	b end
	
	hashfailed:
	
	la $a0, str_hashfail
	
	
	end:
	
	addi $v0, $0, 4
	syscall
	
	
	
	lw $s0, 68($sp)
	lw $ra, 72($sp)
	addi $sp, $sp, 76
	jr $ra
