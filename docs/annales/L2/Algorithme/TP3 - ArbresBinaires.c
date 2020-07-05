
#include <stdio.h>
#include <stdlib.h>

/*  Définition de la structure de noeud  */
struct noeud{
  int valeur;
  struct noeud * gauche;
  struct noeud * droit;
};

/*  Définition du type arbre qui est un pointeur sur noeud  */
typedef struct noeud * arbre;


/*  On alloue un noeud  */
struct noeud* Noeud(int x,arbre g,arbre d){
	struct noeud* n;
	n = malloc(sizeof(struct noeud));
	n -> valeur = x;
	n -> gauche = g;
	n -> droit = d;
	return n;
}

// Vous pourrez utiliser les deux fonctions suivantes    
int hauteur(arbre A){
    // fonction qui calcul la hauteur d'un arbre binaire A
    if (A == NULL){ 
		return -1;
	}
	int hg = hauteur(A -> gauche);
	int hd = hauteur(A -> droit); 
	if (hg < hd){
		return 1 + hd;
	}
	else {
		return 1 + hg;
	}
 }

void afficheArbre(arbre A){
   // un affichage planaire de l'arbre


   
   void affichageProfondeur(arbre A,int profondeur){
      if (A == NULL){
         printf(" ");}
      else{
		  affichageProfondeur(A -> gauche,profondeur-1);
		  if (profondeur == 0)
			 printf("%d",A -> valeur);
		  else
			 printf(" ");
		  affichageProfondeur(A -> droit,profondeur-1);
	  }
	}
      
  if (A != NULL){
	int h = hauteur(A);
	for( int p = 0 ; p < h + 1 ; p++){
      affichageProfondeur(A,p); 
      printf("\n");
  }
}

}









/*
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

*/

int main() {
	
	
	
	arbre monArbre1 = Noeud(4,Noeud(1,Noeud(3,Noeud(6,NULL,NULL),NULL),Noeud(9,NULL,NULL)),Noeud(3,Noeud(2,Noeud(5,NULL,NULL),NULL),Noeud(7,NULL,NULL)));
	arbre monArbre2 = Noeud(5,NULL,Noeud(3,Noeud(1,Noeud(9,NULL,NULL),NULL),NULL) );
	
	printf("monArbre1 :\n");
	afficheArbre(monArbre1);

	printf("monArbre2 :\n");
	afficheArbre(monArbre2);

	
}
