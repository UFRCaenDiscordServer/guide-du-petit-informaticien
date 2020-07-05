#include <stdio.h>
#include <stdlib.h>
#include <time.h>




/* Cette fonction affiche un tableau "tab" de taille "taille" */
void affiche(int* tab, int taille){
	printf("{");
	for(int i = 0; i < taille-1; i++){
		printf("%d,",tab[i]);
	}
	if (taille > 0){
		printf("%d",tab[taille-1]);
	}
	printf("}\n");
}

/* Cette fonction renvoie un tableau d'entiers aléatoires de taille "taille" */
int* genereTableau(int taille){
	
	int* tab = malloc( taille * sizeof(int) );
	for ( int i = 0 ; i < taille ; i++ ) {
		tab[i] = rand() % taille;
	}	
	
	return tab;
}


/* Question 0. Ecrire une fonction tableauCroissant qui prend en paramètre un entier "taille",
 * et qui renvoie un tableau qui contient les entiers 1,2,3,4,...,taille (dans cet ordre).
 * On pourra s'inspirer de la fonction genereTableau.
 */

int* tableauCroissant(int taille){
	return NULL;
}


/* Question 0b. Ecrire une fonction swap qui prend en paramètre un tableau "tab"
 * et deux indices i et j. Cette fonction doit échanger les valeurs du tableau
 * qui sont à la position i et j.
 * 
 * Par exemple si t = {3,12,5,9}, alors swap(t,1,3) doit changer
 * le tableau t en {3,9,5,12}.
 */

void swap(int* tab, int i, int j);



/* ##########################   TRI SELECTION   ######################### */

/* Question 1) Ecrire la fonction triSelection
 * 
 * 1.a Ecrivez une fonction minimumTableau(tab,debut,fin) qui retourne
 * la position du minimium du tableau "tab" entre les positions debut (inclus) et fin (inclus) */
 
int minimumTableau(int* tab,int debut,int fin);

/* 1.b Ecrivez la fonction triSelection(tab,taille) qui renvoie le tableau "tab" trié en utilisant la fonction minimumTableau */

void triSelection(int* tab, int taille){
    for(int i = 0; i < taille ; i++){
        ;
	}
}

/* ##########################   TRI RAPIDE (Quick sort)   ######################### */

/* Question 2) Ecrire la fonction quickSort
 * 
 * 2.a) Ecrire la fonction partition qui prend en paramètres :
 *  - un tableau "tab"
 *  - une position (entière) "debut"
 *  - une position (entière) "fin"
 * qui modifie le tableau tab entre les positions debut et fin (inclus)
 * de sorte que si on pose pivot = tab[debut],
 * alors entre les positions "debut" et "fin", le tableau tab se subdivisera en 3 parties :
 * tab[debut..fin] = [ PARTIE1, pivot, PARTIE3 ] 
 * -PARTIE1 est constituée des entiers de tab qui sont inférieurs ou égaux à "pivot"
 * -PARTIE3 est constituée des entiers de tab qui sont supérieurs à "pivot"
 * De plus, la fonction partition renverra la nouvelle position du pivot
 * 
 * Par exemple, si t = { 18, 77, 42, 16, 31, 92, 50, 15, 60, 4 }
 * alors partition(t,2,9) modifiera t en { 18, 77, 16, 31, 15, 4, 42, 92, 60, 50}
 * et renverra 6. 
 * 
 * Indications : On lit le tableau de gauche à droite. 
 * On veut maintenir la partition quand on lit le tableau (autrement dit,
 * si on est à la position i, les éléments du tableau qui sont avant la position i sont bien partitionnés selon le pivot).
 * Appelons posPivot la position du pivot.
 * Dès que nous lisons un nouveau élément tab[i]:
 * -Soit il est plus que grand que le pivot et alors on ne fait rien car l'élément il est bien placé.
 * -Soit il est plus petit, et alors on effectue un échange cyclique de 3 valeurs :
 *    -tab[posPivot] est changé en tab[i]
 *    -tab[i] est changé en tab[posPivot+1]
 *    -tab[posPivot+1] est changé en la valeur du pivot
 * 
 * */
 
 
 int partition (int *tab, int debut, int fin) {
	 
	 int posPivot = debut;
	 for (int i = debut + 1; i < fin; i++){
		 ; //A compléter ici
	 }
	
	 return posPivot;
 }




/* 2.b Ecrire la fonction quickSortAux qui prend en paramètres :
 *  - un tableau "tab"
 *  - une position (entière) "debut"
 *  - une position (entière) "fin"
 * qui trie le tableau tab entre les positions debut et fin (inclus).
 * La fonction quickSort sera récursive et utilisera la fonction partition précédente. */
 
 void quickSortAux(int* tab, int debut, int fin);
 
 
 /* 2.c
 * N'oubliez pas de tester votre fonction quickSort dans le main, comme il a été fait pour triSelection. */
 void quickSort(int* tab, int taille);
        
        


 
/* ##########################  TRI RAPIDE ALEATOIRE (randomQuickSort)   ######################### */

/* Question 3. Modifiez la fonction quickSortAux précédente pour tirer aléatoirement le pivot.
 * Pour cela, 
 * 1) on tire aléatoirement i entre debut et fin
 * 2) on échange les éléments en position debut et i 
 * Ne modifiez pas la fonction partition ! 
 * Puis tester votre fonction */
 
void randomQuickSortAux(int* tab, int debut, int fin);
 

void randomQuickSort(int* tab, int taille);


/* ##########################   TRI FUSION   ######################### */

/* Question 4.a) Ecrivez la fonction fusion qui prend en paramètres deux tableaux triées et 
 * qui renvoie un nouveau tableau qui fusionne les deux tableaux triés. */
 
 
int* fusion (int* tab1, int taille1, int* tab2, int taille2);

/* Question 4.b) Ecrivez la fonction triFusionAux qui prend en paramètres 
 * un tableau, une position de début et une position de fin. 
 * La fonction partagera le tableau en 2, puis triera récursivement les deux sous-tableaux,
 * puis les fusionnera en un nouveau tableau qu'on renverra.
 * N'oubliez pas de libérer la mémoire relative aux deux sous-tableaux (fonction free) ! */

           
int* triFusionAux(int* tableau, int debut, int fin);


/* Question 4.c) Ecrivez la fonction triFusionAux qui prend en paramètres 
 * un tableau et une taille, et qui trie le tableau. 
 * On utilisera pour cela la fonction précédente et on procèdera à une recopie du tableau. */


void triFusion(int* tableau, int debut, int fin);




 
/* ##########################   Test tris   ######################### */
 
 
/* Cette fonction servira à tester la rapidité de vos programme de tri
 * Le premier argument est une "adresse" de fonction de tri
 * Le second argument est la taille du test
 * Pour appeller testTri, ne pas oublier l'esperluette '&' avant le nom de la fonction
 * Ex : testTri( &triFusion , 10000 )
 */
void testTri( void (*fonctionTri) (int* tab,int n), size_t taille_test){
	int* tab;
	clock_t t;
	//Test aléatoire
	tab = genereTableau(taille_test);
    t = clock(); 
    (*fonctionTri)(tab,taille_test);
    t = clock() - t; 
    free(tab);
    printf("La fonction de tri a mis %f secondes pour trier une entrée aléatoire de taille %ld.\n", ( (double) t)/CLOCKS_PER_SEC , taille_test);
    //Test liste triée
  	tab = tableauCroissant(taille_test);  
  	t = clock(); 
    (*fonctionTri)(tab,taille_test);
    t = clock() - t; 
    free(tab);
    printf("La fonction de tri a mis %f secondes pour trier une entrée aléatoire de taille %ld.\n", ( (double) t)/CLOCKS_PER_SEC , taille_test);
}





/* Fonction principale */


int main(){
	
	srand(clock()); // Initialisation de la graine pour le tirage des nombres pseudo-aléatoires
	
	int* tableau1;
	int n = 40; //taille du tableau en question
	
	tableau1 = genereTableau(n);
	printf("tableau1 :\n");
	affiche(tableau1,n); 
	
	printf("tableau1 trié (?) :\n");
	triSelection(tableau1,n);
	affiche(tableau1,n);
	
	testTri(&triSelection,10000);
	
}

