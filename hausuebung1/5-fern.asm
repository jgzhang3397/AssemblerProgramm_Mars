.eqv	WIDTH	128
.eqv	HEIGHT	128
.eqv	ITERATIONS 2000

.include "pixel.asm"
.include "hash.asm"
.include "fixedmul.asm"
.include "random.asm"
.include "fernstep.asm"
.include "fern.asm"

.include "sregcheck.asm"

.data
expectedHash: .asciiz "17164bf77913553ca13135fb6f17d86d5c245611b67d4129113840dd9e8aab47"

.text

	.globl main
main:
	sregcheck_save()

	addi $a0, $0, WIDTH
	addi $a1, $0, HEIGHT
	jal allocatePicture

	jal fern

	la $a0, expectedHash
	la $t0, testHash
	jalr $t0

	sregcheck_compare()
	# exit the program
	addi $v0,$0,17
	li  $a0, 0x100000
	syscall

	
