# S'équiper correctement

[retour à l'accueil](../)

Les machines sont complexes et l'informaticien peut intervenir sur tous les aspects de sa machine.
Que ce soit pour créer un site web, lancer des applications dans un ordre voulu ou modifier le comportement même de son systeme, il est important d'avoir le bon équipement.


Autrement dit:
> À chaque tâche son outil.

Nous allons ici énumérer les outils les plus importants par ordre de distance par rapport au déroulement du programme pour l'ordinateur.


## Le cerveau

En effet, avant toute écriture de programme, il est important d'être en bonne forme pour éviter les erreurs de raisonnement ou de fautes de frappes.

Il est donc très important de:

- manger correctement pour reprendre des forces et alimenter votre cerveau en énergie
- s'hydrater régulièrement durant vos longues sessions de codage pour éviter la syncope
- sortir prendre l'air de temps en temps pour s'aérer les idées
- dormir pour pouvoir enregistrer correctement les connaissances de la journée


## Les poignets

Une des blessures les plus communes parmi les informaticiens est [le syndrôme du canal carpien](https://fr.wikipedia.org/wiki/Syndrome_du_canal_carpien), dûe à l'usure et au stress continu que subissent nos poignets dans des positions non adaptées sur le clavier par exemple.

Pour éviter cela et avoir en général un meilleur confort pour coder et jouer, vous pouvez vous procurer des [repose poignets à mémoire de forme pour moins de 10 e sur amazon](https://www.amazon.fr/gp/product/B072K41FC1/ref=ppx_yo_dt_b_asin_title_o02__o00_s00?ie=UTF8&psc=1) ou pour les plus chanceux d'entre vous, [un clavier style ergodox si vous en avez les moyens.](https://ergodox-ez.com)

## Le systeme d'exploitation

Pensez aussi que vous n etes pas obligé de mettre votre pc actuel à la poubelle pour coder sur un autre OS, il est possible d utiliser des machines virtuelles pour lancer un linux a travers votre windows et vice versa. Au coût de performances dûes à l'émulation ceci dit.

Linux est le systeme de choix pour coder, en raison de son aise d'utilisation avec la majorité des compilateurs et outils de programmation.

Il en existe plusieurs types de distributions mais pour n'en citer que quelques unes des plus simples d'accès, il y a:
- Ubuntu (grand public)
- Linux Mint (Grand public mais plus léger que Ubuntu)
- Cinnamon (basée sur arch mais déjà utilisable, préconfigurée et jolie)

Windows 10 est aussi un choix viable mais gardez en tête que si vous n'installez pas vos outils de prog en mode administrateur, il vous faudra les ajouter à la main à votre PATH pour pouvoir les appeler en ligne de commande.
Peut aussi poser quelques soucis ou même rendre impossible l'utilisation de certains outils importants.

## L'espace de développement intégré

Bien qu'il soit possible de coder tous ses projets sur wordpad ou sublime text, il est fortement recommandé d'utiliser une suite d'outils bien pratiques lors du développement d'un projet:

- un linter, qui permet d'analyser votre code afin d'y déceler des erreurs avant l'execution du programme ainsi que des soucis de coding style
- un debugger, qui permet de mettre en pause son programme à des endroits pour voir le contenu des variables à un instant T
- un profiler, qui permet d'analyser quelles fonctions du programme consomment le plus de temps et d espace en cours d execution, permettant de savoir où se trouvent de potentielles optimisations à faire
- un terminal, qui permet d'utiliser des outils d'analyse ou d'installer des choses utiles directement sans aller bien loin
- un file manager, qui permet de manipuler les fichiers du projet en cours
- une intégration de git, qui permet d'être tenu et de tenir à jour votre projet de façon visuelle
- (C\C++ only) Vagrant, qui permet d'analyser les fuites de mémoires du programme et leur source
- et bien d'autres selon les langages.

Tous ces outils sont intégrés ensemble de façon personnalisable dans ce que l'on appelle un Integrated Development Environnement (ou IDE pour les intimes)

Il en existe pour la plupart des langages et des utilisations, mais les plus pratiques, fonctionnels (\**cough*\*eclipse\**cough*\*) et gratuits (ceux payants sont gratuits pour les étudiants) sont ceux de la compagnie JetBrains:

- IntelliJ Idea (java, java EE, kotlin, ...)
- Clion (C, C++, ...)
- WebStorm (Html5, CSS, node, ...)
- PhPStorm (Php..)
- etc.

## Le linter

Celui intégré aux IDE est souvent bien suffisant mais pour certains langages, il existe des linter plus puissants et plus intelligents.

SonarLint est un extension des IDE JetBrains que je vous recommande fortement pour détecter les "odeurs" de code degueu.

## Le bon langage

L'ordi est con, il ne comprends que ce qu'on lui demande. Et de la même façon, il est plus rapide et facile de communiquer avec un francophone en parlant en Français.
En plus de cela, il sera plus simple de se comprendre sur la controverse des chocolatines qu'avec des personnes extérieures au débat.

Et bien même chose pour se comprendre avec un ordinateur, [à chaque contexte son langage.](https://guide-du-petit-informaticien.readthedocs.io/how-to/parler-le-bon-langage/)

## Les bons algorithmes

Encore une fois l'ordi est con, il ne comprends vraiment que ce qu'on lui demande.

Ainsi, si on lui dit de mémoriser une séquence de 500 cases de tableau vide à part pour une ou deux, puis de nous dire lesquelles ne sont pas vides, il va devoir se repasser en mémoire toutes les 500 cases pour en être sûr.

Alors que si on lui dit d'uniquement mémoriser les cases non vides parmi cette même séquence de 500 cases, il va pouvoir nous répondre directement sans tout se ressasser à chaque fois!

Cela vous dit quelque chose? C'est normal, les jeux de plateaux que l'on vous fait faire depuis la L1 sont d'excellents moyen de mesurer votre niveau de compréhension en algorithmique!

Rien de bien sorcier, l'ordinateur est comme un humain auquel on essaie juste de parler avec un langage commun. [Ici, on passe en revue les concepts simples qui sont partout en algorithmique](https://guide-du-petit-informaticien.readthedocs.io/how-to/faire-des-algorithmes/)

## Et après?

Vous êtes parés.

Il existe de nombreuses façons de s'améliorer, mais toutes ont le même point commun:

> - La théorie ne vaut rien sans la pratique

Si vous avez besoin de vous entrainer à résoudre des problèmes, ou à tester les eaux sur de nouveaux langages et concepts, voici une liste de supers sites sur lesquels faire tourner vos méninges, participer à des compétitions, vous faire potentiellement remarquer par des recruteurs et élargir votre panel de connaissances:

- Hackerrank
- les projets Open source sur Github
