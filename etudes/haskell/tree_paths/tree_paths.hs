-- https://www.codingame.com/ide/puzzle/tree-paths
import Data.Map

main = interact $ unwords.f.fmap read.words

makeMap [] m = m
makeMap (p:l:r:rest) m = insert r (p, "Right").insert l (p, "Left").makeMap rest $ m

f :: [Integer] -> [[Char]]
f (_:v:_:es)
    | p == [] = ["Root"]
    | otherwise = p
    where
        m = makeMap es empty
        p = path v m

path v m
    | notMember v m = []
    | otherwise = let (vv, dir) = m ! v in path vv m ++ [dir]
