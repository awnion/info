-- https://www.codingame.com/ide/puzzle/ways-to-make-change

main = interact $ show . last . solve . map read . words

solve (target : _ : coins) = foldr dp (1 : replicate target 0) coins

dp coin prev = res where
  res = take coin prev ++ zipWith (+) res (drop coin prev)


-- --
-- -- Dynamic programmin approach
-- --

-- main = interact $ show . last . solve . map read . words

-- solve (target : _ : coins) = foldr dp (1 : replicate target 0) coins
-- --                            ^        ^-- initial [1, 0, 0, 0, ...]
-- --                            ^-- join layers by dynamic programmin
-- dp coin prev = res where
--   res = take coin prev ++ zipWith (+) res (drop coin prev)
-- --      ^-- leave first 0..coin-1 as it is      ^
-- --                                              ^-- DP[x] = DP_prev[x] + DP[x - coin]
