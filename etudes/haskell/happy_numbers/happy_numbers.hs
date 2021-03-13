-- https://www.codingame.com/ide/puzzle/happy-numbers

main = interact $ unlines.map check.tail.lines

-- observation 1: there is a cycle 89 -> 145 -> 42 -> 20 -> 4 -> 16 -> 37 -> 58 -> 89
-- observation 2: all numbers converge to 1 or cycle from observation 1

check x
    | happy $ read x = x ++ " :)"
    | otherwise      = x ++ " :("
    where
        happy 1 = True
        happy 4 = False
        happy x = happy $ sum $ (^2).read.return <$> show x
