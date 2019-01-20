# Bien coder

Le coding style, c'est important, et pourtant on ne vous le dis jamais à la fac par flemme de se mettre d'accord sur les bonnes règles à utiliser.
Qu'es-ce que c'est que ce truc exactement, et pourquoi es-ce si important?

Un exemple en dis plus que des mots:

```python
class Symbole(object): 
    def __init__(self, arite, face): 
        self.arite = arite 
        self.face  = face
    
    def __str__(self):
        return self.face
    
def arite(symbole):   
    return symbole.arite
    
def face(symbole):        
    return symbole.face

def carArite(c):
    if (c == '-'):
        return 1
    if (c in ['+', '*', '>', '=']):
        return 2
    else:
         return 0

def symboleCreer(c):
    s=Symbole(carArite(c),c)
    return s

def symbolePrint(s):
    print("(%d,%c)"%(s.arite, s.face))
### Extrait d'un DM de mr Ranaivoson pour les L2 2018-2019 ###
```

Cela ne fait pas beaucoup de sens n'es ce pas? Et bien c'est un exemple de mauvais code.
Le python force à avoir des indentations qui font à peu près sens mais dans d'autres langages les indentations auraient aussi pu être n'importe comment.

Un bon code se doit d'être compréhensible pour un lecteur qui n'as aucune idée de ce pourquoi as été écrit le code. 
Par exemple un élève à qui on envoie un DM à résoudre \**ahem*\*

Cela nécessite d'instaurer quelques règles dites, de *coding style*.

## Mais au fond, quelle est la différence entre le \*bon\* et le \*mauvais\* code?

La différence, c'est que le mauvais code, on essaie de le lire, y fait voir tout rouge, et il tourne quoi.
Alors que le bon code, on essaie de le lire, y fait voir tout rouge, et il tourne... mais on comprends ce qu'il veut dire.

Il existe de nombreuses coding styles différentes, certaines organisations, et écoles ont même leurs propres règles de coding style.   
Mais tous ces ensembles de règles ont comme point commun la différenciation des éléments du code pour faciliter leur compréhension.

Après tout en informatique, le code source est lu bien plus souvent qu'il n'est écrit, il est donc important de le rendre clair.

Prenons en exemple [le coding style officiel utilisé pour python](https://www.python.org/dev/peps/pep-0008/):

> - Modules should have short, all-lowercase names. Underscores can be used in the module name if it improves readability. Python packages should also have short, all-lowercase names, although the use of underscores is discouraged.

Les modules en python ( fichiers, dossiers de fichiers python ) doivent être nommés en toutes minuscules, avec usage d'underscores s'ils aident à la compréhension.

> - Class names should normally use the CapWords convention.

Les noms de classes doivent normalement utiliser la convention CapWords (autrement appelé CamelCase).

> - Because exceptions should be classes, the class naming convention applies here. However, you should use the suffix "Error" on your exception names (if the exception actually is an error).

Les noms d'erreurs doivent utiliser la même convention d'écriture que les classes, car elles en sont aussi, mais doivent aussi contenir le suffixe "Error"si elles représentent une erreur.

> - Function names should be lowercase, with words separated by underscores as necessary to improve readability.

Les noms de fonctions doivent être en minuscules, avec les mots séparés par des underscore pour améliorer leur lisibilité

> - Variable names follow the same convention as function names.

Les noms de variable suivent la même convention que les noms de fonction (ce qui est logique en python car les fonctions y sont juste des variables)

> - Constants are usually defined on a module level and written in all capital letters with underscores separating words.

Les noms de capitales sont en général définies au niveau du module (fichier python) et nommés en toutes capitales avec des underscores séparant les mots.


Bref la liste complète est au dessus, voici ici un exemple pour résumer en gros les points importants cités ici:
 
```python
import module_custom

NOMBRE_DE_QUESTIONS = 42
QUESTION = "pourquoi?"
POURQUOI = "parce que"

class BoupMan():
  compteur_de_reponses_donnees = 0
  
  def reponds_a_la_question(self, question):
    print(question)
    if self.compteur_de_reponses_donnees >= NOMBRE_DE_QUESTIONS:
      raise TooManyQuestionsError("Leave me alone")
    print(POURQUOI)
    self.compteur_de_reponses_donnees += 1

def main():
  boup_man = BoupMan()
  for _ in range(NOMBRE_DE_QUESTIONS+1):
    boup_man.reponds_a_la_question(QUESTION)
```

## Je n'aime pas cette convention, qu'y a t il d'autre?

Ce n'est pas grave, il en existe beaucoup d'autres, celle de GNU est particulièrement stricte et propre, à l'image du travail de leur communauté.
D'autres existent, mais je vous laisse chercher sur google des listes de coding styles, le plus important reste d'être constant dans vos projets.
Coder pareil dans un fichier c'est bien, mais coder pareil dans tout le projet c'est ce qu'il faut pour permettre de travailler dessus en équipe sans trop de confusion et éviter les bugs inutiles.

## La flemme de tout lire mais j'aimerais améliorer facilement et automatiquement mon code

Garder des noms clairs, et respecter une notation réduit de beaucoup la nécessité de commenter le code. 
Pour le reste, pvous pouvez faire confiance aux outils d'analyse statique pour vous dire ce qui pue et ce qui devrais être modifié et comment. Conseil perso:

 - Utilisez l'extension SonarLint dans vos IDE pour détecter le reste

