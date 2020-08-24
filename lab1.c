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
	printf("Please select a 2D shape (1 = circle, 2 = rectangle, 3 = triangle): ");
	int a;
	scanf("%i", &a);
	
	if (a == 1) {
		printf("You selected a circle, please enter the radius: ");
		double b;
		scanf("%lf", &b);
		double s = 3.14*b*b;
		printf("The area of your circle is: %.1f\n", s);
	} else if(a == 2) {
		printf("You selected a rectangle, please enter the length: ");
		double length;
		scanf("%lf", &length);
		printf("You selected a rectangle, please enter the width: ");
		double width;
		scanf("%lf", &width);
		printf("The area of your rectangle %.1f\n", length*width);
	} else if(a == 3) {
		printf("You selected a triangle, please enter the base: ");
		double base;
		scanf("%lf", &base);
		printf("You selected a triangle, please enter the height: ");
		double height;
		scanf("%lf", &height);
		printf("The area of your triangle is: %.1f\n", base*height/2);
	}

	return 0;

}