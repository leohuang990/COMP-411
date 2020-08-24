.data

pattern: 	.space 17	# array of 16 (1 byte) characters (i.e. string)

N_prompt:	.asciiz "Enter the number of bits (N): "
newline: 	.asciiz "\n"


.text

main:
	addi $v0, $0, 4  		
  	la $a0, N_prompt		
  	syscall	
  	
  	addi $v0, $0, 5	
  	syscall	
  	addi $t0, $v0, 0  #N
  	add $s0, $t0, $0  #n
  	
  	sll $t4, $t0,2
  	addi $a0, $0, '\0'
  	sw $a0, pattern($t4)
  	jal bingen
  	 
  	j end
bingen:
	addi $sp, $sp, -8
	sw $ra, 4($sp) # Save $ra
	sw $fp, 0($sp) # Save $fp
	addi $fp, $sp, 4 # Set $fp
	
	addi $sp, $sp, -4
	sw $s0, 0($sp) #save s0
	
	beq $s0, $0, else
	
	sub $t2, $t0, $s0
	sll $t2, $t2, 2
	sw $0, pattern($t2)
	
	addi $s0, $s0, -1
  	jal bingen
  	lw $s0, -8($fp)
  	
  	sub $t2, $t0, $s0
	sll $t2, $t2, 2
	addi $t3, $0, 1
	sw $t3, pattern($t2)
	
	addi $s0, $s0, -1
  	jal bingen
  	lw $s0, -8($fp)
	j rtn
else:	
	jal print
rtn:
  	
	addi $sp, $fp, 4 # Restore $sp
	lw $ra, 0($fp) # Restore $ra
	lw $fp, -4($fp) # Restore $fp
  	jr $ra


print:
	addi $t4, $0, 0
	sll $t6, $t0, 2
lp:	
	lw $a0, pattern($t4)
	
	addi $v0, $0, 1			
		
  	syscall	
  	
	addi $t4, $t4, 4
	bne $t4, $t6, lp
	
	addi $v0, $0, 11
	addi $a0, $0, '\n'
	syscall
	jr $ra

#----------------------------------------------
#
# Convert the lab8 C-code to MIPS instructions
#
# Please remember to read the "program specification"
# section in the lab assignment PDF very carefully.
# It has all the information needed to complete this
# assignment :)
#
# TODO: Put your MIPS code here
#
#----------------------------------------------

end:
exit:                     
  addi $v0, $0, 10      	# system call code 10 for exit
  syscall               	# exit the program

