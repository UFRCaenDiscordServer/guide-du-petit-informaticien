
type Facteur = Int
type Exposant = Int
type Couple = (Facteur, Exposant)
type Decomposition = [Couple]


--
-- Partie vue en CM 04

pfactors :: Int -> [Int]
pfactors n = pfactors' n primes
   where pfactors' x (p:ps)
            | p > x          = []
            | mod x p == 0   = p : (pfactors' (div x p) (p:ps))
            | otherwise      = pfactors' x ps

-- juste pour info, voici le type de pfactors' :: Int -> [Int] -> [Int]

--  
prep :: [Int] -> Decomposition
prep [] = []
prep (x:xs) = (x, (length (takeWhile (==x) (x:xs))) ) : (prep (dropWhile (==x) xs))

-- 
int2rep :: Int -> Decomposition
int2rep = prep . pfactors



-- 1.
--
-- rep2int, evalBis :: Decomposition -> Int



-- 2.
--
-- estPremier :: Decomposition -> Bool



-- 3.
--
-- pgcd, pgcdBis :: Decomposition -> Decomposition -> Decomposition



-- 4.
--
-- version récursive exactement sur le meme modèle que pgcd
-- ppcm :: Decomposition -> Decomposition -> Decomposition



-- 5.
--nbDiviseurs :: Decomposition -> Int



-- 6.
--
op :: Couple -> [Int] -> [Int]
op (x,n) ys = [(x^i) * y | i <- [0..n], y <- ys]


-- diviseurs :: Decomposition -> [Int]


-- 7.
primes :: [Int]
primes =  sieve [2 .. ]
       where sieve (p:xs) = p : (sieve [x | x <- xs, mod x p > 0])




