#include <stdio.h>
#include <string.h>

char secret[31] __attribute__ ((section (".secret")));

int main(int argc, char* argv[]) {
    char buffer[16];
    setvbuf(stdout, NULL, _IONBF, 0);
    setvbuf(stderr, NULL, _IONBF, 0);
    printf("What do you want?\n");
    strcpy(secret, "CYSEC{NOT_THE_ACTUAL_FLAG}");
    fgets(buffer, 16, stdin);
    printf(buffer);
}
