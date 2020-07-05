

data Formule = Var String
   | Non Formule
   | Imp Formule Formule
   | Et Formule Formule
   | Ou Formule Formule
   | Equi Formule Formule
       deriving (Eq, Show)

-- pour Tests
--
f1 = (Ou (Et (Var "c") (Var "d")) (Et (Var "a") (Var "b")))
f2 = (Imp (Var "d") (Ou (Var "c") (Non (Var "b"))))
f3 = (Equi  (Var "d") (Et (Var "c") (Var "d")))
f4 = (Imp (Non (Var "d")) (Ou (Var "c") (Var "b")))
f5 = (Non (Non (Var "a")))
f6 = (Imp (Non (Ou (Var "a") (Var "d"))) (Ou (Var "c") (Var "b")))

f2b = (Imp (Non (Var "d")) (Ou (Var "c") (Var "b")))



-- Q1
--
visuFormule :: Formule -> String
visuFormule (Var p)   = p
visuFormule (Non f)   = "~" ++ (visuFormule f)
visuFormule (Et g d)  = "(" ++ (visuFormule g) ++ " & " ++ (visuFormule d) ++ ")"
visuFormule (Ou g d)  = "(" ++ (visuFormule g) ++ " v " ++ (visuFormule d) ++ ")"
visuFormule (Imp g d) = "(" ++ (visuFormule g) ++ " => " ++ (visuFormule d) ++ ")"
visuFormule (Equi g d) = "(" ++ (visuFormule g) ++ " <=> " ++ (visuFormule d) ++ ")"



-- Q2 et Q3
--
elimine :: Formule -> Formule
elimine (Var p) = (Var p)
elimine (Non f) = (Non (elimine f))
elimine (Et g d) = (Et (elimine g) (elimine d))
elimine (Ou g d) = (Ou (elimine g) (elimine d))
elimine (Imp g d) = (Ou (Non (elimine g)) (elimine d))
elimine (Equi g d) = (Et (elimine (Imp g d)) (elimine (Imp d g)))



-- Q4, Q5 et Q6
-- 
ameneNon, disNon :: Formule -> Formule

ameneNon (Var p)   = (Var p)
ameneNon (Non f)   = disNon f
ameneNon (Et g d)  = (Et (ameneNon g) (ameneNon d))
ameneNon (Ou g d)  = (Ou (ameneNon g) (ameneNon d))

disNon (Var p)   = (Non (Var p))
disNon (Non f)   = ameneNon f
disNon (Et g d)  = (Ou (disNon g) (disNon d))
disNon (Ou g d)  = (Et (disNon g) (disNon d))



-- Q7
--
normalise :: Formule -> Formule
normalise (Et g d) = concEt (normalise g) (normalise d)
normalise (Ou g d) = developper (normalise g) (normalise d)
normalise f        = f

developper :: Formule -> Formule -> Formule
developper (Et g d) f = concEt (distri g f) (developper d f)
developper c f        = distri c f

distri :: Formule -> Formule -> Formule
distri b (Et g d) = (Et (Ou b g) (distri b d))
distri b f        = (Ou b f)

concEt :: Formule -> Formule -> Formule
concEt (Et g d) f = (Et g (concEt d f))
concEt g f        = (Et g f)


-- Q8
--
formeClausale :: Formule -> Formule
formeClausale = normalise . ameneNon . elimine



-- FIN PARTIE 1 
--


type Clause = [Formule]
type FormuleBis = [Clause]


-- Q9
--
formeClausaleBis :: Formule -> FormuleBis
formeClausaleBis = etToListe

etToListe :: Formule -> FormuleBis
etToListe (Et g d) = (ouToListe g) : (etToListe d)
etToListe f        = [ouToListe f]

ouToListe :: Formule -> Clause
ouToListe (Ou g d) = g:(ouToListe d)
ouToListe f        = [f]


-- Q10
--
neg :: Formule -> Formule
neg (Var x) = (Non (Var x))
neg (Non (Var x)) = (Var x)


-- Q11
--
sontLiees :: Clause -> Clause -> Bool
sontLiees [] ys = False
sontLiees (x:xs) ys = (elem (neg x) ys) || (sontLiees xs ys)


-- Q12
--
resolvante :: Clause -> Clause -> Clause
resolvante [] ys = ys
resolvante (x:xs) ys 
     | elem x ys       = resolvante xs ys
     | elem (neg x) ys = xs ++ (supprime (neg x) ys)
     | otherwise       = x : (resolvante xs ys)

-- suppression d'un ŽlŽment (quand on est sur qu'il y est)
--
supprime x (y:ys)
   | x == y    = ys
   | otherwise = y:(supprime x ys)


-- determiner la conclusion d'une sorite
--
deduire :: Formule -> Clause
deduire x = resoudre (head sorite) (tail sorite)
   where sorite = (formeClausaleBis (formeClausale x))

-- on tourne jusqu'à ce qu'on se débarrasse de toutes les clauses
resoudre :: Clause -> FormuleBis -> Clause
resoudre xs [] = xs
resoudre xs (ys:yss)
   | sontLiees xs ys  = resoudre (resolvante xs ys) yss
   | otherwise  = resoudre xs (yss ++ [ys])



-- exemple #1
--
exemple1 = (Et (Imp (Var "A") (Var "B"))
             (Et (Imp (Var "B") (Var "C"))
               (Et (Imp (Var "C") (Non (Var "D")))
                  (Et (Imp (Non (Var "D")) (Non (Var "E")))
                      (Imp (Non (Var "E")) (Var "F"))))))

-- exemple #2
--
exemple2 :: Formule
exemple2 = (Et (Imp (Non (Var "A")) (Var "B"))
             (Et (Imp (Var "C") (Non (Var "D")))
               (Et (Imp (Var "E") (Non (Var "F")))
                 (Et (Imp (Non (Var "D")) (Non (Var "B")))
                     (Imp (Var "A") (Var "F"))))))

-- autre formulation de exemple #2
--
a = "etre un exercice qui me fait ronchonner"
b = "etre un exercice que je comprends"
c = "etre parmi ces sorites"
d = "etre dispose regulierement, comme les exercices auxquels je suis habitue"
e = "etre un exercice facile"
f = "etre un exercice qui me donne  mal a la tete"

testBis = (Et (Imp (Non (Var a)) (Var b))
           (Et (Imp (Var c) (Non (Var d)))
               (Et (Imp (Var e) (Non (Var f)))
                   (Et (Imp (Non (Var d)) (Non (Var b)))
                       (Imp (Var a) (Var f))))))

-- exemple 3 - les bŽbŽs
--
bebe = Et (Imp (Var "bebe") (Non (Var "logique")))
          (Et (Imp (Var "tuer crocodile") (Non (Var "meprise")))
              (Imp (Non (Var "logique")) (Var "meprise")))

-- le meme exemple mais avec ordre different des clauses
bebe2 :: Formule
bebe2 = Et (Imp (Non (Var "logique")) (Var "meprise"))
         (Et (Imp (Var "bebe") (Non (Var "logique")))
             (Imp (Var "tuer crocodile") (Non (Var "meprise"))))

-- le meme exemple mais avec ordre different des clauses
bebe3 :: Formule
bebe3 = Et (Imp (Non (Var "logique")) (Var "meprise"))
         (Et (Imp (Var "tuer crocodile") (Non (Var "meprise")))
              (Imp (Var "bebe") (Non (Var "logique"))))


-- QUESTION BONUS
-- 

-- ModŽlisation calcul propositionnel

logiciens = (Et (Imp (Var "saint d'esprit") (Var "logiciens")) 
                (Et (Imp (Var "malade mental") (Non (Var "jure possible"))) 
                    (Et (Imp (Var "enfant") (Non (Var "logiciens"))) 
                        (Imp (Non (Var "malade mental")) (Var "saint d'esprit")))))

ecole = Et (Imp (Var "moins de douze ans") (Non(Var "interne")))
           (Et (Imp (Var "studieux") (Var "roux"))
               (Et (Imp (Var "externe") (Non (Var "helleniste")))
                   (Et (Imp (Var "paresseux") (Var "moins de douze ans"))
                       (Et (Imp (Non (Var "externe")) (Var "interne"))
                           (Imp (Non (Var "paresseux")) (Var "studieux"))))))
-- les dŽductions
--
-- Žcole : les hellŽnistes sont roux
--   > visuFormule (visu (deduire ecole))   -->   "(helleniste => roux)"
--
-- logiciens : un enfant ne peut pas tre jurŽ
--   > visuFormule (visu (deduire logiciens))   -->   "(enfant => ~jure possible)"


-- MatŽriel pour Questions non posŽes
-- Reformuler la rŽponse en faisant rŽ-appara”tre l'implication
--
visu [(Var x), (Non (Var y))] = Imp (Var y) (Var x)
visu [(Var x), (Var y)] = Imp (Non (Var x)) (Var y)
visu [Non (Var x), (Var y)] = Imp (Var x) (Var y)
visu [Non (Var x), Non (Var y)] = Imp (Var x) (Non (Var y))
--
-- Passage d'une clause vers une Formule : sans intŽrt pour ce DM
--
clauseToFormule :: Clause -> Formule
clauseToFormule [x] = x
clauseToFormule (x:xs) = (Ou x (clauseToFormule xs))

