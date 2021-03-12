-- https://www.codingame.com/ide/puzzle/create-the-longest-sequence-of-1s

import System.IO

f [] cur best p = max cur best
f ['0'] cur best p = max (cur + p) best
f ['1'] cur best p = max (cur + 1) best

f ('0' : xs) cur best 0 = max cur best
f ('1' : xs) cur best p = f xs (cur + 1) best p

f ('0' : x : xs) cur best 1
    | x == '0' = max (f xs 1 (max best $ cur + 1) 0) (f xs 0 best' 1)
    | x == '1' = max (f xs (cur + 2) best 0) (f xs 1 best' 1)
    where
        best' = max cur best

main = interact $ show.(\x -> f x 0 0 1).head.words
