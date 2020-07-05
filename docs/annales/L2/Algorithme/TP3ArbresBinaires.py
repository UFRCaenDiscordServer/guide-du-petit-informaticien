# -*- coding: utf-8 -*-

###########################    Arbre Binaire    ###########################

#La classe Noeud permet de construire un nouveau noeud
#Par défaut, les sous-arbres guche et droit sont égaux à None
class Noeud(object): 
   def __init__(self, element, gauche=None, droit=None): 
      self.valeur = element 
      self.gauche  = gauche
      self.droit = droit

#Vous pourrez utiliser les deux fonctions suivantes    
def hauteur(A):
    """fonction qui calcul la hauteur d'un arbre binaire a"""
    if A == None: return -1
    return 1+max(hauteur(A.gauche),hauteur(A.droit))

def dessinArbre(A,decalage=1):
   """un affichage planaire de l'arbre"""
   if A == None:
      return ""
   
   def affichageProfondeur(A,profondeur):
      if A == None:
         return " "
      ligne = affichageProfondeur(A.gauche,profondeur-1)
      if (profondeur == 0):
         ligne += str(A.valeur)
      else:
         ligne += " "
      return ligne + affichageProfondeur(A.droit,profondeur-1)

   chaine = ""
   for p in range(hauteur(A)+1):
      chaine += affichageProfondeur(A,p) + '\n'

   return chaine

#Vous testerez toutes les fonctions sur les deux arbres suivants
#ou d'autres arbres que vous définirez vous-mêmes

monArbre1 = Noeud(4,Noeud(1,Noeud(3,Noeud(6)),Noeud(9)),Noeud(3,Noeud(2,Noeud(5),None),Noeud(7)))
monArbre2 = Noeud(4,None,Noeud(3,Noeud(2,Noeud(1),Noeud(5)),None))

print("Premier arbre : \n" + dessinArbre(monArbre1)+"\n")
print("Second arbre : \n" + dessinArbre(monArbre2)+"\n")

#Exercice 1. Parcours en profondeur sur un arbre binaire
#1.a Ecrivez une fonction qui affiche les valeurs des noeuds d'un arbre  binaire dans l'ordre préfixe.
#1.b Ecrivez une fonction qui affiche les valeurs des noeuds d'un arbre  binaire dans l'ordre infixe.
#1.c Ecrivez une fonction qui affiche les valeurs des noeuds d'un arbre  binaire dans l'ordre suffixe.

#Exercice 2. Ecrivez une fonction qui retourne le nombre de noeuds internes d'un arbre  binaire.
#Proposez deux fonctions
#2.a on teste si l'arbre est vide dans la fonction
#2.b on teste si l'arbre est vide avant d'appeler la fonction 
#; et dans ce cas-là, on traite les cas "arbre gauche vide"/"arbre droit vide" à l'intérieur de la fonction

#Exercice 3. Ecrivez une fonction estDegenere qui détermine si un arbre binaire est dégénéré
#On rappelle qu'un arbre est dégénéré lorsque tout noeud a au plus un fils.

#Exercice 4. Ecrivez une fonction afficheNiveau(A,k) qui affiche les noeuds du niveau k
#Indication : pendant les appels récursifs k diminue et correspond à la longueur de chemin à parcourir
#pour atteindre un noeud de profondeur k, nous avons trois cas :
#cas 1) A = None et on ne fait rien
#cas 2) k = 0 le noeud est de profondeur k et on l'affiche
#cas 3) k > 0 des noeuds de profondeur k peuvent se trouver dans les sous-arbres gauche et droit
#on effectue deux appels récursifs sur les deux sous-arbres

#Exercice 5. Ecrivez une fonction affichageLargeur qui affiche les valeurs des noeuds d'un arbre binaire
#en suivant le parcours en largeur
#Vous utiliserez impérativement les fonctions hauteur et afficheNiveau

#Exercice 6. On rappelle que la longeur de cheminement d'un arbre binaire est
#la somme des profondeurs de tous les noeuds de cet arbre.
#Ecrivez une fonction longueurCheminement(A,prof=0) qui calcule la longueur de cheminement
#d'un arbre binaire A.
#On appelle la fonction sur l'arbre A avec l'instruction longueurCheminement(A) qui
#met la variable prof à 0 (la racine est de profondeur 0)
#nous avons ensuite deux cas
#cas 1) A = None, déterminez ce que la fonction doit retourner
#cas 2) A != None, on retourne le profondeur du noeud sur lequel on se trouve +
#la longueur de cheminement des deux sous-arbres gauche et droit

#Exercice 7. Un chemin décroissant dans un arbre est un chemin partant de la racine
#dans lequel la valeur des noeuds décroît au fur et à mesure qu'on descend dans l'arbre.
#Un chemin décroissant ne s'arrête pas forcément à une feuille.
#Par exemple, dans monArbre1, il y a deux chemins décroissants :
# 4-3-2 et 4-1.
# 7.a)  Ecrivez une fonction qui renvoie la longueur du PLUS LONG chemin décroissant dans un arbre A
# 7.b) (*) Ecrivez une fonction qui affiche le plus long chemin chemin décroissant dans un arbre A



