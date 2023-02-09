#include <stdio.h>
#include <stdlib.h>

int EuclidGCD(int m, int n)
{
	unsigned int r;
	int opcount=0;
	while(n!=0)
	{
		opcount++;
		r=m%n;
		m=n;
		n=r;
	}
	printf("Operation Count is %d \n",opcount);
	return m;

}

int main() 
{
	int m,n;
	printf("Enter the two numbers whose GCD has to be calculated");
	scanf("%d", &m);
	scanf("%d", &n);
	printf("GCD of two numbers using Euclid’s method is %d ", EuclidGCD(m,n));
	return 0;
}