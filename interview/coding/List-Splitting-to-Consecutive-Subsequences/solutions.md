#

<https://binarysearch.com/problems/List-Splitting-to-Consecutive-Subsequences>

## Python

```python
class Solution:
    def check(self, nums, i, e):
        if e == i:
            return True

        c1 = c2 = t = 0
        while i < e:
            f = 1
            x = nums[i]
            i += 1
            while i < e and x == nums[i]:
                f += 1
                i += 1
            if f < c1 + c2:
                return False
            c1, c2, t = max(0, f - t), c1, f

        return c1 == 0 and c2 == 0

    def solve(self, nums):
        n = len(nums)
        start = 0
        for i in range(n - 1):
            if nums[i + 1] - nums[i] > 1:
                if not self.check(nums, start, i + 1):
                    return False
                start = i + 1

        return self.check(nums, start, n)

```

## Ruby

```ruby
class Solution
    def check(nums, i, e)
        return true if i == e
        c1 = c2 = t = 0
        while i < e do
            f = 1
            x = nums[i]
            f += 1 while (i+=1) < e && x == nums[i]
            return false if f < c1 + c2
            c1, c2, t = [0, f - t].max, c1, f
        end

        return c1 == 0 && c2 == 0
    end

    def solve(nums)
        n = nums.size
        start = 0
        for i in 0...n-1 do
            if nums[i + 1] - nums[i] > 1
                return false unless self.check(nums, start, i + 1)
                start = i + 1
            end
        end
        return self.check(nums, start, n)
    end
end
```

## FP style Ruby

```ruby
## laws
# equolity = proc { _2 == _1 }
# locality = proc { _2 - _1 <= 1 }


class Solution
    def check(nums)
        c1 = c2 = t = 0
        nums.chunk_while{ _2 == _1 }.map( &:size ).all? do |size|
            return false if size < c1 + c2

            c1, c2, t = [size - t, 0].max, c1, size

        end && c1 == 0 && c2 == 0
    end

    def solve(nums)
        nums.chunk_while{ _2 - _1 <= 1 }.all? { _1.empty? || check(_1) }
    end
end
```

## Bonus

```ruby
class Solution
  def solve(nums)
    nums.chunk_while{ _2 - _1 <= 1 }.all? { |chunk| chunk.empty? || (
      c1 = c2 = t = 0
      chunk.chunk_while{ _2 == _1 }.map( &:size ).all? do |size|
        return false if size < c1 + c2

        c1, c2, t = [size - t, 0].max, c1, size

      end && c1 == 0 && c2 == 0
    ) }
  end
end
```
