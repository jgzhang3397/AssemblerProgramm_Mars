
.text
.include "random.asm"
.include "sregcheck.asm"

.data
series:
	.word 0x7c9cdc42, 0x039c0d0c, 0x24c53bdf, 0x1bb8112
	.word 0x317e3dc6, 0x6c4c98dd, 0x41db7cfa

str_ok:	.asciiz "Alle Tests erfolgreich\n"
str_fail: .asciiz "Fehler bei Test "

.text
.globl main
main:
	la $s0, series
	addi $s2, $0, 0
chkloop:	
	add $t0, $s0, $s2
	lw $s1, 0($t0)
        sregcheck_save ()
	jal random_number
	sregcheck_compare ()
	bne $v0, $s1, fail
	addi $s2, $s2, 4
	addi $t2, $0, 28
	bne $t2, $s2, chkloop
	
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


        
