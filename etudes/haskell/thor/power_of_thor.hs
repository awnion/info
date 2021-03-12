-- https://www.codingame.com/ide/puzzle/power-of-thor-episode-1

import System.IO

f (tx:ty:x:y:_) =
    let
        (next_y, dv) = vertical y ty
        (next_x, dh) = horisontal x tx
    in
        (dv ++ dh) : f [tx,ty,next_x,next_y]

vertical y ty
    | y < ty = (y + 1, "S")
    | y > ty = (y - 1, "N")
    | otherwise = (y, "")

horisontal x tx
    | x < tx = (x + 1, "E")
    | x > tx = (x - 1, "W")
    | otherwise = (x, "")

main = interact $ unlines.f.map read.words
