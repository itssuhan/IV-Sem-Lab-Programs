#include <stdio.h>
#include <stdlib.h>

int isprime(int x,int op)
{
    int c = 0, i;
    for(i = 2; i < x; i++)
    {
        (op)++;
        if(x % i == 0)
            return 0;
    }
    return 1;
}
int gcd(int m, int n)
{
    int gcd = 1,p = 2, opcount = 0;
    int q=m<n?m:n;
    while(p<q)
    {
        opcount++;
        if(isprime(p,opcount))
        {
            if(m % p == 0 && n % p == 0)
            {
                gcd = gcd * p;
                m = m/p;
                n = n/p;
            }
            else
                p++;
        }
        else
            p++;
    }
    printf("Operation Count = %d\n",opcount);
    return gcd;
}

void main()
{
    int m,n,x;
    printf("Enter two numbers to calculate the GCD : \n");
    scanf("%d %d",&m,&n);
    x = gcd(m,n);
    printf("GCD of %d and %d is %d\n",m,n,x);
}
