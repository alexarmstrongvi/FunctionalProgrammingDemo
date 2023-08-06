#!/usr/bin/env python

import sys
import random
GLOBAL_VAR = 3
def impure_function(x: list[int]) -> list[int]:
    # Non-deterministic
    rand_int = random.randint(0,10)
    # Modifying input arguments
    x.append(rand_int)
    # Modifying non-local variables
    global GLOBAL_VAR 
    GLOBAL_VAR = 4
    # Reading input stream
    name = input('Enter your name: ')
    # Modifying standard output stream
    print('Your name is', name, file=sys.stdout)
    # Writing to memory
    with open('output_file.txt', 'w') as file:
        file.write('Hello\n')
    # Same input results in varying output
    return x[:rand_int]

def main():
    arr = [1,2,3,4,5,6,7,8,9,10]
    result = impure_function(arr)
    print(GLOBAL_VAR)
    print(arr)    
    print(result)

if __name__ == '__main__':
    main()


