# Hello World

# .data       Subsequent items stored in Data segment at next available address
.data
	myMessage: .asciiz "Hello World \n"
	
    # .word       Store the listed value(s) as 32 bit words on word boundary
    erg: .word 4

# .text       Subsequent items (instructions) stored in Text segment at next available address
.text
	# load immediate, put value 4  in $v0
	li $v0, 4
	
	# load addresse, put myvalue/ myMessage n $a0, and then print out it
	la $a0, myMessage
	
	# execute, do it!
	syscall 
