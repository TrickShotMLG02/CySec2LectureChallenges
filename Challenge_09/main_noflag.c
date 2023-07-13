#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include <float.h>

#define MAX_NUMBERS 1024

float numbers[MAX_NUMBERS];

// check if string is a valid number
int is_ok(char* str) {
    for(int i = 0; i < strlen(str); i++) {
        // block everything above the range [0-9]
        if(str[i] > '9') return 0;
        // block everything below the range [0-9], except newline
        if(str[i] >= 0 && str[i] < '0' && str[i] != '\n' && str[i] != '.') return 0;
    }
    return 1;
}


int main(int argc, char* argv[]) {
    FILE* f = fopen(argv[1], "r");
    if(!f) {
        printf("Failed to open file\n");
        return 1;
    }
    
    int lptr = 0;
    int count = 0;
    memset(numbers, -1, sizeof(numbers));
    size_t len = 0;
    char* line = NULL;
    while(getline(&line, &len, f) > 0 && count < MAX_NUMBERS) {
        if(strlen(line) <= 1) continue; // skip empty lines
        if(!is_ok(line)) {
            printf("Invalid number at line %d\n", ++lptr);
        } else {
            sscanf(line, "%f", &(numbers[count++]));
        }
    }
    if(count == 0) {
        printf("No numbers given, aborting...\n");
        return 1;
    }
    
    // calculate statistics
    float min_value = numbers[0], max_value = numbers[0];
    for(int i = 0; i < count; i++) {
        if(numbers[i] < min_value) min_value = numbers[i];
        if(numbers[i] > max_value) max_value = numbers[i];
    }
    if(max_value >= min_value) {
        printf("All fine!\n");
        printf(" min: %f\n max: %f\n", min_value, max_value);
    } else {
        printf("What is going on here???\n");
        printf("This is so broken, I might as well just give you the flag: <exploit on server to get flag>\n");
        return -1;
    }
    return 0;
}
