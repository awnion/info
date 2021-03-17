-- https://www.codingame.com/ide/puzzle/temperatures

main = interact $ show . f . map read . tail . words

f [] = 0
f x = foldl1 cmp x

cmp x y
  | ax > ay = y
  | ax < ay = x
  | ax == ay = max x y
  where
    ax = abs x
    ay = abs y
