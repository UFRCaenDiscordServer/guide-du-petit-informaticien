

-- TP 3 : Arbres Binaires de Recherche (ABR)
--

data Btree a = Nil
             | Bin a (Btree a) (Btree a)
     deriving (Show, Ord, Eq)

-- Les 3 ABR donnés comme exemples dans l'énoncé 
--
a1 = (Bin 4 (Bin 3 (Bin 2 Nil Nil) Nil) (Bin 7 (Bin 6 Nil Nil) (Bin 8 Nil Nil)))

a2 = (Bin 4 (Bin 3 (Bin 1 Nil Nil) Nil) (Bin 8 (Bin 7 Nil Nil) (Bin 11 (Bin 9 Nil Nil) Nil)))

a3 = (Bin 40 (Bin 30 (Bin 20 (Bin 15 Nil Nil) (Bin 25 Nil Nil)) (Bin 35 Nil Nil)) (Bin 70 (Bin 60 (Bin 50 (Bin 45 Nil Nil) Nil) (Bin 65 Nil Nil)) (Bin 80 Nil Nil)))


-- Petit outil de visualisation 

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

profondeur :: Btree a -> Int
profondeur Nil = -1
profondeur (Bin _ t1 t2) = 1 + max (profondeur t1) (profondeur t2)

prefixe, infixe, postfixe :: Btree a -> [a]
prefixe Nil = []
prefixe (Bin x t1 t2) = x : ((prefixe t1) ++ (prefixe t2))

infixe Nil = []
infixe (Bin x t1 t2) = (infixe t1) ++ [x] ++ (infixe t2)

postfixe Nil = []
postfixe (Bin x t1 t2) = (postfixe t1) ++ (postfixe t2) ++ [x] 



-- 2. Appartenance d'un élément a un ABR
--
inBtree :: Ord a => a -> Btree a -> Bool
inBtree x Nil = False
inBtree x (Bin y t1 t2)
         | x < y     = inBtree x t1
         | x > y     = inBtree x t2
         | otherwise = True



-- 3. Insérer un élément dans un ABR
--

insere :: Ord a => a -> Btree a -> Btree a
insere x Nil = Bin x Nil Nil
insere x (Bin y t1 t2)
    | x < y     = Bin y (insere x t1) t2
    | x > y     = Bin y t1 (insere x t2)
    | otherwise = Bin y t1 t2

-- d'un ABR vers une liste, et d'une liste vers un ABR
--

list2abr :: Ord a => [a] -> (Btree a)
list2abr [] = Nil
list2abr (x:xs) = insere x (list2abr xs)

trier :: Ord a => [a] -> [a]
trier = infixe . list2abr

-- Chemin/Branche de la racine à une feuille x dans un ABR t
-- avec comme hypothèse : on est sur que x appartient à t.

path :: Ord a => Btree a -> a -> [a]
path Nil x = []
path (Bin y t1 t2) x
         | x < y     = y:(path t1 x)
         | x > y     = y:(path t2 x)
         | otherwise = [y]

-- Si on lève l’hypothèse, alors il faut tester au préalable l’appartenance de x à l’ABR t
-- Si x n’appartient pas à t alors on renvoie [] par défaut.

pathBis :: Ord a => Btree a -> a -> [a]
pathBis t x = if (inBtree x t) then (path t x) else []



-- 4. Un ABR est-il forcément équilibré ?
--
-- Constater qu'il y a des cas pathologiques (voir a6)
a6 = list2abr [1..10]


-- Version naive -- nombre pathologique d'appels à la fonction profondeur
--
estEquilibre :: Btree a -> Bool
estEquilibre Nil = True
estEquilibre (Bin _ t1 t2) = (abs (profondeur t1 - profondeur t2) <= 1)
                             && estEquilibre t1
                             && estEquilibre t2
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



-- 5. ABR portant des entiers : Suppression
--

sommeArbre :: Btree Integer -> Integer
sommeArbre Nil = 0
sommeArbre (Bin x t1 t2) = x + sommeArbre t1 + sommeArbre t2



minArbre, maxArbre :: Btree Integer -> Integer

minArbre (Bin x Nil _) = x
minArbre (Bin _ t1 _) = minArbre t1
minArbre Nil = error "Appel de minArbre avec un arbre vide"

maxArbre (Bin x _ Nil) = x
maxArbre (Bin _ _ t2) = maxArbre t2
maxArbre Nil = error "Appel de maxArbre avec un arbre vide"



join :: Btree Integer -> Btree Integer -> Btree Integer
join t1 Nil = t1
join Nil t2 = t2
join (Bin x u1 u2) t2 = Bin x u1 (join u2 t2)



delete :: Integer -> Btree Integer -> Btree Integer
delete x Nil = Nil
delete x (Bin y t1 t2)
  |x<y = Bin y (delete x t1) t2
  |x>y = Bin y t1 (delete x t2)
  |otherwise = join t1 t2



deleteMin, deleteMax :: Btree Integer -> Btree Integer

deleteMin (Bin _ Nil t2) = t2
deleteMin (Bin x t1 t2) = Bin x (deleteMin t1) t2
deleteMin Nil = error "Appel de deleteMin avec un arbre vide"

deleteMax (Bin _ t1 Nil) = t1
deleteMax (Bin x t1 t2) = Bin x t1 (deleteMax t2)
deleteMax Nil = error "Appel de deleteMax avec un arbre vide"



delete1 :: Integer -> Btree Integer -> Btree Integer

delete1 x Nil = Nil
delete1 x (Bin y t1 t2)
  |x<y = Bin y (delete1 x t1) t2
  |x>y = Bin y t1 (delete1 x t2)
  |otherwise = join1 t1 t2

join1 :: Btree Integer -> Btree Integer -> Btree Integer
join1 t1 Nil = t1
join1 Nil t2 = t2
join1 t1 t2 = Bin (minArbre t2) t1 (deleteMin t2)
-- ou join1 t1 t2 = Bin (maxArbre t1) (deleteMax t1) t2
