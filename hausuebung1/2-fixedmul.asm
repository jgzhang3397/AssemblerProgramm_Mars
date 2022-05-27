
.text
.include "fixedmul.asm"
.include "sregcheck.asm"

.data
val_a:
	.word 0x00000000, 0x12345678, 0x87654321, 0x02000000
	.word 0xfe000001, 0xfc000000, 0x00002000
val_b:
	.word 0x00000000, 0x12345678, 0x87654321, 0x02000000
	.word 0xfe000000, 0xfe000000, 0x00001000 	
res:
	.word 0x00000000, 0xd9b7077d, 0x5ba635e9, 0x00000000
	.word 0xffffff80, 0x00000000, 0x00000080

str_ok:	.asciiz "Alle Tests erfolgreich\n"
str_fail: .asciiz "Fehler bei Test "

.text
.globl main
main:
	la $s0, val_a
	la $s1, val_b
	la $s2, res
	
	addi $s3, $0, 0
chkloop:	
	add $t0, $s0, $s3
	lw $a0, 0($t0)
	add $t0, $s1, $s3
	lw $a1, 0($t0)
	add $t0, $s2, $s3
	lw $s4, 0($t0)
        sregcheck_save ()
	jal fixedmul
	sregcheck_compare ()
	bne $v0, $s4, fail
	addi $s3, $s3, 4
	addi $t2, $0, 28
	bne $t2, $s3, chkloop
	


	# exit the program
	la $a0, str_ok
	addi $v0, $0, 4
	syscall

	li  $v0, 17
	li  $a0, 0x100000
	syscall

fail:
	la $a0, str_fail
	addi $v0, $0, 4
	syscall
	srl $a0, $s3, 2
	addi $v0, $0, 1
	syscall
	li  $v0, 17
	li  $a0, 0x100000
	syscall


        
