#!/usr/bin/env python

from typing import Callable

def increment(x: int) -> int:
    return x + 1

def create_decrement(x: int) -> Callable[[int],int]:
    def decrement(y: int) -> int:
        return y - x
    return decrement

def apply_twice(f: Callable[[int], int], x: int) -> int:
    return f(f(x))

def main():
    decrement = create_decrement(1)
    x = 5
    assert apply_twice(increment    , x) == 7
    assert apply_twice(decrement    , x) == 3
    assert apply_twice(lambda a: 2*a, x) == 20

if __name__ == '__main__':
    main()
    print('SUCCESS')
