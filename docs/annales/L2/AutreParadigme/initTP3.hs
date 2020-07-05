
-- TP3 : Arbres Binaires de Recherche (ABR)
--

data Btree a = Nil
             | Bin a (Btree a) (Btree a)
     deriving (Show, Ord, Eq)

-- Les 3 ABR donnés comme exemples dans l'énoncé 
--
a1 = (Bin 4 (Bin 3 (Bin 2 Nil Nil) Nil) (Bin 7 (Bin 6 Nil Nil) (Bin 8 Nil Nil)))

a2 = (Bin 4 (Bin 3 (Bin 1 Nil Nil) Nil) (Bin 8 (Bin 7 Nil Nil) (Bin 11 (Bin 9 Nil Nil) Nil)))

a3 = (Bin 40 (Bin 30 (Bin 20 (Bin 15 Nil Nil) (Bin 25 Nil Nil)) (Bin 35 Nil Nil)) (Bin 70 (Bin 60 (Bin 50 (Bin 45 Nil Nil) Nil) (Bin 65 Nil Nil)) (Bin 80 Nil Nil)))


-- Petit outil de visualisation (pour mieux comprendre)
--

voir :: (Show a) => (Btree a) -> IO()
voir t = putStr (visuTree t)

visuTree :: Show a => Btree a -> String
visuTree t = visu t 1
   where visu Nil n = ""
         visu (Bin y t1 t2) n = (visu t1 (n+5)) ++ 
                                [' ' | i <- [1..n]] ++ (show y) ++ ['\n'] ++
                                (visu t2 (n+5))


-- 1. Premiers Pas
--

a4 = Bin 10 a1 a3
a5 = Bin 17 a1 a3



-- 2. Appartenance d'un élément a un ABR
--
{- 
inBtree :: Ord a => a -> Btree a -> Bool
inBtree x Nil = False
inBtree x (Bin y t1 t2)
         | x < y     = 
         | x > y     = 
         | otherwise =
-}



-- 3. Insérer un élément dans un ABR
--

-- insere :: Ord a => a -> Btree a -> Btree a


{-
list2abr :: Ord a => [a] -> (Btree a)
list2abr [] = Nil
list2abr (x:xs) = insere x (list2abr xs)
-}



-- 4. Un ABR est-il équilibré ?
--
-- Constater qu'il y a des cas pathologiques (voir a6)
-- a6 = list2abr [1..10]


-- Version naive -- nombre pathologique d'appels à la fonction profondeur
--

{-
estEquilibre :: Btree a -> Bool
estEquilibre Nil = True
estEquilibre (Bin _ t1 t2) = (abs (profondeur t1 - profondeur t2) <= 1)
                             && estEquilibre t1
                             && estEquilibre t2
-}



-- 5. ABR portant des entiers : Suppression
--


join :: Btree Integer -> Btree Integer -> Btree Integer
join t1 Nil = t1
join Nil t2 = t2
join (Bin x u1 u2) t2 = Bin x u1 (join u2 t2)


{- 
delete :: Integer -> Btree Integer -> Btree Integer
delete x Nil =
delete x (Bin y t1 t2)
  |x < y = 
  |x > y = 
  |otherwise = 
-}


{- INDICATION pour définir la fonction delete1 

on pourra se servir de la fonction suivante :

join1 :: Btree Integer -> Btree Integer -> Btree Integer
join1 t1 Nil = t1
join1 Nil t2 = t2
join1 t1 t2  = Bin (minArbre t2) t1 (deleteMin t2)
-- ou bien join1 t1 t2 = Bin (maxArbre t1) (deleteMax t1) t2

-}


-- 6. Version efficace 
-- La profondeur d’un sous-arbre n’est calculée qu’une seule fois.

estEquilibreBis:: Btree a -> Bool
estEquilibreBis t = fst (aux t)

aux :: (Btree a) -> (Bool, Int)
aux Nil = (True, -1)
aux (Bin _ fg fd)
   | not eqg || not eqd || abs (htg - htd) > 1 = (False, 0)
   | otherwise                                 = (True, 1 + (max htg htd))
   where (eqg, htg) = aux fg
         (eqd, htd) = aux fd 

