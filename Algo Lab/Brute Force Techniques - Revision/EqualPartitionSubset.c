#include <stdio.h>

#define MAX_SIZE 100

int main() {
    int set[MAX_SIZE], subset[MAX_SIZE], n, sum = 0, i, j, k;
    printf("Enter the size of the set: ");
    scanf("%d", &n);
    printf("Enter the elements of the set: ");
    for (i = 0; i < n; i++) {
        scanf("%d", &set[i]);
        sum += set[i];
    }
    if (sum % 2 != 0) {
        printf("The given set cannot be partitioned into disjoint subsets with equal sum.\n");
        return 0;
    }
    int target = sum / 2;
    int found = 0;
    printf("Subsets of the given set:\n");
    for (i = 0; i < (1 << n); i++) {
        int sum_subset = 0, len_subset = 0;
        for (j = 0; j < n; j++) {
            if ((i & (1 << j)) != 0) {
                subset[len_subset++] = set[j];
                sum_subset += set[j];
            }
        }
        if (sum_subset == target) {
            printf("{ ");
            for (k = 0; k < len_subset; k++) {
                printf("%d ", subset[k]);
            }
            printf("}\n");
            found = 1;
        }
    }
    if (!found) {
        printf("The given set cannot be partitioned into disjoint subsets with equal sum.\n");
        return 0;
    }
    return 0;
}
