cdef extern from "stdlib.h":
    struct lldiv_t:
        long long quot;
        long long rem;
    lldiv_t lldiv(long long x, long long y)

ctypedef unsigned long long ULLong;

cdef inline int arrays_equal(char a[], char b[], int size):
    cdef int i = 0
    while i < size:
        if a[i] != b[i]:
            return 0
        i += 1
    return 1

cdef inline char* dec_to_bin(int dec):
    cdef int i = 15
    cdef char binary[16]
    while i >= 0:
        if dec % 2 == 0:
            binary[i] = '0'
        else:
            binary[i] = '1'
        dec = dec // 2
        i -= 1
    return binary

cdef ULLong _part_one(ULLong a, ULLong b):
    cdef int factor_a = 16807
    cdef int factor_b = 48271
    cdef int mod = 2147483647
    cdef int match_count = 0
    cdef int i = 0
    cdef char binary_a[16]
    cdef char binary_b[16]
    while i < 40000000:
        a = lldiv((a * factor_a), mod).rem
        b = lldiv((b * factor_b), mod).rem
        binary_a = dec_to_bin(a)
        binary_b = dec_to_bin(b)
        if arrays_equal(binary_a, binary_b, 16):
            match_count += 1
        i += 1
    return match_count

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

a, b = map(lambda x: int(x[-3:]), open('inp15.txt').read().split('\n'))
