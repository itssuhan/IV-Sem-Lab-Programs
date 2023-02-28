#include<stdio.h>
#include<stdlib.h>
#include<string.h>

int main()
{
	char text[100],pattern[100];
	int i,j,len_text,len_pattern,match_count=0;

	printf("Enter the text:\n");
	scanf("%[^\n]",text);
	printf("Enter the pattern: \n");
	scanf("%s",pattern);

	len_text=strlen(text);
	len_pattern=strlen(pattern);

	for(i=0;i<=len_text-len_pattern;i++)
	{
		for(j=0;j<len_pattern;j++)
		{
			if(text[i+j]!=pattern[j])
			{
				break;
			}
		}


		if(j==len_pattern)
		{
			match_count++;
		}
	}

	if(match_count == 0)
	{
		printf("\nPattern not found\n");
	}

	else 
	{
      printf("pattern found %d times \n",match_count);
	}

	return 0;
}