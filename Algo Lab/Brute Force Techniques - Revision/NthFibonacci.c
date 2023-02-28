#include<stdio.h>
#include<stdlib.h>
int main()
{
	int n,i,t1=0,t2=1,nexterm;

	printf("Enter a positive integer: \n");
	scanf("%d",&n);

	if(n<0)
	{
		printf("Error: Invalid input");
		return 1;
	}

	for(i=1;i<=n;i++)
	{
		if(i==1)
		{
			nexterm=t1;
		}
		else if(i==2)
		{
			nexterm=t2;
		}
		else
		{
			nexterm=t1+t2;
			t1=t2;
			t2=nexterm;
		}
	}

	printf("The %d Finonacci number is %d.\n",n,nexterm);
	return 0;
}