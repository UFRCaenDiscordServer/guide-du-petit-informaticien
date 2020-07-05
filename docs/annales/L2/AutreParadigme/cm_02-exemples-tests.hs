

-- Quelques fonctions utilisées au CM 02
--


power, power2, power3 :: Integer -> Integer -> Integer

power x n = if (n==0) then 1 else x * (power x (n-1))

-- en utilisant les gardes
power3 x n 
   | n == 0    = 1
   | odd n     = x * (power3 x (n-1))
   | otherwise = power3 (x * x) (div n 2)

-- en utilisant le pattern matching
power2 x 0 = 1
power2 x n = x * (power2 x (n-1))


-- 
fact :: Int -> Int
fact n = if (n == 0) then 1 else n*(fact (n-1))

factBis :: Integer -> Integer
factBis n = if (n == 0) then 1 else n*(factBis (n-1))


-- 
fibo, fibo2, fibo3 :: Integer -> Integer 

fibo n = if (n == 0) || (n == 1) 
         then 1 
         else fibo (n-1) + fibo (n-2)

-- en utilisant les gardes
fibo2 n 
   | n == 0    = 1
   | n == 1    = 1
   | otherwise = fibo2 (n-1) + fibo2 (n-2)

-- en utilisant le pattern matching
fibo3 0 = 1
fibo3 1 = 1
fibo3 n = fibo3 (n-1) + fibo3 (n-2)


-- 
negation :: Bool -> Bool

negation True = False
negation False = True


-- 
mustBeTheSame :: Double -> Bool
mustBeTheSame n = (sqrt n) * (sqrt n) == n

estIdentiqueBis :: Double -> Bool
estIdentiqueBis n = abs ((sqrt n) * (sqrt n) - n) < 1/10^10


-- 
sum1, sum2, sum3 :: [Int] -> Int

sum1 l = if (l == []) 
             then 0 
             else (head l) + (sum1 (tail l))

-- en utilisant les gardes
sum2 l 
   | (l == []) = 0
   | otherwise = (head l) + (sum2 (tail l))

-- en utilisant le pattern matching
sum3 [] = 0
sum3 (x:xs) = x + (sum3 xs)


-- 
lg1, lg2, lg3 :: [Int] -> Int

lg1 liste = if (liste == []) 
                then 0 
                else 1 + lg1 (tail liste)
                
-- en utilisant les gardes
lg2 l
   | (l == []) = 0
   | otherwise = 1 + (lg2 (tail l))

-- en utilisant le pattern matching
lg3 [] = 0
lg3 (x:xs) = 1 + (lg3 xs)


