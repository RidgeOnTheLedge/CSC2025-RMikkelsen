#include <stdio.h>
#include "Echo.h"
void print_lname(char* name, int arr_size);

int main()
{
	int age = 0;
	char lname[16];
	char fname[16];

	printf("What is your name?\n");

	scanf_s("%s %s", fname, (unsigned)(sizeof(fname)), lname, (unsigned)(sizeof(lname)));
	
	printf("Your name is %s %s\n", fname, lname);
		
	printf("What is your age?");

	scanf_s("%d", &age);

	printf("Your are %d years old.", age);

	//Traverse fname and print each character
	for (int i = 0; i < sizeof(fname); i++)
	{
		printf("%c", fname[i]);
	}

	printf("\n");

	char* fname_ptr = fname;
	int i = 0;
	while (i < 16)
	{
		printf("%c", *fname_ptr);
		fname_ptr++;
		i++;
	}
	printf("\n");

	fname_ptr = fname;
	while (*fname_ptr != '\0')
	{
		printf("%c", *fname_ptr);
		fname_ptr++;
	}
	printf("\n");

	printf("First name is at %p\n", fname);

	print_age(age);
	print_lname(lname, 16);
}	

void print_age(int p_age)
{
	printf("Your age is %d\n\n", p_age);
}

void print_lname(char* name, int arr_size)
{
	for (int i = 0; i < arr_size; i++)
	{
		printf("%c", name[i]);
	}

	printf("\n");
}