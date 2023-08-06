#!/usr/bin/env python

from functools import partial
from inspect import signature
from typing import Callable, Any
def curry(func: Callable[..., Any]) -> Callable:
    def inner(arg):
        if len(signature(func).parameters) == 1:
            # No more args to consume, return final result
            return func(arg)
        return curry(partial(func, arg))
    return inner

def add(x: int, y: int, z: int) -> int:
    return x + y + z

def curried_add(x: int) -> Callable:
    def add_x(y: int) -> Callable:
        def add_x_and_y(z: int) -> int:
            return x + y + z
        return add_x_and_y
    return add_x

def main():
    assert add(1,2,3) == 6
    assert curried_add(1)(2)(3) == 6
    add_1 = curried_add(1)
    add_1_and_2 = add_1(2)
    assert add_1_and_2(3) == 6

    assert curry(add)(1)(2)(3) == 6

if __name__ == '__main__':
    main()
    print('SUCCESS')
