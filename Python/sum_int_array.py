#!/usr/bin/env python

def sum_array1(arr: list[int]) -> int:
    sum = 0
    for x in arr:
        sum += x
    return sum

def sum_array2(arr: list[int]) -> int:
    if len(arr) == 0:
        return 0
    return arr[0] + sum_array2(arr[1:])

import functools
import operator
def sum_array3(arr: list[int]) -> int:
    return functools.reduce(operator.add, arr, 0)


################################################################################
def main():
    arr = [1,2,3,4]
    assert sum_array1(arr) == 10
    assert sum_array2(arr) == 10
    assert sum_array3(arr) == 10

if __name__ == '__main__':
    main()
    print('SUCCESS')
