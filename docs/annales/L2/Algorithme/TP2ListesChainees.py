#coding:utf-8
class Noeud:
    def __init__(self,valeur,suivant=None):
        """constructeur de classe
        permet l'allocation de la mémoire requise et
        l'initialisation des données valleur et suivant de l'objet"""
        self.valeur = valeur
        self.suivant = suivant


def afficheListe(L):
    """affiche la valeur des noeuds de la liste L"""
    compteur = 1
    while L !=None:
        print ("Le noeud ", compteur, " a la valeur ",L.valeur)
        L = L.suivant
        compteur +=1
    print("")

def insererDebut(L,x):
    """ Fonction insérant un nouveau noeud de valeur x au début de la liste L """
   pass


def insererFinIt(L, x):
    """Fonction itérative insérant un nouveau noeud de valeur x à la fin de la liste L"""
   pass


def insererFinRec(L, x):
    """Fonction itérative insérant un nouveau noeud de valeur x à la fin de la liste L"""
    if L == None:
        return Noeud(x)
    L.suivant = insererFinRec(L.suivant, x)
    return L

def rechercheRec(L, x):
    """Fonction récursive retournant l'adresse (le pointeur sur le noeud) du premier noeud contenant la valeur x.
  On retourne NULL lorsque la liste ne contient pas la valeur x""" 
    pass 

def rechercheIt(L, x): 
"""Fonction itérative retournant l'adresse (le pointeur sur le noeud) du premier noeud contenant la valeur x.
  On retourne NULL lorsque la liste ne contient pas la valeur x""" 
    if L == None:
        return None
    tmp = L
    while tmp != None:
        if tmp.valeur == x:
            return tmp
        tmp = tmp.suivant
    return None


def insereApres(L, x, y):
""" Fonction insérant un nouveau noeud avec la valeur y après le premier noeud contenant la valeur x.
S'il n'y a pas de noeud contenant la valeur x, cette fonction ne fait rien.  
On utilise la fonction rechercheIt pour déterminer l'adresse du noeud contenant la valeur x  """ pass

def insereAvant(L, x, y):
    """Fonction insérant un nouveau noeud avec la valeur y avant le premier noeud contenant la valeur x.
S'il n'y a pas de noeud contenant la valeur x, cette fonction ne fait rien.  
Astuce : on reprend la fonction insereApres et on échange les valeurs x et y """
    pass
    
#Question 1 complétez la fonction insereDebut, testez cette fonction

#Question 2 complétez la fonction insereFinIt

#Question 3 complétez la fonction rechercheRec

#Question 4 complétez la fonction insereApres

#Question 5 complétez la fonction insereAvant

#Testez toutes ses fonctions

