# Une alternative au dual-boot: le sous-système Windows pour Linux (WSL)

[retour à l'accueil](../)

Vous avez besoin de garder Windows mais vous en avez assez d'installer des logiciels à la main là où une seule commande sous Linux vous comblerait ? Fini d'installer PHP à l'arrache, Microsoft a (étonnamment ?) pensé à vous !

Le [WSL](https://docs.microsoft.com/fr-fr/windows/wsl/about) est une fonctionnalité de Windows 10 qui permet l'installation de certaines distributions Linux au sein de Windows.
Elles ne disposeront pas d'interface graphique (même si cela est possible avec du bricolage) mais proposeront une console complète, sans modifications (à la différence de logiciels tels que CygWin qui sont des portages).
Cela signifie que l'on peut y exécuter n'importe quel programme Linux, et oui, utiliser votre gestionnaire de paquets préféré (faire son premier `sudo apt update` sous Windows a son petit effet).

## Avantage
Outre sa simplicité d'installation (un dual-boot hasardeux peut être risqué), l'avantage du WSL réside dans l'intéropérabilité des deux systèmes.
Contrairement à un dual-boot où Windows est éteint, ou une machine virtuelle qui en plus d'avoir des performances médiocres est presque complètement isolée du reste, le WSL permet des échanges avancés.

### Systèmes de fichiers
Le point le plus important lorqu'on utilise des systèmes diffèrents est surement reste surement l'utilisation des fichiers.
Il est possible de monter les disques Windows en simulant un système de permissions Unix, ce qui impossible dans le cas d'une machine virtuelle.
Vous pouvez donc utiliser SSH avec des clefs se trouvant dans votre dossier utilisateur Windows par exemple (SSH nécessite que ces fichiers soient protégés).
### Exécuter des commandes
Il est aussi possible de lancer une commande Linux depuis Windows et vice-versa, mais attention aux chemins d'accès !
Un logiciel Windows s'attend à recevoir un chemin Windows !
### Variables d'environment
Le dernier point est le partage des variables d'environement des deux systèmes.

## Mise en place
Il est nécessaire d'avoir Windows 10 (Home ou Pro peu importe) en 64bit 
L'installation va se dérouler en deux temps :
- activer la fonctionnalité Windows (cela nécessite les droits d'administration)
- installer une distribution depuis le Windows Store

### Activation du WSL
Le plus rapide est d'utiliser PowerShell (le bash de Windows, no offence batch).
Ouvrez une fenêtre PowerShell en mode administrateur exécutez la commande suivante :
```ps
Enable-WindowsOptionalFeature -Online -FeatureName Microsoft-Windows-Subsystem-Linux
```
([source](https://docs.microsoft.com/fr-fr/windows/wsl/install-win10)) Il vous sera ensuite demandé de redémarrer votre ordinateur.

### Installation d'une distribution
Les distributions disponible à ce jour sont :
- Ubuntu (LTS)
- openSUSE (Leap 42)
- SUSE Linux Entreprise Server (12)
- Debian (Stretch)
- Kali Linux
Elles sont disponibles dans le Microsoft Store.
Comme toutes applications du Store, leur installation est spécifique à l'utilisateur, donc une autre session utilisateur n'a pas accès à votre distribution et les droits d'administration ne sont pas requis.
Une fois installée votre distribution est disponible dans le menu Windows comme n'importe quelle autre application.
Le premier lancement va être un peu long car la distribution va être téléchargée (l'application du Store ne contient pas tout).

