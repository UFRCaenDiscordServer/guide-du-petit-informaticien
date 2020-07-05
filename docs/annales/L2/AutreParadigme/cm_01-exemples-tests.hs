

-- Quelques fonctions utilisées au CM 01
--

square :: Int -> Int
square x = x*x

quad :: Int -> Int
quad x = square (square x)

quadBis :: Int -> Int
quadBis = square . square


smallest :: Int -> Int -> Int
smallest x y = if (x < y) then x else y

average :: Float -> Float -> Float
average x y = (x+y)/2


fact :: Int -> Int
fact n = if (n == 0) then 1 else n*(fact (n-1))


nbDigits :: Int -> Int
nbDigits n = if (n <= 9) then 1 else 1 + (nbDigits (div n 10))


diviseurs :: Int -> [Int]
diviseurs n = [i | i <- [1..n], (mod n i) == 0]

premier :: Int -> Bool
premier n = (diviseurs n) == [1,n]

lesPremiers :: Int -> [Int]
lesPremiers k = [n | n <- [1..k], premier n]

nbPremiers :: Int -> Int
nbPremiers k = length (lesPremiers k)

