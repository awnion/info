#!/usr/bin/env python3 -m doctest -v
"""
Given two vectors in short format.
Calculate dot product.

For vector `-1 2 3 3 3 3 3` short format will be `1 -1 1 2 5 3`

In other words it's alternating format of counts and values.

Test runs like this:
$ python3 -m doctest -v __file__
or
$ run as ./__file__
"""

from typing import List


def dot_product1(A: List[int], B: List[int]) -> int:
    """
    >>> dot_product1([1, 1, 1, 2, 1, 3], [3, 1])
    6
    >>> dot_product1(
    ...         [50_000, 1, 50_000, 2],
    ...         [10_000, 1, 50_000, 2, 40_000, 3])
    370000
    >>> dot_product1([1, 1, 1, 1], [1, 2, 1, 3])
    5
    >>> dot_product1([1, 1], [1, -1])
    -1
    >>> dot_product2(
    ...    [1, -1, 2, 2, 3, -3, 4, 4, 5, -5, 6, 6, 7, 7, 8, 8, 9, 9, 10, 10, 999945, -1],
    ...    [999945, 2, 10, 10, 9, 9, 8, -8, 7, 7, 6, 6, 5, 5, 4, 4, 3, 3, 2, 2, 1, 1])
    -1999407
    """
    len_B = len(B)

    # two cursors idea
    r = j = cursor_B = value_B = 0

    for cursor_A, value_A in zip(A[::2], A[1::2]):

        # cover all full inclusions of intervals from B (if any)
        while j < len_B and cursor_B <= cursor_A:
            r += cursor_B * value_A * value_B
            cursor_A -= cursor_B
            cursor_B = B[j]
            value_B = B[j + 1]
            j += 2

        # process the rest of interval from A
        if cursor_A > 0:
            r += cursor_A * value_A * value_B
            cursor_B -= cursor_A

    return r


def dot_product2(a: List[int], b: List[int]) -> int:
    """
    >>> dot_product2([1, 1, 1, 2, 1, 3], [3, 1])
    6
    >>> dot_product2(
    ...         [50_000, 1, 50_000, 2],
    ...         [10_000, 1, 50_000, 2, 40_000, 3])
    370000
    >>> dot_product2([1, 1, 1, 1], [1, 2, 1, 3])
    5
    >>> dot_product2([1, 1], [1, -1])
    -1
    >>> dot_product2(
    ...    [1, -1, 2, 2, 3, -3, 4, 4, 5, -5, 6, 6, 7, 7, 8, 8, 9, 9, 10, 10, 999945, -1],
    ...    [999945, 2, 10, 10, 9, 9, 8, -8, 7, 7, 6, 6, 5, 5, 4, 4, 3, 3, 2, 2, 1, 1])
    -1999407
    """
    n = len(a)
    m = len(b)
    i = 0
    j = 0
    count1 = 0
    value1 = 0
    count2 = 0
    value2 = 0
    r = 0
    while i < n or j < m:
        if count1 == 0:
            count1 = a[i]
            value1 = a[i + 1]
            i += 2

        if count2 == 0:
            count2 = b[j]
            value2 = b[j + 1]
            j += 2

        common_count = min(count1, count2)
        r += common_count * value1 * value2
        count1 -= common_count
        count2 -= common_count

    return r
