def part_one(a, b):
    factor_a = 16807
    factor_b = 48271
    mod = 2147483647
    match_count = 0

    for i in range(40000000):
        a = a * factor_a % mod
        b = b * factor_b % mod
        binary_a = bin(a)[2:][-16:]
        binary_b = bin(b)[2:][-16:]
        if binary_a == binary_b:
            match_count += 1
        i += 1

    return match_count


def part_two(a, b):
    factor_a = 16807
    factor_b = 48271
    mod = 2147483647
    match_count = 0
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


a, b = map(lambda x: int(x[-3:]), open('inp15.txt').read().split('\n'))
print('Part 1: {}'.format(part_one(a, b)))
#print('Part 2: {}'.format(part_two(a, b)))
