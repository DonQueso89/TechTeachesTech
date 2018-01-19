cdef int _no_negatives_please(int i) except? -1:
    if i < 0:
        raise Exception('I said no negatives!')
    else:
        print('thank you')
        return -1

cpdef int no_negatives_please(int i) except? -1:
    _no_negatives_please(i)
