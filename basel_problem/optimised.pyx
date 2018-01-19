#cython: profile=True

import cython

cdef extern from "math.h":
    double sqrt(double arg)

@cython.profile(False)
cdef inline double cy_recip_square(int x):
    return 1. / (x*x)

cpdef double cy_approximate_pi(int n):
    cdef double result = 0.
    cdef int i
    for i in range(1, n + 1):
        result += cy_recip_square(i)
    return sqrt((6 * result))
