#!/usr/bin/env python

def remove_repeats(string: str) -> str:
    chars = []
    for c in string:
        if len(chars) == 0 or c != chars[-1]:
            chars.append(c)
    return "".join(chars)

assert remove_repeats('') == ''
assert remove_repeats('a') == 'a'
assert remove_repeats('abbcccda') == 'abcda'

print('SUCCESS')
