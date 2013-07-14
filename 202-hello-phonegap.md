Hello phonegap
==============

Installation pour android
-------------------------

Dans un premier temps, il faut installer l'utilitaire en ligne de commande cordova. Vous pouvez trouver le guide d'installation ici: [http://docs.phonegap.com/en/2.9.0/guide_cli_index.md.html#The Cordova Command-line Interface](http://docs.phonegap.com/en/2.9.0/guide_cli_index.md.html#The%20Cordova%20Command-line%20Interface)

Il faut ensuite installer le sdk android. Vous pouvez trouver le guide d'installation ici: [http://docs.phonegap.com/en/2.9.0/guide_getting-started_android_index.md.html#Getting Started with Android](http://docs.phonegap.com/en/2.9.0/guide_getting-started_android_index.md.html#Getting Started with Android)

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

Cordova intègre un environnement web avec un simulateur intégré appelé ripple. Vous pouvez l'utilisé en utilisant la commande:

    cordova ripple android

Cette commande va créer un serveur (par défault sur le port 8000), et vous pourrez y accéder via le navigateur. 

Test des fonctionnalités
------------------------

Le code source de l'application cordova/phonegap ce trouve dans le dossier www du projet.

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
[Doc](http://docs.phonegap.com/en/2.9.0/cordova_accelerometer_accelerometer.md.html#accelerometer.watchAcceleration)

### Camera

Cette page doit permettre de prendre une photo et de l'afficher sur la page.

[Doc](http://docs.phonegap.com/en/2.9.0/cordova_camera_camera.md.html#Camera)
[Doc 2](http://docs.phonegap.com/en/2.9.0/cordova_media_capture_capture.md.html#capture.captureImage)

Bonus: Prendre plusieurs photos pour faire une mini galery.

### Compass

Cette page doit afficher les information du compas toutes les 100ms.

[Doc](http://docs.phonegap.com/en/2.9.0/cordova_compass_compass.md.html#Compass)

Bonus: Faire une flèche qui pointe vers le nord (tip: -webkit-transform)

### Contact

Cette page doit lister tous les noms des contactes du téléphones. Au clique sur un contact, on affiche toutes les informations de ce contacte.

[Doc](http://docs.phonegap.com/en/2.9.0/cordova_contacts_contacts.md.html#Contacts)

Bonus: Faire un champs de recherce pour filtrer les contactes.

### Device

Créer une page qui affiche toutes les informations du téléphone

[Doc](http://docs.phonegap.com/en/2.9.0/cordova_device_device.md.html#Device)

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

[Doc](http://docs.phonegap.com/en/2.9.0/cordova_geolocation_geolocation.md.html#Geolocation)

### Notification

Créer une page avec 5 boutons pour:

- Afficher une boite de dialogue
- Afficher une boite de dialogue de confirmation et afficher le résultat
- Afficher une boite de dialogue avec un input et afficher le résultat
- Faire biiiip
- Faire vibrer

