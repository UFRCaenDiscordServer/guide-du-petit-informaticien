# -*- coding: utf-8 -*-
from math import *



# Question 1
# La structure de tableau est implémentée par le type "liste" du langage Python.
# À ne pas confondre avec les listes chaînées
# qui ne sont pas directement implémentées en Python,
# et que l'on devra implémenter à la main (prochain TP).
T=[100,200,300,3.14,'bonjour']

# Afficher ce tableau en utilisant juste la fonction print
# puis sauter une ligne


# Afficher la longueur de cette liste, en utilisant la fonction len
# puis sauter une ligne



# Écrivez maintenant une fonction affichetableau
# qui affiche les éléments du tableau, un sur chaque ligne.
# On utilisera la fonction len et une boucle for
# et la fonction range.
# Puis testez-la sur le tableau T précédent


# Faire de même avec une boucle while, en appelant votre
# fontion affichetableautantque




# Question 2

# Écrivez une fonction qui remplit un tableau de n nombres en demandant des valeurs à l'utilisateur
# L'utiliser pour créer un tableau de 3 nombres 10,20,30 (pas des chaînes de caractères)



# V=remplittableau(3)




# Question 3 écrivez une fonction qui insère un élément dans un tableau trié 
#   de sorte qu'il reste trié (voir le CM 1), par la méthode naïve
# puis insérer successivement les nombres 23,5,47,12 dans le tableau V précédent




# Question 4
# écrivez une fonction qui recopie les éléments d'un tableau tabNonTrie 
# dans un tableau copieTriee de sorte que les éléments de copieTriee
# soient triés par ordre croissant



# Question 5 Écrivez une fonction récursive qui effectue une recherche dichotomique 
# de la valeur x (voir le TD 1)
# On supposera que tab est un tableau trié par ordre croissant
# ajoutez un compteur que vous incrémenterez à chaque fois que vous recalculerez milieu
# utilisez une variable globale pour compteur, la complexité de la fonction sera cette variable




# Question 6
# construisez un tableau tab avec 15 valeurs aléatoires entre 0 et 1000
# (importer la fonction randint du module random)
# et triez ses éléments dans un autre tableau copie
# Afficher les deux tableaux
# Générez aléatoirement plusieurs fois un indice entre 0 et 14 et calculez la complexité de la recherche de l'élément en position indice.
# Donnez la complexité minimale, maximale et celle en moyenne



 
# Question 7
# Générer de même des tableaux triés de taille plus grande : 100,1000,peut-être 10000 (prudence)
# Générez aléatoirement plusieurs fois un indice entre 0 et taille-1 et calculez la complexité de la recherche de l'élément en position indice.
# Donnez la complexité en moyenne, comparez avec log_2(taille)


