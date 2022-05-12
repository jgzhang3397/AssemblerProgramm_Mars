# getting users inputs Text

.data
	message: 	.asciiz "Hello,"
	userInput: 	.space 20 # 20 characters
.text
	main:
		# getting users input as text
		li $v0, 8 # 8 is the code, tell the system to read inputs text
		la $a0, userInput # store the users input
		la $a1, 20 # the maximum length of the text
		syscall
		
		# Display hello
		li $v0, 4
		la $a0, message
		syscall
		
		# Display the usersname
		li $v0, 4
		la $a0, userInput
		syscall
		
	
	# the end of main
	li $v0, 10
	syscall
	
	


	
	