-- https://www.codingame.com/ide/puzzle/chuck-norris

import Data.List
import Text.Printf

main = interact $ unwords . cm2 . group . cm1 . head . lines where
    cm1 = (printf "%07b" =<<)
    cm2 = (g =<<) where
        g (x : xs) = [p x, replicate (length (x:xs)) '0'] where
            p '0' = "00"
            p '1' = "0"
