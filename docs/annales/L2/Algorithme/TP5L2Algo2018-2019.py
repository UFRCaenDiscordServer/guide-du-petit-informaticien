# -*- coding:utf-8 -*-


######################    Arbre Binaire de Recherche    ######################

class Noeud(object): 
  def __init__(self, element, gauche = None, droit = None): 
    self.valeur = element 
    self.gauche  = gauche
    self.droit = droit


unABR=Noeud(13,Noeud(7,Noeud(3,Noeud(0),Noeud(5)),Noeud(10,Noeud(8),None)),Noeud(23,Noeud(15),None))

unABR2=Noeud(20,Noeud(15,None,Noeud(17)),Noeud(23,Noeud(22,Noeud(21),None),Noeud(27)))


def dessinArbre(A,decalage=2):
  "un affichage planaire de l'arbre a  modulo une rotation à 90°"
  if A == None:return ""
  return dessinArbre(A.droit,decalage+5)+' '*decalage+str(A.valeur)+'\n'+dessinArbre(A.gauche,decalage+5)
 
print(dessinArbre(unABR))
print(dessinArbre(unABR2))



# 1. Écrivez une fonction minimumABR(A) qui retourne un pointeur sur le noeud de valeur minimale d'un ABR A
#La fonction retourne None lorsque l'arbre est vide).

def minimumABR(A):
  pass

#print ("Question 1: minimum de l'ABR:", minimumABR(unABR).valeur)
#print("")
    
# 2. Écrivez une fonction itérative presentABR(A, x) qui prend en argument un ABR A et un entier x
# et détermine si l'élément x est présent ou non dans l'ABR a
#La fonction retourne un pointeur sur le noeud contenant la valeur x si x est présent
#et sinon retourne None 


def presentABR(A, x):
  pass
#print ("Question 2, test de la fonction presentABR")
#print ("La valeur ", 9, presentABR(unABR,9)!=None)
#print ("La valeur ", 12, presentABR(unABR,12)!=None)
#print()

# 4. Écrire une fonction afficheCroissantABR(A) qui affiche  les valeurs des noeuds
#d'un ABR A dans l'ordre croissant.

def afficheCroissantABR(A):
  pass

#afficheCroissant(unAbr)
    
# 3. Écrivez une fonction récursive insereFeuilleABRRec(A, x) qui renvoie l'ABR a enrichi de l'élément x
# inséré au niveau des feuilles.
#Lorsque x est déjà dans l'arbre, la fonction ne modifie pas l'ABR.
#Écrivez la même fonction de manière itérative (complétez la fonction ci-dessous)

def insereFeuilleRec(A, x):
  pass

def insereFeuilleIt(A,x):
  if A == None:
     return Noeud(x)
  tmp = A
  while tmp != None:
    if x < tmp.valeur:
      if tmp.gauche == None:
        pass
        #tmp.gauche = 
      else:
        pass
        #tmp = 
    elif x > tmp.valeur:
      if tmp.droit == None:
        pass
        #tmp.droit = 
      else:
        pass
        #tmp = 
    else:#x est déjà présent
      return A
  return A

#unABR = insereFeuilleRec(unABR, 9)
#unABR = insereFeuilleIt(unABR, 1)
#unABR = insereFeuilleIt(unABR, 24)

#print( "Question 4: Afficher un ABR en ordre croissant")
#afficheCroissantABR(unABR)
#print()

# 5. Écrivez une fonction récursive afficheIntervalle(a, debut, fin)
#    qui affiche toutes les valeurs x de l'ABR a telles que deb <= x <= fin.
#    Évitez les parcours de sous-arbres inutiles.

def afficheIntervalle(A, debut, fin):
  pass

# print ("Question 5: Affichage d'un intervalle de valeurs de l'ABR")
# print ("Elements de l'ABR entre 6 et 13:")
# afficheIntervalle(unABR,6,13)
# print ("Elements de l'ABR entre 6 et 20:")
# afficheIntervalle(unABR,6,20)
# print("\n")

# 6. On souhaite définir une fonction rechercheKieme(A,k)
# qui retourne la kième plus petite valeur d'un ABR A, pour un entier k >= 1.
# Le principe est d'effectuer un parcours infixé.
# On part de i = k et on décrémente ensuite i lors de la visite de chaque noeud.
#Lorsque l'on arrive à i = 0, la valeur du noeud courant est la kième plus petite valeur de A.

# Les appels de la fonction sont de la forme rechercheKieme(B,i),
#où B est un sous-arbre de A et i est le nombre de noeuds qu'il reste à parcourir suivant le parcours infixe 
#La fonction retourne alors deux entiers (v,j).
#Si j = 0 alors v est la kième plus petite valeur de A.
#Sinon j est le nombre de noeuds qu'il reste à parcourir et v vaut -1.
# on considérera les cas suivants
# si B = None l'arbre A possède moins de k noeuds et v vaut -1
# sinon on effectue un appel récursif sur le sous-arbre gauche et on récupère le couple (v,j) 
# si j = 0 alors v est la valeur recherchée
# si j = 1 alors alors nous sommes sur le kième noeud
# si j > 1 alors on continue sur le sous-arbre droit 

def rechercheKieme(A,k):
  pass

# print ("Question 6: Recherche du k-ème élément d'un ABR")
# print ("5eme element:", rechercheKieme(unABR,5))
# print ("11eme element:", rechercheKieme(unABR,11))
# print ("15eme element:", rechercheKieme(unABR,15))
# print("\n")

#Pour les plus rapides 

#7. écrivez une procédure coupeSelon(A,x) qui, pour un ABR A et un élément x
#    (présent ou non dans A),retourne deux ABR:
#    un ABR contenant les éléments de A strictement inférieurs à x
#    et un ABR contenant les éléments de A strictement supérieurs à x.
#    Quels noeuds de A sont visités par la procédure coupeSelon(A,x)?

def coupeSelon(A,x):
  pass

# inf,sup = coupeSelon(unABR,9)
# print("Coupe selon 9")
# print(dessinArbre(inf))
# print ("\n \n")
# print(dessinArbre(sup))


# 8. écrivez une procédure insereAlaRacine(A,x) qui retourne l'ABR A
#    où on ajoute l'élément x comme racine.
#    Vous utiliserez pour cela la procédure coupeSelon.

def insereAlaRacine(A,x):
  pass

# print ("\n \n")
# print("On insère 12 à la racine") 
# B = insereAlaRacine(unABR,12)
# print("On affiche B")
# print(dessinArbre(B))

# 9. Complétez la procédure récursive fusion(A,B) qui retourne l'ABR
#    qui est la fusion des ABR A et B.
#    Vous utiliserez pour cela la procédure coupeSelon.

def fusion(A,B):
  if A == None:
    return B
  if B == None:
    return A
  inf,sup = coupeSelon(B,A.valeur)
  #A.gauche = 
  #A.droit = 
  return A


unABR=Noeud(13,Noeud(7,Noeud(3,Noeud(0),Noeud(5)),Noeud(10,Noeud(8),None)),Noeud(23,Noeud(15),None))
unABR2=Noeud(20,Noeud(15,None,Noeud(17)),Noeud(23,Noeud(22,Noeud(21),None),Noeud(27)))


# print("\n")
# print("Fusion des deux arbres unABR et unABR2")
# C = fusion(unABR,unABR2)
# print("On affiche C")
# print(dessinArbre(C))






