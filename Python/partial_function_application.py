#!/usr/bin/env python

from math import sqrt, exp, pi
from functools import partial

def normal_prob(
    mu  : float,
    sig : float,
    x   : float,
) -> float:
    n = 1 / (sig * sqrt(2*pi))
    z = (x-mu)/sig
    return n * exp(-(z**2)/2)

# Standard normal or Z-distribution
z_prob = partial(normal_prob, 0, 1)

def main():
    assert z_prob(1) == z_prob(-1)
    assert round(z_prob(2), 2) == 0.05

if __name__ == '__main__':
    main()
    print('SUCCESS')
