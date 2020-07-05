
type Facteur = Int
type Exposant = Int
type Couple = (Facteur, Exposant)
type Decomposition = [Couple]



-- 1.
--
rep2int, evalBis :: Decomposition -> Int

rep2int xs = product [x^n | (x,n) <- xs]

evalBis [] = 1
evalBis ((x,n):xs) = (x^n) * (evalBis xs)



-- 2.
--
estPremier :: Decomposition -> Bool
-- on pourrait ajouter que le nombre 1 n'est pas un nombre premier 
-- estPremier [(1,_)] = False
estPremier [(_,1)] = True
estPremier (_:_)   = False



-- 3.
--
pgcd, pgcdBis :: Decomposition -> Decomposition -> Decomposition
pgcd [] _ = []
pgcd _ [] = []
pgcd ((k1,d1):p1) ((k2,d2):p2) 
   | k1 == k2 = (k1, min d1 d2) : (pgcd p1 p2)
   | k1  < k2 = pgcd p1 ((k2,d2):p2)
   | k2 < k1  = pgcd ((k1,d1):p1) p2

pgcdBis xs ys = [(x, min n1 n2) | (x,n1) <- xs, (y,n2) <- ys, x==y]



-- 4.
--
-- version récursive exactement sur le meme modèle que pgcd
ppcm :: Decomposition -> Decomposition -> Decomposition
ppcm [] ys = ys
ppcm xs [] = xs
ppcm ((k1,d1):p1) ((k2,d2):p2) 
   | k1 == k2 = (k1, max d1 d2) : (ppcm p1 p2)
   | k1 < k2  = (k1,d1): (ppcm p1 ((k2,d2):p2))
   | k2 < k1  = (k2,d2): (ppcm ((k1,d1):p1) p2)



-- 5.
nbDiviseurs :: Decomposition -> Int
nbDiviseurs xs = product [ (n+1) | (x, n) <- xs]


-- 6.
--
op :: Couple -> [Int] -> [Int]
op (x,n) ys = [(x^i) * y | i <- [0..n], y <- ys]

-- op distribue les puissances successives de x (entre 0 et n) sur ys
-- en particulier si ys est la liste des diviseurs d'un nombre k
-- alors op (x,n) ys est la liste des diviseurs du nombre (x^n)*k
--
-- une definition équivalente de op aurait pu être
-- op (x,n) ys = concat [map (* (x^i)) ys | i <- [0..n]]

diviseurs :: Decomposition -> [Int]
diviseurs [] = [1]
diviseurs (x:xs) = op x (diviseurs xs)



-- 7.
primes :: [Int]
primes =  sieve [2 .. ]
       where sieve (p:xs) = p : (sieve [x | x <- xs, mod x p > 0])

-- take n primes    ==> la liste des n premiers nombres premiers
---- takeWhile (<= n) primes    ==> la liste des nombres premiers inférieurs à n
---- length (takeWhile (<= n) primes)    ==>  la quantité de nombres premiers inférieurs à n
-- Exemples :
--     > length (takeWhile (<= 10000) primes)   ==>  1229 (i.e. entre 2 et 10 000, il y a 1229 nombres premiers)
--     > length (takeWhile (<= 100000) primes)   ==> 9592 




-- CE QUI SUIT SERA VU en CM (à la fin du CM 4)
--


-- 8.
pfactors :: Int -> [Int]
pfactors n = pfactors' n primes
   where pfactors' x (p:ps)
            | p > x          = []
            | mod x p == 0   = p : (pfactors' (div x p) (p:ps))
            | otherwise      = pfactors' x ps

-- juste pour info, voici le type de pfactors' :: Int -> [Int] -> [Int]

-- 9. 
prep :: [Int] -> Decomposition
prep [] = []
prep (x:xs) = (x, (length (takeWhile (==x) (x:xs))) ) : (prep (dropWhile (==x) xs))

-- 10.
int2rep :: Int -> Decomposition
int2rep = prep . pfactors

