# -*- coding:utf-8 -*-

from random import randrange
from time import time
import sys
sys.setrecursionlimit(100000)


#le cout est le nombre de comparaisons entre deux éléments du tableau 
cout = 0
#cout est une variable globale, pour l'utiliser dans une fonction il faut ajouter global cout 


def generationEntree(taille):
    """ retourne un tableau de taille entiers dont les valeurs
    sont tirées aléatoirement dans l'intervalle [0,taille-1]"""
    res=[0]*taille
    for i in range(taille):
        res[i]=randrange(taille)
    return res



##########################   TRI SELECTION   #########################

## 1) Ecrire la fonction TriSelection

#Ecrivez une fonction minimumTableau(tableau,debut,fin) qui retourne
#la position du minimium de tab entre les position debut et fin
def minimumTableau(tab,debut,fin):
    global cout
    pass

#Ecrivez la fonction triSelection(tableau) en utilisant la fonction minimumTableau
def triSelection(tab):
    for i in range(len(tab)-1):
        pass

    
###########################  quickSort ###########################

#2) Ajouter le cout à la fonction partition   

def partition(tab,debut,fin):
    pivot=tab[debut]
    tmp = debut + 1
    positionPivot = debut
    while tmp <= fin:
        if tab[tmp] > pivot:
            tmp += 1
        else:
            tab[positionPivot] = tab[tmp]
            tab[tmp] = tab[positionPivot+1]
            tab[positionPivot+1] = pivot
            positionPivot += 1
            tmp +=1
    return positionPivot


def quickSort(tab,debut,fin):
    " tri du tableau dans l'intervalle [début,fin]"
    if debut < fin:
        positionPivot=partition(tab,debut,fin)
        quickSort(tab,debut,positionPivot-1)
        quickSort(tab,positionPivot+1,fin)

    
        
##########################  randomQuickSort   #########################

# 3) Modifiez la fonction quickSort pour tirer aléatoirement le pivot.


def randomQuickSort(tab,debut,fin):
    " tri du tableau dans l'intervalle [début,fin]"
    if debut < fin:
        #le pivot est tiré aléatoirement et mis en position debut 

        #1) tirez aléatoirement i entre debut et fin
        #2) échangez les éléments en position debut et i
    
        positionPivot=partition(tab,debut,fin)
        randomQuickSort(tab,debut,positionPivot-1)
        randomQuickSort(tab,positionPivot+1,fin)


        
##########################   TRI FUSION   #########################

## 4) Ecrivez la fonction fusion

def fusion(tab1, tab2):
    """ La fonction fusion retourne un tableau tab qui est la fusion de tab1 et tab2.
    On suppose que tab1 et tab2 sont deux tableaux triés """
    tab=[]
    i1=0; i2=0
    while i1 < len(tab1) and i2 < len(tab2):
        pass

            
def triFusion(tableau, debut, fin):
    global cout
    if debut < fin:
        milieu = (debut+fin)//2
        triFusion(tableau, debut, milieu)
        triFusion(tableau, milieu+1, fin)
        tableau[debut:fin+1]=fusion(tableau[debut:milieu+1],tableau[milieu+1:fin+1])


##########################   TEST   #########################                

## 5) Tester les temps d'exécution des différents tris
##        pour différentes tailles.

def testTriSelection(taille):
    global cout
    cout = 0
    debut = time()
    monTab = generationEntree(taille)
    triSelection(monTab)
    fin = time()
    print("Tri sélection")
    print("Tri de ",taille," entiers ", "durée : ", fin-debut, " coût : ",cout)

   
for taille in [10,100,1000,10000,100000,1000000]:
    if taille <= 10000: #pourquoi fait-on ce test ?
        testTriSelection(taille)
   
#6) Pour les plus rapides
# Reprenez en C un des algorithmes de tri
# Comparez les temps d'exécution entre les deux langages de programmation

