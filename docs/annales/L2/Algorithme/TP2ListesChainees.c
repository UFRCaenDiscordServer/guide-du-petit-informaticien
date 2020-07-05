#include <stdio.h>
#include <stdlib.h>

/*  Définition de la structure de noeud  */
struct noeud{
  int valeur;
  struct noeud * suivant;
};

/*  Définition du type liste qui est un pointeur sur noeud  */
typedef struct noeud * liste;

/*  Fonction affichant les valeurs des noeuds d'une liste L  */
void afficheListe(liste L){
  int compteur = 1;
  while(L != NULL){
    printf("Le noeud %d a la valeur %d \n",compteur,L->valeur);
    compteur++;
    L = L->suivant;
  }
  printf("\n");
}

/*  Fonction calculant le nombre de noeud d'une liste L  
int nombreNoeuds(liste L){
  
}*/

/*  nouveauNoeud(x) crée une nouvelle liste contenant un noeud avec la valeur x et le suivant égal à NULL  */
liste nouveauNoeud(int x){
  liste L = malloc(sizeof(liste));  /* ou malloc(sizeof(struct noeud))  */
  L->valeur = x;
  L->suivant = NULL;
  return L;
}

/*  Fonction insérant un nouveau noeud de valeur x au début de la liste L  */
liste insereDebut(liste L, int x){
  liste tmp = nouveauNoeud(x);
  if (L == NULL)
    return tmp;
  else{
    tmp->suivant = L;
    return tmp;
  }
}

/*  Fonction récursive insérant un nouveau noeud de valeur x à la fin de la liste L  */
liste insererFinRec(liste L, int x){
 
}

/*  Fonction itérative insérant un nouveau noeud de valeur x à la fin de la liste L  */
liste insererFinIt(liste L, int x){
  if (L == NULL)
    return nouveauNoeud(x);
  liste tmp = L;
  while (tmp->suivant != NULL)
    tmp = tmp->suivant;
  tmp->suivant = nouveauNoeud(x);
  return L;
}

/*  Fonction retournant l'adresse (le pointeur sur le noeud) du premier noeud contenant la valeur x.
  On retourne NULL lorsque la liste ne contient pas la valeur x  */
liste rechercheIt(liste L, int x){
  if (L == NULL)
    return NULL;
  liste tmp = L;
  while (tmp != NULL){
    if (tmp->valeur == x)
      return tmp;
    tmp = tmp->suivant;
  }
  return NULL;
}

/*  Fonction insérant un nouveau noeud avec la valeur y après le premier noeud contenant la valeur x.
S'il n'y a pas de noeud contenant la valeur x, cette fonction ne fait rien.  
On utilise la fonction rechercheIt pour déterminer l'adresse du noeud contenant la valeur x  */ 
liste  insereApres(liste L, int x, int y){
  liste tmp = rechercheIt(L, x);
  if (tmp != NULL){
    liste tmp2 = tmp->suivant;
    tmp->suivant = nouveauNoeud(y);
    tmp->suivant->suivant = tmp2;
  }
  return L;
}

/*  Fonction insérant un nouveau noeud avec la valeur y avant le premier noeud contenant la valeur x.
S'il n'y a pas de noeud contenant la valeur x, cette fonction ne fait rien.  
Astuce : on reprend la fonction insereApres et on échange les valeurs x et y  */
liste insereAvant(liste L, int x, int y){
  
}

/*  Question 1 complétez la fonction nombreNoeuds  */

/*  Question 2 construisez une liste chaînée en utilisant plusieurs fois la fonction insererDebut  */

/*  Question 3 complétez la fonction insererFinRec, testez dans le main 
les fonctions insereFinRec et insererFinIt  */ 

/*  Question 4 examinez le code des fonctions rechercheIt insereApres et 
    complétez la fonction insereAvant  */

/*  Testez toutes ces fonctions dans le main */
