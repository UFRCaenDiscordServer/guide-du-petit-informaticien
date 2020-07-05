

-- ARBRES non ETIQUETES
--

data Tree a = Tip a | Bin (Tree a) (Tree a)
          deriving Show

-- exemples de (Tree a) pour tester
--
a1 = (Bin (Bin (Tip 'a') (Tip 'b')) (Tip 'c'))
a2 = (Bin (Tip 5) (Bin (Bin (Tip 2) (Tip 4)) (Tip 6)))
a3 = (Bin a1 a1)
a4 = (Bin a2 a2)


nFeuilles :: Tree a -> Int
nFeuilles (Tip x)     = 1
nFeuilles (Bin t1 t2) = (nFeuilles t1) + (nFeuilles t2)


nbNoeuds :: Tree a -> Int
nbNoeuds (Tip x)     = 0
nbNoeuds (Bin t1 t2) = 1 + (nbNoeuds t1) + (nbNoeuds t2)


prof :: Tree a -> Int
prof (Tip x)     = 0
prof (Bin t1 t2) = 1 + max (prof t1) (prof t2)


lFeuilles :: Tree a -> [a]
lFeuilles (Tip x)     = [x]
lFeuilles (Bin t1 t2) = (lFeuilles t1) ++ (lFeuilles t2)


-- visu a1   ==> "(('a' 'b') 'c')"
-- visu a2   ==> "(5 ((2 4) 6))"

visu :: (Show a) => Tree a -> String
visu (Tip x) = show x
visu (Bin t1 t2) = "(" ++ (visu t1) ++ " " ++ (visu t2)  ++ ")"

        
                
-- ARBRES ETIQUETES
--

data Etiq a b = Leaf a | Node b (Etiq a b) (Etiq a b)
     deriving Show

e1 = (Node "+" (Node "*" (Leaf 12) (Leaf 7)) (Node "+" (Leaf 1) (Leaf 23)))

e2 = (Node '+' (Node '*' (Leaf 12) (Leaf 7)) (Node '+' (Leaf 1) (Leaf 23)))


visuEtiq :: (Show a) => (Show b) => (Etiq a b) -> [Char]
visuEtiq (Leaf x) = show x
visuEtiq (Node n t1 t2) = "(" ++ (visuEtiq t1) ++ show n ++ (visuEtiq t2) ++ ")"


unlabel :: Etiq a b -> Tree a
unlabel (Leaf x) = Tip x 
unlabel (Node _ t1 t2) =  Bin (unlabel t1) (unlabel t2)


trans :: Tree a -> Etiq a Int
trans (Tip x) = Leaf x
trans (Bin t1 t2) = Node (nf t1' + nf t2') t1' t2'
                    where t1' = trans t1
                          t2' = trans t2
                          nf (Leaf _)     = 1
                          nf (Node n _ _) = n       

