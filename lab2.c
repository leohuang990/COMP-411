#include <stdio.h>

int main( int argc, char** argv ) {

	// -------------------------------------
	// TODO: Put your solution here
	//
	// See assignment for instructions and 
	// input/output formatting.
	//
	// Please remember help is available 
	// (TA, LAs, or instructor)
	// -------------------------------------
	int size;
	printf("Please enter the array size (between 2 and 10): ");
	scanf("%i", &size);
	while (size<2 || size>10) {
		printf("Please enter the array size (between 2 and 10): ");
	
		scanf("%i", &size);
	}
	int arr[size];
	for (int i = 0; i < size; i++) {
		printf("Please enter the value for array[%i]: ", i);
		int temp;
		scanf("%i", &temp);
		arr[i] = temp;
	}
	for (int i = size - 1; i > 0; i--) {
		for (int x = 0; x < i; x++) {
			if (arr[x] > arr[x+1]) {
				int t = arr[x];
				arr[x] =arr[x+1];
				arr[x+1] = t;
			}
		}
	}
	printf("The array values sorted in non-decreasing order are: ");
	for (int i = 0; i < size; i++) {
		if (i!=size-1) {
			printf("%d, ", arr[i]);
		} else {
			printf("%d\n", arr[i]);
		}
	}
	return 0;
	
}