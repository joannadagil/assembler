#include <stdio.h>

	extern void _tablica (int *a); 

	void tablica (int *a);

	int tab[4];

	int main()
	{
		int i;
		for (i=0;i<4;i++)
			tab[i]=2*(i+1)+5;
		for (i=0;i<4;i++)
			printf("%d ", tab[i]);
		tablica(tab);
		printf("\n");
		for (i=0;i<4;i++)
			printf("%d ", tab[i]);
		return 0;
	}

/*	void wskaznik (int *a)
	{
		//*a=45;
	}
*/


// nasm -o fun.obj -f obj fun.asm

// .\bcc32.exe interface.c fun.obj