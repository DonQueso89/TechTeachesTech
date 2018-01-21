#include <stdio.h>
#include <stdlib.h>

typedef unsigned long long ULLong;

int arrays_equal(char a[], char b[], int size) {
    int i = 0;
    while(i < size) {
        if (a[i] != b[i]) {
            return 0;
        }
        i++;
    }
    return 1;
}

void dec_to_bin(int dec, char binary[]) {
    int i = 15;
    while(i >= 0) {
        if(dec % 2 == 0) {
            binary[i] = '0';
        }
        else {
            binary[i] = '1';
        }
        dec = dec / 2;
        i -= 1;
    }
}

int part_one(ULLong a, ULLong b) {
    int factor_a = 16807;
    int factor_b = 48271;
    int mod = 2147483647;
    int match_count = 0;
    int i = 0;
    char binary_a[16];
    char binary_b[16];
    while(i < 40000000) {
        a = a * factor_a % mod;
        b = b * factor_b % mod;
        dec_to_bin(a, binary_a);
        dec_to_bin(b, binary_b);
        if(arrays_equal(binary_a, binary_b, 16)) {
            match_count += 1;
        }
        i += 1;
    }
    return match_count;
}

int main(void) {
    FILE* fp = fopen("inp15.txt", "r");
    if(!fp) {
        printf("Error opening file");
        return 1;
    }

    char c;
    ULLong a = 0;
    ULLong b = 0;
    int place = 100;
    ULLong* cur_int = &a;
    while((c = fgetc(fp)) != EOF) {
        if(c >= 48 && c <= 57) {
            *cur_int += (c - '0') * place;
            place /= 10;
        }
        if(c == '\n') {
            place = 100;
            cur_int = &b;
        }
    }
    printf("A: %llu\n", a);
    printf("B: %llu\n", b);
    printf("Solution to part 1: %d\n", part_one(a, b));
    return 0;
}

/*
cdef ULLong _part_two(ULLong a, ULLong b):
    cdef int factor_a = 16807
    cdef int factor_b = 48271
    cdef int mod = 2147483647
    cdef int match_count = 0
    a_numbers = []
    b_numbers = []

    while len(a_numbers) < 5000000:
        a = a * factor_a % mod
        if a % 4 == 0:
            a_numbers.append(a)
    
    while len(b_numbers) < 5000000:
        b = b * factor_b % mod
        if b % 8 == 0:
            b_numbers.append(b)
    i = 0
    while i < 5000000:
        if bin(a_numbers[i])[2:][-16:] == bin(b_numbers[i])[2:][-16:]:
            match_count += 1
        i += 1
    return match_count

cpdef part_one(ULLong a, ULLong b):
    return _part_one(a, b)

cpdef part_two(ULLong a, ULLong b):
    return _part_two(a, b)
*/
