#!/usr/bin/env python3 -m doctest -v
"""
Given a sorted list of integers `a`, and another sorted list `b`,
find the median of the list that's obtained if `a` and `b` were merged.

Median of a list of size `n` is defined to be `list[floor(n / 2)]`.

Example:

    For [1,2,3] and [5,6,7] answer is 5.

    Because (3 + 3)//2 is 3  and it's 4th element.

Constrains:
    len(a) >= 0
    len(b) >= 0
    len(a) + len(b) > 0

Test runs like this:
$ python3 -m doctest -v __file__
or
$ run as ./__file__
"""

from typing import List

def two_median(a: List[int], b: List[int]) -> int:
    """
    >>> two_median([1, 2, 3], [5, 6, 7])
    5
    >>> two_median([], [5, 6, 7])
    6
    >>> two_median([], [5])
    5
    >>> two_median([1, 2, 3], [5, 6])
    3
    """
    n, m = len(a), len(b)
    if n > m:
        a, b, n, m = b, a, m, n

    k = n + m >> 1
    l, h = 0, n
    while l < h:
        mid = h + l >> 1
        if b[k - mid - 1] > a[mid]:
            l = mid + 1
        else:
            h = mid

    if l >= n:
        return b[k - l]
    if k - l >= m:
        return a[l]
    return min(a[l], b[k - l])
