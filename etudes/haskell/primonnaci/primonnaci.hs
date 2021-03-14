-- Pure calculation problem
-- Let's U_n be the n-th Fibonnaci number found as following:
-- U_0 = 0
-- U_1 = 1
-- U_{n+2} = U_{n+1} + U_{n}

-- Let's keep only the prime index of the sequence and let's call it Vn.
-- For example :
-- V_1 = U_2
-- V_2 = U_3
-- V_3 = U_5
-- V_4 = U_7
-- etc..

-- And now let's define the Primonnaci sequence :
-- P_1 = V_1
-- P_2 = V_2
-- P_{n+2} = P_{n+1} + P_{n} + V_{n+2}

-- The goal here is to find the n-th element.


main :: IO ()
main = interact$show.p.read

p :: Int -> Int
p 1 = v 1
p 2 = v 2
p n = p (n-1) + p (n-2) + v n

v x = fib !! (primes !! (x - 1))

fib = 0 : 1 : zipWith (+) fib (tail fib)

primes = fp [2..] where fp (p:xs) = p : fp [x | x <- xs, x `mod` p /= 0]
