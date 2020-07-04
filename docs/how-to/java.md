# Java

[retour à l'accueil](../)

# Table des matières

 - [How to java](#how-to-java)
	 1. [Les bases d'une classe](#les-bases)
		- [Naming et structure de fichiers](#naming-et-structure)
		- [Le fichier main](#le-fichier-main)
		- [Les modificateurs d'accès](#les-modificateurs)
		- [Les méthodes](#méthodes)
		- [Les variables](#variables)
		- [Les tableaux](#les-tableaux)
	2. [Aller plus loin](#aller-plus-loin)
		- [Notion de classe abstraite et héritage](#les-class-abstraites-et-l-héritage). 
		- [Comment utiliser une classe](#la-manipulation-de-class)
		
## Les bases

### Naming et structure

```java
package <Nom_du_package>.<sous-dossier>.<etc>; // Convention de naming : comme pour les variables.

import <Chemin_vers_class_dans_un_sous_dossier>.;<Nom_de_la_classe> // Pour importer une classe ou une de ses méthodes, ne pas mettre l'extension à la fin.

// ou 

import <librairie_de_java(class)>.; // .* pour toutes les méthodes de la class, ou .<nom_de_la_méthode> si vous la connaissez.

public class NomDeLaClasse {
	
	// L'espace défini pour les variables relatives a l'objet.
	private int nombre = 5;
	/*
	* Définition du constructeur, qui initialisera les données de la classe comme les variables et autres instructions.
	* @param unParametre La convention veux que l'on nomme une variable en commencant par une minuscule, puis séparé les "mots" par des majuscules, ou des '_' suivi du mots dont l'initial est en majuscule, exemple : "un_Nom_De_Variable_Correct", "unNomCorrect", "un-Nom-OK"
	*/
	public NomDeLaClasse(boolean unParametre) {
		// instructions.
		// variables spécifiques à la méthode si non précédé de this
	}
}
```
### Les modificateurs
Un modificateur d'accès est se qui définit la portée par laquelle la variable ou fonction peut être utilisé.
Dans le code, ce sont les mots clefs tels que : `public` `protected` & `private` ou rien.

`public` : Grossièrement la portée est générale, on peut accéder a ce qui est référé ensuite de n'importe où.

`protected` : La portée est limitée a toutes les classes étant dans le même package que la références précédé de `protected`, de même que les class héritant de la classe possèdant la méthode ou variable 'protégée'.

`private` : La portée est ici limitée uniquement à la classe elle-même, il faudra définir des accesseurs et des  

*Rien* : La portée est limité à toute les classes dans le même package

Pour plus d'informations, se référer à la [documentation correspondante](https://fr.wikibooks.org/wiki/Programmation_Java/Modificateur) dans laquelle est aussi référer les informations sur les mots clefs `abstract`, `static`, `final` ou d'autre non vus en cours. 

### Méthodes

Il existe deux sortes de méthodes (fonctions), celles attendant un type spécifiques de return, et celles exécutant simplement une suite d'instructions.
```java
public void functionSansReturn() {
	// instructions..
	// Vous pouvez utilisez return; pour arréter l'execution de la méthode sans retourner de résultat
}

public int functionAvecReturn() {
	// instructions..
	return 5; // int attendu ici, on change le type attendu lors de la déclaration de la méthode en fonction du besoin.
}
```

### Variables

Une variable se définit d'abord par son `modificateur d'accès`, puis son `type` ( `int`, `float`, `etc` ( Voir la [documentation sur les types.](https://fr.wikibooks.org/wiki/Programmation_Java/Types_de_base) )), puis son nom et ensuite optionnellement sa valeur.

Dans le cas ou celle ci se trouverais dans une méthode, et qu'elle n'est précédé d'aucun modificateur d'accès, la portée de la variable sera alors interne à la méthode ou class ou accolade / condition dans laquelle elle se trouve.

```java
public class UneClass{
	public float nbDecimal = 3.5f;
	// nbDecimal est accessible dans toute la class et peut aussi être lu / modifié n'importe ou grâce à son modificaeur (public)
	public void uneMethode(){
		int var = 5;
		// var et nbDecimal sont accessibles ici
		if(condition == true){
			int nouvelleVar = 7;
			// var, nbDecimal et nouvelleVar sont accessible ici
		}
		// nouvelleVar n'est plus accessible ici, sa valeur a été effacé, car elle a été définit dans la condition et n'est donc que lisible dans la condition
	}
}

```

### Les tableaux

En java, il existe plusieurs façon de stocké des informations dans un tableau.

Les Array de `java.util.Arrays` et les List de `java.util.List`.

Ces dernières ont deux utilisations bien distinctes, et des méthodes d'accesseurs différents.

Un array se construit comme une class, en déclarant son type précédé de `[]` : 

```java
int[] intArray = new int[size];
float[] floatArray = new float[size];

// etc..
```
Et une List se défini  de la même façon, sans les crochets car List étant une class, elle se construit comme une class, cependant il ne faut pas oublié d'importer la class.

```java
import java.util.ArrayList;
import java.util.Arrays;
import java.util.List;

List<Integer> uneList = new ArrayList<>()
```

## Aller plus loin

### Les class abstraites et l'héritage

```java
// complete stuff later ...
```

### Les interfaces

TODO

### Les enumerateurs

TODO

### La manipulation de class

```java
// complete stuff later ...
```

