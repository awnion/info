-- https://www.codingame.com/ide/puzzle/tree-paths
import Data.Map

main = interact $ unwords . f . fmap read . tail . words

f :: [Integer] -> [[Char]]
f (v : _ : edges) = ans $ path v dict
  where
    extract [] = []
    extract (p : l : r : es) = (l, (p, "Left")) : (r, (p, "Right")) : extract es
    dict = fromList $ extract edges
    ans [] = ["Root"]
    ans x = x

path v m
  | notMember v m = []
  | otherwise = let (vv, dir) = m ! v in path vv m ++ [dir]
