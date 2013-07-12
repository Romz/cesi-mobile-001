Hello phonegap
==============

Installation pour android
-------------------------


Dans un premier temps, il faut installer l'utilitaire en ligne de commande cordova. Vous pouvez trouver le guide d'installation ici: [http://docs.phonegap.com/en/2.9.0/guide_cli_index.md.html#The Cordova Command-line Interface](http://docs.phonegap.com/en/2.9.0/guide_cli_index.md.html#The%20Cordova%20Command-line%20Interface)

Il faut ensuite installer le sdk android. Vous pouvez trouver le guide d'installation ici: [http://docs.phonegap.com/en/2.9.0/guide_getting-started_android_index.md.html#Getting Started with Android](http://docs.phonegap.com/en/2.9.0/guide_getting-started_android_index.md.html#Getting Started with Android)

Creation d'un projet
--------------------

Pour créer un projet, il faut utiliser la commande cordova create <directory> <namespace> <message>. Les 2 derniers paramètres sont optionnel:

    cordova create HelloWorld com.example.helloworld "Hello Word"
	
Ou Juste

	cordova create HelloWorld

Il faut ensuite ajouter les platformes pour souhaitées:

    cordova platform add android

Vous pouvez mettre aussi ios, blackberry, wp7, wp8

Cette commande va créer un sous projet android dans platforms/android

Pour build le projet il y a plusieurs possibilités:
- Ouvrir le projet android dans eclipse et build depuis eclise
- utiliser la commande cordova build android

Pour lancer l'émulateur avec la ligne de commande il font utiliser cordova emulate <platform>. Si vous ne spécifiez pas la platforme, cordova va tenter de lancer tout les émulateurs en même temps

    cordova emutale android

Pour lancer l'application sur un device connecté en usb, utiliser la comande:

    cordova run android

Cordova intègre un environnement web avec un simulateur intégré appelé ripple. Vous pouvez l'utilisé en utilisant la commande:

    cordova ripple android

Cette commande va créer un serveur (par défault sur le port 8000), et vous pourrez y accéder via le navigateur. 

