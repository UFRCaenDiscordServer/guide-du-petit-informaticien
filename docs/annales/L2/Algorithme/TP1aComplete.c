#include <stdio.h>
#define tailleMax 1000
#include <math.h>
int compteur;
#include <stdlib.h>
#include <time.h>


/* Question 1 écrivez une fonction qui affiche les éléments d'un tableau*/
/* void affiche_tableau(int *tab, int taille){
  -------
  }*/


/* Question 2 écrivez ne fonction qui remplit un tableau en demandant des valeurs à l'utilisateur*/
/*void remplissage(int *tab, int taille){
  -------
}
*/

/* Question 3 écrivez une fonction qui insère un élément dans un tableau trié 
   de sorte qu'il reste trié (voir le CM 1)*/
/*void insertion(int *tab, int taille, int x){
 ------------------
}
*/


/* Question 4 écrivez une fonction qui recopie les éléments d'un tableau tabNonTrie 
dans un tableau copieTriee de sorte que les éléments de copieTrie soient triés 
par ordre croissant*/
/* int * triInsertion(int *tabNonTrie, int *copieTriee,int taille){
  copieTriee[0] = tabNonTrie[0];
  for (int j=1; j<taille; j++){
    insertion(copieTriee, ----);
  }
  return copieTriee;
}
*/

/* Question 5 écrivez une fonction qui effectue une recherche dichotomique 
de la valeur x (voir le TD 1)
On supposera que tab est un tableau trié par ordre croissant
ajoutez un compteur que vous incrémenterez à chaque fois que vous recalculerez milieu
uilisez une variable globale pour compteur, la complexité de la fonction sera cette variable*/

int dichotomieAux(int *tab, int debut, int fin,int x){
if (debut > fin) return -1;// -1 signifie que x n'appartient pas au tableau
  int milieu = ----
  if (x == ----) return ----
  if (x < ----) return ----
  else return ----
}
*/

/* Question 6 déclarez les fonctions dans le main et testez les*/

/* Question 7 construisez un tableau tab avec 15 valeurs et triez ses éléments dans un autre tableau copie
Générez aléatoirement plusieurs fois un indice entre 0 et 14 et calculez la complexité de la recherche de l'élément en position indice.
Donnez la complexité minimale, maximale et celle en moyenne
*/

/* Question 8 remplacez les boucles for par des boucles sur des pointeurs */

/* Question 9 remplacer les tableaux par des pointeurs sur un entier et effectuez des allocations dynamiques*/

/* Question 10 reprenez la question 7 avec des tableaux de grande taille taille = 100, 1000, 10000
Construisez tab en générant les valeurs aléatoirement avec des valeurs entre 0 et tailleMax
Générez aléatoirement plusieurs fois un indice entre 0 et taille-1 et calculez la complexité de la recherche de l'élément en position indice.
Donnez la complexité en moyenne, comparez avec log_2(taille)
*/


