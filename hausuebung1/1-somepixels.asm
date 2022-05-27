
.data
.include "pixel.asm"
.include "hash.asm"
.include "sregcheck.asm"

.data
expectedHash: .asciiz "5e7c43c37f870353cce3b4172559cdb65c9cca0007de2b7f9b9c8b0c6326c5a0"
.data
pixels_red: .byte
    15, 16,
    16, 16,
    17, 16,
    18, 16,
    15, 17,
    16, 17,
    17, 17,
    18, 17,
    14, 18,
    15, 18,
    16, 18,
    17, 18,
    18, 18,
    19, 18,
    0, 0
    
    
pixels_green: .byte
    10, 7,
    11, 7,
    10, 8,
    11, 8,
    10, 9,
    11, 9,
    10, 10,
    11, 10,
    22, 7,
    23, 7,
    22, 8,
    23, 8,
    22, 9,
    23, 9,
    22, 10,
    23, 10,
    0, 0

pixels_blue: .byte
    6, 22,
    7, 23,
    8, 24,
    9, 25,
    10, 25,
    11, 26,
    12, 26,
    13, 26,
    14, 26,
    15, 26,
    16, 26,
    17, 26,
    18, 26,
    19, 26,
    20, 26,
    21, 26,
    22, 26,
    23, 25,
    24, 25,
    25, 24,
    26, 23,
    27, 22,
    0, 0

.text


draw_pixel_arr:
	lb $t0, 0($a0)
	lb $t1, 1($a0)
	seq $t2, $t0, $0
	seq $t3, $t1, $0
	and $t2, $t2, $t3
	bnez $t2, draw_pixel_arr_end
	addi $sp, $sp, -12
	sw $ra, 0($sp)
	sw $a0, 4($sp)
	sw $a1, 8($sp)
	addi $a0, $t0, 0
	or $a2, $0, $a1
	addi $a1, $t1, 0
	jal setPixel
	lw $ra, 0($sp)
	lw $a0, 4($sp)
	lw $a1, 8($sp)
	addi $sp, $sp, 12
	addi $a0, $a0, 2
	j draw_pixel_arr
	
	draw_pixel_arr_end:
	jr $ra
	

.globl main
main:
        sregcheck_save ()
	
	addi $a0, $0, 32
	addi $a1, $0, 32
	jal allocatePicture

	
	la $a0, pixels_red
	lui $a1, 0xff
	jal draw_pixel_arr
	
	la $a0, pixels_green
	ori $a1, $0, 0xff00
	jal draw_pixel_arr
		
	la $a0, pixels_blue
	ori $a1, $0, 0xff
	jal draw_pixel_arr
		
		
	la $a0, expectedHash
	la $t0, testHash
	jalr $t0
	


	sregcheck_compare ()
	# exit the program
	li  $v0, 17
	li  $a0, 0x100000
	syscall
        
