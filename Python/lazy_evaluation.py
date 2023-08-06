#!/usr/bin/env python

import itertools
def main():
    generator = itertools.accumulate(range(1,6))
    assert list(generator) == [1,3,6,10,15]
    assert list(generator) == [] # Generator reached the end

    x = (i for i in itertools.count(1)) 
    y = (i for i in x if i%2==0)
    z = (2*i for i in y)
    acc = itertools.accumulate(z)

    # Generators are coupled so processing one effects others
    # assert list(itertools.islice(x,3)) == [1,2,3]
    # assert list(itertools.islice(y,3)) == [2,4,6]
    # assert list(itertools.islice(z,3)) == [4,8,12]
    assert list(itertools.islice(acc,3)) == [4,12,24]

    assert list(itertools.islice(x,3)) == [7,8,9]
    assert list(itertools.islice(x,3)) == [10,11,12]

if __name__ == '__main__':
    main()
    print('SUCCESS')
