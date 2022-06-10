.data
.include "data.asm"
.include "pixel.asm"
.include "hash.asm"
.include "sregcheck.asm"
.data
expectedHash: .asciiz "83da25ecbf3345581df3717dbc2ef3d9bb2df88cd2c32de3691cc072cde4681f"
.text
.globl main
main:
        sregcheck_save ()
	addi $a0, $0, 32
	addi $a1, $0, 32
	jal allocatePicture
	
	addi $sp, $sp, -16
	sw   $s0, 0($sp) # index
	sw   $s1, 4($sp) # current address
	sw   $s2, 8($sp) # pixel count
	sw   $s3, 12($sp)# last pixel
	

	addi $s0, $0, 0
	la   $s1, img  # img --> $s1
	addi $s2, $0, 1024
	addi $s3, $0, 0
	
	loop:
	
	slt  $t0, $s0, $s2 
	beqz $t0, fin
	
	
	lw   $t0,   0($s1) # $s1 --> $t0
	sw   $zero, 0($s1) # $zero --> $s1
	add  $t0, $t0, $s3 # $t0 == $t0 + $s3
	addi $s3, $t0, 0   # $s3 == $t0 + 0
	
	mul  $t0, $s0, 257 # $t0 == $s0 * 257
	
	andi $a0, $t0, 31  # $a0 == $t0 and 31 bitweise
	srl  $a1, $t0, 5   # $a1 == $t0 / (2^5)
	andi $a1, $a1, 31  # $a1 == $a1 and 31 bitweise 0001 1111
	addi $t0, $zero, 0 # $t0 == 0
	addi $a2, $s3, 0   # $a2 == $s3
	
	jal  setPixel
	
	addi $s0, $s0, 1 # i++
	addi $s1, $s1, 4 
	
	b loop
	
	fin:
	
	
	la $a0, expectedHash
	la $t0, testHash
	jalr $t0
	
	addi $sp, $sp, 16
	lw $s0, 0($sp)
	sw $s1, 4($sp)
	sw $s2, 8($sp)
	lw $s3, 12($sp)
	
	sregcheck_compare ()
	
	# exit the program
	li  $v0, 17
	li  $a0, 0x100000
	syscall
