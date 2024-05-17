#include <stdio.h>
#include <stdlib.h>

int main() {
    int num;
    printf("Enter a number: ");
    scanf("%d", &num);

    if (num > 0) {
        exit(1); // больше нуля
    } else if (num < 0) {
        exit(2); // меньше нуля
    } else {
        exit(0); // равно нулю
    }

    return 0;
}

