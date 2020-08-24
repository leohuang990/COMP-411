.data
  AA:     .space 400  		# int AA[100]
  BB:     .space 400  		# int BB[100]
  CC:     .space 400  		# int CC[100]
  m:      .word	 0   		# m is an int whose value is at most 10
  a:       .asciiz         "m = "
  b:       .asciiz         "AA["
  c:       .asciiz         "] = " 
  d:       .asciiz         "BB[" 
  e:       .asciiz         "CC[" 
  newline: 	.asciiz 	"\n" 
.text

main:
	la $s0, AA
	la $s1, BB
	la $s2, CC
	
	addi $v0, $0, 4  		
  	la $a0, a		
  	syscall	
  	addi $v0, $0, 5	
  	syscall	
  	la $t7, m	
  	add $t7, $0, $v0	
	
	jal run
	j end
#----------------------------------------------
#
# Convert the lab7 C-code to MIPS instructions
#
# Please remember to read the "program specification"
# section in the lab assignment PDF very carefully.
# It has all the information needed to complete this
# assignment :)
#
# TODO: Put your MIPS code here
#
#----------------------------------------------
run:
	addi $sp, $sp, -8
	sw $ra, 4($sp) # Save $ra
	 sw $fp, 0($sp) # Save $fp
	addi $fp, $sp, 4 # Set $fp
	
	mult $t7, $t7    
	mflo $t6      # m squared
	addi $t5, $0, 0   # index
loop: 
	addi $v0, $0, 4  		
  	la $a0, b		
  	syscall	
  	
  	addi $v0, $0, 1			
  	add $a0, $0, $t5			
  	syscall	
  	
  	addi $v0, $0, 4  		
  	la $a0, c		
  	syscall	
  	
	addi $v0, $0, 5
	syscall
	
	sll $t4, $t5,2
	add $t4, $t4, $s0
	sw $v0, 0($t4)
	
	addi $v0, $0, 4  		
  	la $a0, d		
  	syscall	
  	
  	addi $v0, $0, 1			
  	add $a0, $0, $t5			
  	syscall	
  	
  	addi $v0, $0, 4  		
  	la $a0, c		
  	syscall	
	
	addi $v0, $0, 5
	syscall
	
	sub $t4, $t4, $s0
	add $t4, $t4, $s1
	sw $v0, 0($t4)
	
	addi $t5, $t5, 1
	slt $t4, $t5,$t6
	bne $t4, $0, loop
	
	jal matrixmult
	addi $sp, $fp, 4 # Restore $sp
	lw $ra, 0($fp) # Restore $ra
	lw $fp, -4($fp) # Restore $fp
	jr $ra #
matrixmult:
	addi $sp, $sp, -8
	sw $ra, 4($sp) # Save $ra
	 sw $fp, 0($sp) # Save $fp
	addi $fp, $sp, 4 # Set $fp
	
	addi $s4, $0, 0  # i 
loopa:	
	addi $s5, $0, 0  # j
loopb:
	addi $s7, $0, 0  # s
 
	addi $s6, $0, 0  # k
loopc:	
	mult $s4, $t7    
	mflo $t8
	add $t8, $t8, $s6
	sll $t8, $t8,2
	add $t8, $t8, $s0
	lw $t8, 0($t8)
	
	mult $s6, $t7    
	mflo $t9
	add $t9, $t9, $s5
	sll $t9, $t9,2
	add $t9, $t9, $s1
	lw $t9, 0($t9)
	
	mult $t8, $t9    
	mflo $t9
	
	add $s7, $s7, $t9
	
	addi $s6, $s6,1
	slt $t4, $s6, $t7
	bne $t4, $0, loopc
	
	mult $s4, $t7    
	mflo $t8     
	add $t8, $t8, $s5
	sll $t8, $t8,2
	add $t8, $t8, $s2
	sw $s7, 0($t8)
	
	addi $s5, $s5,1
	slt $t4, $s5, $t7
	bne $t4, $0, loopb
	
	addi $s4, $s4,1
	slt $t4, $s4, $t7
	bne $t4, $0, loopa
	
	jal printc
	
	addi $sp, $fp, 4 # Restore $sp
	lw $ra, 0($fp) # Restore $ra
	lw $fp, -4($fp) # Restore $fp
	jr $ra #
printc: 
	addi $sp, $sp, -8
	sw $ra, 4($sp) # Save $ra
	 sw $fp, 0($sp) # Save $fp
	addi $fp, $sp, 4 # Set $fp
	
	mult $t7, $t7    
	mflo $t6      # m squared
	addi $t5, $0, 0   # index

loop4:
	
	
	addi $v0, $0, 4  		
  	la $a0, e		
  	syscall	
  	
  	addi $v0, $0, 1			
  	add $a0, $0, $t5			
  	syscall	
  	
  	addi $v0, $0, 4  		
  	la $a0, c		
  	syscall	
	
	sll $t3, $t5,2
	add $t3, $t3, $s2
	lw $t3, 0($t3)
	
	addi $v0, $0, 1			
  	add $a0, $0, $t3			
  	syscall	
  	
  	addi $v0, $0, 4  		
  	la $a0, newline 			
  	syscall
	
	addi $t5, $t5, 1
	slt $t4, $t5,$t6
	bne $t4, $0, loop4
	
	addi $sp, $fp, 4 # Restore $sp
	lw $ra, 0($fp) # Restore $ra
	lw $fp, -4($fp) # Restore $fp
	jr $ra #
end:
exit:                     
  addi $v0, $0, 10      	# system call code 10 for exit
  syscall               	# exit the program

