.data
	errormsg_pixel: .asciiz "This is not the main file!"
.text


#if the user mistakenly uses this as the main file, terminate execution
li $v0, 55
la $a0, errormsg_pixel
addi $a1, $0, 0
syscall
li  $v0, 17 
li  $a0, 0x40000
syscall


.data
	buffer: .word 0
	width: .word 0
	height: .word 0

.text
allocatePicture:
    la $t0, width
    sw $a0, 0($t0)
    sw $a1, 4($t0)

    # x * y
    mul $a0, $a0, $a1
    # * 4 for words
    sll $a0, $a0, 2
    li  $v0, 9
    syscall
    la $t0, buffer
    sw $v0, 0($t0)
    jr $ra

setPixel:
	jr $ra
