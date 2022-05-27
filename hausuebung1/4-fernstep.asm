.text
.include "random.asm"
.include "sregcheck.asm"
.include "pixel.asm"
.include "hash.asm"
.include "fixedmul.asm"
.include "fernstep.asm"

.data
expected_x:
	.word 0x00000000, 0x0001c97d, 0x0001a664, 0x0001c45a
	.word 0x000210a8, 0x00027ca3, 0x0002fceb, 0x000388c7
	.word 0x000419a1, 0x0007a372, 0x00019f0b, 0x00019f3b
	.word 0x0001d6e5, 0x00023558, 0x0002ad90, 0x00033583
	.word 0x0003c58c, 0xfff95c6e, 0xfffae68e, 0xfffc64e2
expected_y:
	.word 0x00066600, 0x000349e7, 0x00091ef8, 0x000e14e6
	.word 0x00124aa5, 0x0015db41, 0x0018de4a, 0x001b683b
	.word 0x001d8ad5, 0x0009e41f, 0x00061bc9, 0x000b85fd
	.word 0x00101fb6, 0x00140617, 0x0017528a, 0x001a1b2d
	.word 0x001c7332, 0x000d83e4, 0x0012259b, 0x00160538

str_ok:	.asciiz "Alle Tests erfolgreich\n"
str_fail: .asciiz "Fehler bei Test "

.text
.globl main
main:
	la $s0, expected_x
	la $s1, expected_y
	addi $s2, $0, 0
chkloop:	
	add $t0, $s0, $s2
	lw $s3, 0($t0)
	add $t0, $s1, $s2
	lw $s4, 0($t0)
	
        sregcheck_save ()
	jal fern_step
	sregcheck_compare ()
	
	la $t0, x0
	lw $t0, 0($t0)
	la $t1, y0
	lw $t1, 0($t1)
	bne $t0, $s3, fail
	bne $t1, $s4, fail
	
	addi $s2, $s2, 4
	addi $t2, $0, 72
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
	srl $a0, $s2, 2
	addi $v0, $0, 1
	syscall
	li  $v0, 17
	li  $a0, 0x100000
	syscall


        
