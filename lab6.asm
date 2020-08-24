.data

A:			.space 	80  	# create integer array with 20 elements ( A[20] )
size_prompt:		.asciiz 	"Enter array size [between 1 and 20]: "
array_prompt:		.asciiz 	"A["
sorted_array_prompt:	.asciiz 	"Sorted A["
close_bracket: 		.asciiz 	"] = "
search_prompt:		.asciiz		"Enter search value: "
not_found:		.asciiz		" not in sorted A"
newline: 		.asciiz 	"\n" 	

.text

main:	
	addi $t0, $0, -32
	sra $t0, $t0, 5
  exit:                     
  addi $v0, $0, 10      	# system call code 10 for exit
  syscall 
	# ----------------------------------------------------------------------------------
	# Do not modify
	#
	# MIPS code that performs the C-code below:
	#
	# 	int A[20];
	#	int size = 0;
	#	int v = 0;
	#
	#	printf("Enter array size [between 1 and 20]: " );
	#	scanf( "%d", &size );
	#
	#	for (int i=0; i<size; i++ ) {
	#
	#		printf( "A[%d] = ", i );
	#		scanf( "%d", &A[i]  );
	#
	#	}
	#
	#	printf( "Enter search value: " );
	#	scanf( "%d", &v  );
	#
	# ----------------------------------------------------------------------------------
