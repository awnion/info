#!/usr/bin/env python3
"""
Given two vectors in squash form.
Calculate dot product.

For vector `-1 2 3 3 3 3 3` squash form will be `1 -1 1 2 5 3`

In other words it's alternating format of 
counts and values for consequent goups.
"""

from typing import List


def dot_product(a: List[int], b: List[int]) -> int:
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


import unittest


class T(unittest.TestCase):

    def test_1(_):
        assert 6 == dot_product([1, 1, 1, 2, 1, 3], [3, 1])

    def test_2(_):
        # 10k 1*1 40k 1*2 10k 2*2 40k 2*3 = 10k + 80k + 40k + 6*40k = 370k
        assert 370_000 == dot_product(
            [50_000, 1, 50_000, 2],
            [10_000, 1, 50_000, 2, 40_000, 3])

    def test_3(_):
        assert 5 == dot_product([1, 1, 1, 1], [1, 2, 1, 3])

    def test_4(_):
        assert -1 == dot_product([1, 1], [1, -1])


if __name__ == '__main__':
    unittest.main()
