
data Qtree a = Leaf a| Node (Qtree a) (Qtree a) (Qtree a) (Qtree a)
       deriving (Show, Ord, Eq)

q1 = (Node (Node (Leaf 11) (Leaf 12) (Leaf 13) (Leaf 14)) (Leaf 2) (Leaf 3) (Leaf 4))

q2 = (Node (Leaf 1) (Leaf 2) (Node (Leaf 31) (Leaf 32) (Node (Leaf 331) (Leaf 332) (Leaf 333) (Leaf 334)) (Leaf 34)) (Leaf 4))



-- 1. Traitement récursif des quadtrees (cas général)
--

nbLeaf :: (Qtree a) -> Int
nbLeaf (Leaf _)           = 1
nbLeaf (Node nw ne sw se) = nbLeaf nw + nbLeaf ne + nbLeaf sw + nbLeaf se

nbNode :: (Qtree a) -> Int
nbNode (Leaf _)           = 0
nbNode (Node nw ne sw se) = 1 + nbNode nw + nbNode ne + nbNode sw + nbNode se

profondeur :: (Qtree a) -> Int
profondeur (Leaf _)           = 0
profondeur (Node nw ne sw se) = 1 + maximum [profondeur nw, profondeur ne, profondeur sw, profondeur se]

showQtree :: Show a => (Qtree a) -> String
showQtree qs = showqt qs 0

showqt :: Show a => (Qtree a) -> Int -> String
showqt (Leaf x) i           = (vecteurDe i ' ') ++ (f x) ++ "\n"
showqt (Node (Leaf x1) (Leaf x2) (Leaf x3) (Leaf x4)) i
                            = (vecteurDe i ' ') ++ "Node " ++ concat (map f [x1,x2,x3,x4])++"\n"
showqt (Node nw ne sw se) i = (vecteurDe i ' ') ++ "Node \n"
                                    ++ showqt nw (i+4) 
                                    ++ showqt ne (i+4)
                                    ++ showqt sw (i+4)
                                    ++ showqt se (i+4)
-- reformuler l'equation pour 4 feuilles car pas tres joli
f :: Show a => a -> String
f x = "Leaf " ++ show x ++ " "




-- 2. Représenter des images a l'aide de quadtrees
-- 
data Pixel = B | N
     deriving (Show, Eq)

type Image = (Int, Qtree Pixel)

type Vecteur a = [a]

type Matrice a = [Vecteur a]

vecteurDe :: Int -> a -> (Vecteur a)
vecteurDe n x = [x | i <- [1..n]]

matriceDe :: Int -> a -> (Matrice a)
matriceDe n x = vecteurDe n (vecteurDe n x)

showPixel :: Pixel -> Char
showPixel B = '_'
showPixel N = 'N'


-- L’exemple présenté dans l’Annexe A
--
ne = (Node (Leaf B) (Node (Leaf B) (Leaf N) (Leaf N) (Leaf B)) (Node (Leaf B) (Leaf N) (Leaf N) (Leaf B)) (Node (Leaf B) (Leaf B) (Leaf B) (Leaf N)))
sw = (Node (Leaf B) ne1 (Leaf N) (Leaf B))
ne1 = (Node (Leaf B) (Leaf N) (Leaf N) (Leaf B))
q = (Node (Leaf B) ne sw (Leaf B))
m = [[B,B,B,N],[B,B,N,B],[N,N,B,B],[N,N,B,B]]



-- Questions du 2
--
reverseVideo :: Image -> Image
reverseVideo (k, qt) = (k, rev qt)
       where rev (Leaf x) = Leaf (oppose x)
             rev (Node nw ne sw se) = Node (rev nw) (rev ne) (rev sw) (rev se)
             oppose B = N
             oppose N = B

transposer :: Image -> Image
transposer (k, qt) = (k, trans qt)
       where trans (Leaf x)           = Leaf x
             trans (Node nw ne sw se) = Node (trans nw) (trans sw) (trans ne) (trans se)



-- 3. Représentation matricielle d’une image
-- 

q3 = (Node (Leaf B) (Node (Leaf B) (Leaf N) (Leaf B) (Leaf N)) (Leaf N) (Leaf B))

showMatrice :: (Matrice Pixel) -> String
showMatrice xss = concat [[showPixel x | x <- xs] ++ "\n" | xs <- xss]

qtreeToMatrice :: Image -> (Matrice Pixel)
qtreeToMatrice (k, qt) = qtm (2^k) qt

qtm :: Int -> (Qtree Pixel) -> (Matrice Pixel)
qtm k (Leaf x)           = matriceDe k x
qtm k (Node nw ne sw se) = merge4 (qtm k' nw) (qtm k' ne) (qtm k' sw) (qtm k' se)
              where k' = div k 2

merge4 :: (Matrice Pixel)->(Matrice Pixel)->(Matrice Pixel)->(Matrice Pixel)->(Matrice Pixel)
merge4 nw ne sw se = merge2 nw ne ++ merge2 sw se
             where merge2 xss yss = [xs++ys | (xs, ys) <- zip xss yss]

merge2 xss yss = [xs++ys | (xs, ys) <- zip xss yss]



-- 4. Des matrices vers les quadtrees
--

par4 :: (Vecteur (Qtree a)) -> (Vecteur (Qtree a)) -> (Vecteur (Qtree a))
par4      []        []      = []
par4 (nw:ne:qs) (sw:se:qs') = (Node nw ne sw se) : par4 qs qs'

parPavesDe4 :: (Matrice (Qtree a)) -> (Matrice (Qtree a))
parPavesDe4 []          = []
parPavesDe4 (xs:ys:qss) = par4 xs ys : parPavesDe4 qss

construit :: (Matrice (Qtree a)) -> (Qtree a)
construit [[qt]] = qt
construit qss    = construit (parPavesDe4 qss)

regroupe :: Eq a => (Qtree a) -> (Qtree a)
regroupe (Leaf x) = Leaf x
regroupe (Node x y z t) = simplifie (regroupe x) (regroupe y) (regroupe z) (regroupe t)

simplifie (Leaf x) (Leaf y) (Leaf z) (Leaf t)
   | x==y && x==z && x==t = Leaf x
   | otherwise            = Node (Leaf x) (Leaf y) (Leaf z) (Leaf t)
simplifie x y z t = Node x y z t

--
pixelToLeaf :: (Matrice a) -> Matrice (Qtree a)
pixelToLeaf xss = [[Leaf x|x <- xs] | xs <- xss]

-- 
taille :: (Matrice a) -> Int
taille xss = round (logBase 2 (fromIntegral (length (head xss))))

matriceToQtree :: (Matrice Pixel) -> Image
matriceToQtree xss = (taille xss, regroupe (construit (pixelToLeaf xss)))
  