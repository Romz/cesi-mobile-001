Ionic js
========

Intro
-----

Le but de ce projet est de créer une application collaborative de comparaison de prix pour savoir quel magasin est le moins cher avec ionicjs.

Requirements
------------

- NodeJs et npm
- Cordova
- Base en HTML / javascript et angularjs


Installation et création du projet
----------------------------------

Vous pouvez trouver la procédure d'installation et de création de projets [ici](http://ionicframework.com/getting-started/)

Pour ce tp, nous allons créer un projet de type tabs.


Etapes
------

### Etape 1 : la création des écrans ###

La première étape va être de créer les différents écrans de l'application.

L'application est décomposé en 3 onglets:

- Un onglet magasin qui va permettre de lister les différents magasins, voir le détail d'un magasin ou d'ajouter un nouveau magasin
- Un onglet scan qui va permettre de scanner un produit et d'afficher ses informations, ou proposer de le créer si le produit n'existe pas
- Un onglet produit qui va permettre de lister les différents produits et de les afficher en cliquant dessus.

L'application doit permettre de pouvoir gérer plusieurs prix par produit et par magasin.

Voici les mockups: 



### Intégration du webservice ###

Pour créer un contenu sur le webservice, il faut appeler l'url :
http://<ip_serveur>/services/api/node.json



Création d'un magasin:

    {
	  "title":"Nom du magasin",
	  "type":"store",
	  "field_address" : {
	    "und": [
          { "value":"Adresse magasin" }
        ]
      },
	  "field_zipcode": {
	    "und":[
	      { "value": "Code postal" }
        ]
	  },
	  "field_city":{
	    "und":[
	      { "value":"Ville" }
        ]
      },
	  "field_opening_hours": {
	    "und" : [
	      { "value": "Horraires" }
		]
	  }
	}

