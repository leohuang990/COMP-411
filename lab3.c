#include <stdio.h>
int length(char* a) {
	int i;
	for (i = 0; a[i] !='\0'; ++i){
		
	}
	return i;
}
void change(char* a, char* b, char* c) {
	for(int aa = 0; aa<length(a); ++aa) {
		if (a[aa] == b[0]) {
			a[aa] = c[0];
		}
	}
	return;
}

void determine(char* a) {
	int index = length(a);
		for (int aa = 0; 2*aa < index; aa++) {
			if (a[aa] != a[length(a) - aa - 1]) {
				printf("\"%s\" is not a palindrome\n", a);
				return;
			}
		}
		printf("\"%s\" is a palindrome\n", a);
		
	
}

int main( int argc, char** argv ) {

	// ****************************
	// TODO: Code your solution
	// ***************************
	printf("Please enter a string (minimum 4 characters): ");
	char st[100];
	scanf("%s", st);
	while((int)length(st)<4) {
		printf("len(%i) < 4 characters, please retry: ", (int)length(st));
		scanf("%s", st);
	}
	
	printf("Replace a character in \"%s\" (y/n): ", st);
	char or[1];
	char aa[] = "n";
	scanf("%s", or);
	if (or[0] == aa[0]) {
		determine(st);
	} else {
		printf("What character do you want to replace: ");
		char in[1];
		scanf("%s", in);
		printf("What is the replacement character: ");
		char out[1];
		scanf("%s", out);
		change(st, in, out);
		determine(st);
	}
	


	return 0;

} // end main function

