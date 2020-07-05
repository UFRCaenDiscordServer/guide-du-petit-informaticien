

-- 1. Les carres
--

square :: Int -> Int
square x = x * x

sumSquares :: Int -> Int -> Int
sumSquares x y = (square x) + (square y)

-- somme des carres des 3 nombres moins le carre du minimum
--
sumSquaresMax :: Int -> Int -> Int -> Int
sumSquaresMax x y z = (square x) 
                      + (square y) 
                      + (square z) 
                      - (square (min (min x y) z))



-- 2. Conversion Celsius <--> Fahrenheit
--

c2f :: Float -> Float
c2f c = 9 / 5 * c + 32

f2c :: Float -> Float
f2c f = 5 / 9 * (f - 32)



-- 3. Remboursement selon tarifs kilometriques 
--

reductionRate :: Float -> Float
reductionRate nbPers 
   | nbPers < 2  = 0
   | nbPers < 5  = 0.25
   | nbPers < 11 = 0.50
   | otherwise   = 0.75

travelExpenses :: Float -> Float -> Float
travelExpenses nbKms nbPers = 0.52 * nbKms * nbPers * (1 - (reductionRate nbPers))



-- 4. Next Upper Case
--

decode :: Int -> Char
decode n = toEnum n

code :: Char -> Int
code c = fromEnum c

nextUpperCase :: Char -> Char
nextUpperCase c = if (c == 'Z') then 'A' else (decode ((code c) + 1 ))



-- 5. Collatz function
--

collatz :: Int -> Int
collatz n 
   | n == 2    = 1
   | even n    = div n 2
   | otherwise = 3 * n + 1


nbCalls :: Int -> Int
nbCalls n
   | n == 1    = 0
   | otherwise = 1 + (nbCalls (collatz n))

-- on aurait pu utiliser un « if then else »
-- if (n == 1) then 0 else (1 + (nbCalls (collatz n)))
--
-- autre ecriture en utilisant le pattern-matching sur les Int
--
-- nbCalls 1 = 0
-- nbCalls n = 1 + (nbCalls (collatz n))


syracuse :: Int -> [Int]
syracuse n
   | n == 1    = []
   | otherwise = n : (syracuse (collatz n))

-- on aurait pu utiliser un « if then else »
-- if (n == 1) then [] else (n : (syracuse (collatz n)))
--
-- autre ecriture en utilisant le pattern-matching sur les Int
--
-- syracuse 1 = []
-- syracuse n = n : (syracuse (collatz n))


nbCallsBis :: Int -> Int
nbCallsBis n = length (syracuse n)


-- si la conjecture de Collatz est fausse alors les fonctions syracuse et nbCalls peuvent ne pas terminer.



-- 6. Tous pairs
--

allEven :: [Int] -> Bool
allEven []     = True
allEven (x:xs) = (even x) && (allEven xs)



-- 7. rire
--

laugh :: Int -> String
laugh n
   | n == 0    = ""
   | otherwise = "HA " ++ (laugh (n-1))


-- on aurait pu utiliser un « if then else »
--
-- autre ecriture en utilisant le pattern-matching sur les Int
--
-- laugh 0 = ""
-- laugh n = "HA " ++ laugh (n-1)



-- 8. Doubler cas general ++ cas particulier
-- 

-- Le cas general
doubleG :: [a] -> [a]
doubleG []     = []
doubleG (x:xs) = x:(x:(doubleG xs))

-- Mais,pour l'exo, il faut aplatir les String par concatenation
--
double :: [String] -> String
double []     = ""
double (x:xs) = x ++ " " ++ x ++ " " ++ (double xs)


-- 9.
--

sumSquareEven :: Int -> Int
sumSquareEven n = sum [x*x | x <- [1..2*n], even x]



-- 10.
-- Quicksort (en prenant comme pivot le 1er element de la liste)

mystery :: [Int] -> [Int]
mystery []     = []
mystery (x:xs) = mystery [y | y <- xs, y <= x] 
                 ++  [x] 
                 ++ mystery [y | y <- xs, y > x]

