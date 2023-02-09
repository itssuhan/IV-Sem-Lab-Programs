#include <stdio.h>
#include <stdlib.h>

int minimum(int m, int n)
{
	int min=0;
	if(m>n)
	{
		min=n;
	}
	else
	{
		min=m;
	}
	return min;
}

int ConsecGCD(int m, int n)
{
	int t=minimum(m,n);
	int rem = (m%t);
	if (rem = 0)
	{
		int rem2=n%t;
		if(rem2=0)
		{
			return t;
		}
		else
		{
			t--;
		}
	}
	t--;

}

int main() 
{
	int m,n;
	printf("Enter the two numbers whose GCD has to be calculated");
	scanf("%d", &m);
	scanf("%d", &n);
	printf("GCD of two numbers using Consecutive method is %d ", ConsecGCD(m,n));
	return 0;
}