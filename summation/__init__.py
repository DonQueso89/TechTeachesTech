from .cy_summation import cy_summation


def py_summation(n):
    a = 0
    for i in range(n):
        a += i
    return a


__all__ = [py_summation, cy_summation]
