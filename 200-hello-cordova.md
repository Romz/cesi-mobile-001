Hello phonegap
==============

Installation pour android
-------------------------

Dans un premier temps, il faut télécherger nodejs (si il n'est pas déjà installé).
Vous pouvez trouver nodejs ici: [https://nodejs.org/](https://nodejs.org/).

Il faut ensuite installer l'utilitaire en ligne de commande cordova. Vous pouvez trouver le guide d'installation ici: [http://cordova.apache.org/docs/en/5.0.0/guide_cli_index.md.html#The%20Command-Line%20Interface](http://cordova.apache.org/docs/en/5.0.0/guide_cli_index.md.html#The%20Command-Line%20Interface)

Cordova s'install avec le manager de paquet node 'npm'. Si vous avez des problêmes pour vous connecter à cause du proxy, vous pouvez utiliser les commandes suivantes (Remplacer les valeurs entre <>):

    npm config set proxy http://<user>:<pass>@<ip_proxy>:<port_proxy>
    npm config set https-proxy http://<user>:<pass>@<ip_proxy>:<port_proxy>

Il faut ensuite installer le sdk android. Vous pouvez trouver le guide d'installation ici: [http://cordova.apache.org/docs/en/5.0.0/guide_platforms_android_index.md.html#Android%20Platform%20Guide](http://cordova.apache.org/docs/en/5.0.0/guide_platforms_android_index.md.html#Android%20Platform%20Guide)

Cordova utilise ant pour créer les projets android. Vous pouvez télécharger ant ici: [http://ant.apache.org/bindownload.cgi](http://ant.apache.org/bindownload.cgi).
Une fois téléchargé, il faut créer une variable d'environnement ANT_HOME pointant vers le répertoire ant. Il faut ensuite rajouter à la variable d'environnement PATH: %ANT_HOME%\bin sur winodws ou $ANT_HOME/bin sur linux / OSX.

Pour pouvoir développer une application avec cordova, nous allons avoir besoin de l'outil ripple. ripple est un émulateur mobile pour navigateur qui permet de tester les applications sur les différentes résolutions mobiles et aussi de tester les fonctionnalité natvie comme le gps, l'accéléromètre sans avoir à build l'application à chaque fois.
Comme cordova, ripple fonctionne dans un environnement node.
On peut l'installer via la ligne de commande:

    npm install -g ripple-emulator

Creation d'un projet
--------------------

Pour créer un projet, il faut utiliser la commande cordova create <directory> <namespace> <message>. Les 2 derniers paramètres sont optionnels:

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

Pour pouvoir tester l'application sans la compiler, il faut utiliser l'émulateur ripple:

    cd platforms/android/assets/www
	ripple emulate

Cette commande va créer un serveur (par défault sur le port 8000), et vous pourrez y accéder via le navigateur. Il faut se placer dans le répertoire www d'une platforme pour que le fichier cordova.js soit inclus.
On peut aussi utiliser l'option --path si on veut rester à la racine du projet:

    ripple emulate --path platforms/android/assets/www

Les sources du projet étant dans /www, il faut exécuter une commande pour copier les fichiers de /www à platforms/android/assets/www. Pour cela, on utilise la commande cordova prepare:

    cordova prepare android

Utilisations des fonctionnalités natives
----------------------------------------

Depuis la version 3.0 de cordova, les fonctionnalités natives ne sont plus directement intégrées dans le projet mais doivent être rajouter sous forme de plugin.

Pour installer un plugin dans un projet cordova, il faut utiliser la commande:

    cordova plugin add <name-space-plugin>

Par exemple, pour la caméra:

    cordova plugin add org.apache.cordova.camera

Vous pouvez trouver les fonctionnalités cordova ici: [http://cordova.apache.org/docs/en/5.0.0/cordova_plugins_pluginapis.md.html#Plugin%20APIs](http://cordova.apache.org/docs/en/5.0.0/cordova_plugins_pluginapis.md.html#Plugin%20APIs)

Voici la liste de compatibilité des fonctionnalités par os: [http://cordova.apache.org/docs/en/5.0.0/guide_support_index.md.html#Platform%20Support](http://cordova.apache.org/docs/en/5.0.0/guide_support_index.md.html#Platform%20Support)

Il y a de nombreux autres plugins disponible qui ne sont pas créer par cordova. heureusement, cordova intègre un moteur de recherche pour trouver facilement des plugin. Par exemple, si l'on veut utiliser un scaner de codebar / qr code, on peut faire la recherche:

    cordova plugin search bar code
    
Sinon vous pouvez regarder sur le site [http://plugins.cordova.io/#/](http://plugins.cordova.io/#/)

### Base de code

Créer un première page qui sera le menu de l'application. Il faudra retrouver les boutons suivant:

- Accelerometer
- Camera
- Compass
- Contacts
- Device informations
- Geolocation
- Notification

Créer les pages pour chaque bouton (vous être libre d'utiliser votre framework préféré ou faire juste en html).

### Accelerometre

Cette page doit afficher les information de l'accéléromètre du téléphone toutes les 100ms.
[Doc](https://www.npmjs.com/package/cordova-plugin-device-motion)

### Camera

Cette page doit permettre de prendre une photo et de l'afficher sur la page.

[Doc](https://www.npmjs.com/package/cordova-plugin-camera)

Bonus: Prendre plusieurs photos pour faire une mini galery.

### Compass

Cette page doit afficher les information du compas toutes les 100ms.

[Doc](https://www.npmjs.com/package/cordova-plugin-device-orientation)

Bonus: Faire une flèche qui pointe vers le nord (tip: -webkit-transform)

### Contact

Cette page doit lister tous les noms des contactes du téléphones. Au clique sur un contact, on affiche toutes les informations de ce contacte.

[Doc](https://www.npmjs.com/package/cordova-plugin-contacts)

Bonus: Faire un champs de recherce pour filtrer les contactes.

### Device

Créer une page qui affiche toutes les informations du téléphone

[Doc](https://www.npmjs.com/package/cordova-plugin-device)

### Geolocation

Créer une page qui affiche les données sur la localisation du téléphone:

- Latitude
- Longitude
- Altitude
- Précision
- Précision de l'altitude
- L'angle par rapport au nord
- La vitesse

Bonus: Afficher la position sur une google map

[Doc](https://www.npmjs.com/package/cordova-plugin-geolocation)

### Notification

Créer une page avec 5 boutons pour:

- Afficher une boite de dialogue
- Afficher une boite de dialogue de confirmation et afficher le résultat
- Afficher une boite de dialogue avec un input et afficher le résultat
- Faire biiiip
- Faire vibrer

