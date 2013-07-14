Phonegap plugin
===============

Le but de ce tp est la création d'une application d'énigmes / cache cache où la réponse de l'énigme est un endroit avec un qrcode caché.
Déroulement:

- L'utilisateur a une liste d'énigmes (les noms des énigme)
- Au clique sur l'énigme, on arrive sur une page avec l'énoncé de l'énigme et un bouton "Répondre"
- Au clique du bouton, on affiche le scanner pour que l'utilisateur puisse répondre
- Si l'utilisateur flash le bon code, on valide l'énigme

Contraintes:
- Les énigmes doivent être stocker dans un fichier json et chargé dans l'application en ajax (pour simuler un webservice)
- La validation des énigmes ce fera en basse de donnée

Les bases de données pour cordova se manipule comme les bases de données HTML5.
Vous pouvez trouver la documentation [ici](http://docs.phonegap.com/en/2.9.0/cordova_storage_storage.md.html#Storage)

Installation d'un plugin cordova
--------------------------------

Le scanner de qr code n'est pas prévue dans les fonctionnalitées de base ce cordova. On va donc utiliser un plugin qui va proposer des fonctions javascript pour accéder au scanner de qr code.

Vous pouvez trouver le plugin ici:  [https://github.com/filmaj/BarcodeScanner](https://github.com/filmaj/BarcodeScanner)

Pour installer un plugin en ligne de commande avec cordova, il faut utiliser la commande

    cordova plugin add <path-to-plugin>

Bonus
-----

- Ajouter des types de réponses en plus du qrcode (champs text, position géographique)
- Faire un système de jeu de piste avec la boussole qui montre la direction d'un emplacement géographique avec la géolocalisation.
