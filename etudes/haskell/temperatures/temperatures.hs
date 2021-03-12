-- https://www.codingame.com/ide/puzzle/temperatures

import System.IO

main = interact $ show.f.map read.words.head.tail.lines

f [] = 0
f [x] = x
f (x : xs) = cmp x $ f xs

cmp x y
    | ax > ay  = y
    | ax < ay  = x
    | ax == ay = max x y
    where
        ax = abs x
        ay = abs y

