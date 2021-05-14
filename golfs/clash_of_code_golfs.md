# Sum of all happy numbers from 1..n

```ruby
p (1..gets.to_i).select{|x|x=x.digits.sum{_1**2}until 4==x||x<2;x<2}.sum
```

# Weird ASCII -> binary matrix transpose with complications

```python
for o in zip(*[f"{ord(x):<7b}"for x in input()]):{*o}!={' '}and print(*o,sep='')
```

# Check if ASCII scales in balance or not

Example

```
10kg              10kg
|                 |
|                 |
v                 v
-------------------
    A
```

```ruby
gets=~/\D+/
a,b=$`.to_i,$'.to_i
*_,c,$_=*$<
p~/A/*a==b*(c.size-~/A/-2)?1:0
```

# Birthday paradox (general case)

Find min number of people such that probability of at least 2 of them have same birthday date is greater than `b` (year has `d` days).

```ruby
d,b=$<.map &:to_f
o=1
p (1..).find{1>b+o*=1-_1/d}+1
```
