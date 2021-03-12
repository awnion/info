import System.IO
import Control.Monad

f [] current best p = max current best
f ['0'] current best p = max (current + p) best

f ['1'] current best p = max (current + 1) best
f ('0' : xs) current best 0 = max current best
f ('1' : xs) current best p = f xs (current + 1) best p
f ('0' : x : xs) current best 1
    | (x == '0') = max (f xs 1 (max best $ current + 1) 0) (f xs 0 (max best current) 1)
    | (x == '1') = max (f xs (current + 2) best 0) (f xs 1 (max current best) 1)

f [x] current best p = f [] current best p
f (x : xs) current best p = f xs current best p

main=interact$show.(\x -> f x 0 0 1).head.words
