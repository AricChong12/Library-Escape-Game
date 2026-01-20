.data #memory
	sentence1: .asciiz "One day you are staying late night in UTeM Library and suddenly trapped inside the library.To escape the locked library you need to solve math puzzles in order tonavigate through the rooms and unlock the Exit Doors(Pintu Keluar).Each correct answer increases your score by 25 and wrong answer will decreases the score by 25, and you must reach a target 100 score to unlock the final exit."
	sentence2: .asciiz "There are four rooms in this library, press the number of the room to go to the room, escape them if you can,press 1 to go next room, 2 to go to previous room, good luck" 
	sentence3: .asciiz "Enter 1 to go next room, enter 2 to go previos room: "
	end: .asciiz "Congratulations, you escaped the library"
	
	score: .word 0
	
	space: .asciiz "\n"
	
	q1: .asciiz "You are in Room 1 Discussion Room, 10 + 50 = "
	q2: .asciiz "You are in Room 2 Santai Space, 20 - 100 = "
	q3: .asciiz "You are in Room 3 Computer Room, 3 * 12 = "
	q4: .asciiz "You are at the Exit Door, 50 / 2 = "
.text
	#global vars
	li $s2, 1 # s2 = 1
	li $s3, 2 # s3 = 2
	main:
		#start of question1
		question1:
		#Prints q1
		li $v0, 4
		la $a0, q1
		syscall
		
		#Get user input q1
		li $v0, 5
		syscall
		move $t0, $v0 # t0 = user input q1
		
		li $s1, 60 # $s1 = 60
		
		beq $t0, $s1, same # t0 == 60
			#else
			#Prints score and space
			li $v0, 1
			la $a0, 0
			syscall
			li $v0, 4
			la $a0, space
			syscall
			
			j question1 # jump back to question1
			
		same:
			#Prints score
			li $v0, 1 
			la $a0, 25
			syscall
			
			li $v0, 4
			la $a0, space
			syscall
			
			#Prints sentence3
			li $v0, 4
			la $a0, sentence3
			syscall
			
			#Get 1 or 2
			li $v0, 5
			syscall
			move $t0, $v0
			
			beq $t0, $s2, same2 #user input == 1
				#else
				#force player to move next room
				j question2
			same2:
				j question2
				
		#start of question2
				
		question2:
			#Prints q2
			li $v0, 4
			la $a0, q2
			syscall
		
			#Get user input q2
			li $v0, 5
			syscall
			move $t1, $v0 # t1 = user input q2
		
			li $s4, -80 # $s1 = -80
		
			beq $t1, $s4, same3 # t1 == -80
				#else
				#Prints score and space
				li $v0, 1
				la $a0, 25
				syscall
				li $v0, 4
				la $a0, space
				syscall
			
				j question2 # jump back to question2
			
			same3:
				#Prints score
				li $v0, 1 
				la $a0, 50
				syscall
			
				li $v0, 4
				la $a0, space
				syscall
			
				#Prints sentence3
				li $v0, 4
				la $a0, sentence3
				syscall
			
				#Get 1 or 2
				li $v0, 5
				syscall
				move $t1, $v0
			
				beq $t1, $s2, same4 #user input == 1
					#else
					j question1
				same4:
					j question3
		
		#start of question3
		question3:
			#Prints q3
			li $v0, 4
			la $a0, q3
			syscall
		
			#Get user input q3
			li $v0, 5
			syscall
			move $t2, $v0 # t2 = user input q3
		
			li $s5, 36 # $s5 = 36
		
			beq $t2, $s5, same5 # t2 == 36
				#else
				#Prints score and space
				li $v0, 1
				la $a0, 50
				syscall
				li $v0, 4
				la $a0, space
				syscall
			
				j question3 # jump back to question3
			
			same5:
				#Prints score
				li $v0, 1 
				la $a0, 75
				syscall
			
				li $v0, 4
				la $a0, space
				syscall
			
				#Prints sentence3
				li $v0, 4
				la $a0, sentence3
				syscall
			
				#Get 1 or 2
				li $v0, 5
				syscall
				move $t2, $v0
			
				beq $t2, $s2, same6 #user input == 1
					#else
					j question2
				same6:
					j question4
			
			#start of question4
			question4:
				#Prints q4
				li $v0, 4
				la $a0, q4
				syscall
		
				#Get user input q4
				li $v0, 5
				syscall
				move $t3, $v0 # t3 = user input q4
		
				li $s6, 25 # $s6 = 25
		
				beq $t3, $s6, same7 # t3 == 25
					#else
					#Prints score and space
					li $v0, 1
					la $a0, 75
					syscall
					li $v0, 4
					la $a0, space
					syscall
			
					j question4 # jump back to question4
			
				same7:
					#Prints score
					li $v0, 1 
					la $a0, 100
					syscall
			
					li $v0, 4
					la $a0, space
					syscall
			#end
			#Prints end quotes
			li $v0, 4
			la $a0, end
			syscall
			
			
					
			
			
		
		
		
