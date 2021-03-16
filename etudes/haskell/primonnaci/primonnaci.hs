-- Pure calculation problem
-- Let's U_n be the n-th Fibonnaci number found as following:
-- U_0 = 0
-- U_1 = 1
-- U_{n+2} = U_{n+1} + U_{n}
--                                i :   0 1 2 3 4 5 6  7  8  9
--                                Ui:  [0,1,1,2,3,5,8,13,21,34]

-- Let's keep only the prime index of the sequence and let's call it Vn.
-- For example :
-- V_1 = U_2 = 1
-- V_2 = U_3 = 2
-- V_3 = U_5 = 5
-- V_4 = U_7 = 13

-- And now let's define the Primonnaci sequence :
-- P_1 = V_1 = 1
-- P_2 = V_2 = 2
-- P_{n+2} = P_{n+1} + P_{n} + V_{n+2}

-- The goal here is to find the n-th element.

main = interact $ show.(primonnaci !!).read

primonnaci = 0 : 1 : 2 : zipWith3 relation seqStart (tail seqStart) [3..]
    where
        seqStart = tail primonnaci
        -- P_{n+2} = P_{n+1} + P_{n} + V_{n+2}
        relation p1 p2 fpIndex = p1 + p2 + fibPrime !! fpIndex

fibPrime = 0 : map (fib !!) primes

fib = 0 : 1 : zipWith (+) fib (tail fib)

primes = fp [2..] where fp (p:xs) = p : fp [x | x <- xs, x `mod` p /= 0]
