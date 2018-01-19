from incr import incr

print('Before converting to C int: %d (%s)' % (2 ** 31 - 2, bin(2 ** 31 - 2)))
retval = incr(2 ** 31 - 2)
print('Passed back to Python after 1st increment %d (%s)' % (retval, bin(retval)))
retval = incr(retval)
print('Passed back to Python after 2nd increment %d (%s)' % (retval, bin(retval)))
retval = incr(retval)
print('Passed back to Python after 3nd increment %d (%s)' % (retval, bin(retval)))
