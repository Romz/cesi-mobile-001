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

Tips:
- Utilisation des tabs : [Doc](http://ionicframework.com/docs/api/directive/ionTabs/)
- Utilisation des listes: [Doc](http://ionicframework.com/docs/api/directive/ionList/)
- 

#### Page produits ####

![Mockup produits](images/ionic/liste-produit.PNG)

#### Détails produit ####

![Mockup detail produit](images/ionic/detail-produit.PNG)

#### Ajout / Edition produit ####

![Mockup ajout produit](images/ionic/ajout-produit.PNG)

#### Ajout prix ####

![Mockup ajout prix](images/ionic/ajout-prix.PNG)

#### Page magasins ####

![Mockup magasins](images/ionic/liste-magasin.PNG)

#### Détail magasin ####

![Mockup detail magasin](images/ionic/detail-magasin.PNG)

#### Ajout magasin ####

![Mockup Ajout magasin](images/ionic/nouveau-magasin.PNG)



### Intégration des webservices

Les webservices sont fourni par un Drupal. Le compte admin est:

login:Ril12
pass:ril12


#### Récupération des produits

Pour récupérer les produits, il faut appeler l'url suivante avec la méthode GET:

    http://ip/services/api/views/products.json

Vous pouvez filtrer sur le nom du produit ou sur son code bar en ajoutanten paramètre de l'url:
- name=Nomproduit
- barcode=uncodebar

Ex:
    http://ip/services/api/views/products.json?barcode=351545214
    http://ip/services/api/views/products.json?name="chips"

#### Récupération des magasins

Pour récupérer les magasins, il faut appeler l'url suivante avec la méthode GET:

    http://<ip>/services/api/views/stores.json

Vous pouvez filtrer sur le nom du magasin et la ville:

- name=nommagasin
- city=ville

Ex:
- http://<ip>/services/api/views/stores.json?name=Carrefour
- http://<ip>/services/api/views/stores.json?city=Rouen

#### Récupération des prix

Pour récupérer la liste des prix, il faut appeler l'url suivante avec la méthode GET:
    http://<ip>/services/api/views/prices.json

Vous pouvez filtrer sur le nid d'un produit ou sur le nid d'un magasin

- product=nidproduct
- store=nidstore

Ex:
    http://<ip>/services/api/views/prices.json?product=2
	
	http://<ip>/services/api/views/prices.json?store=1

#### Création d'un magasin:

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

#### Création d'un produit

    {
	  "title":"Nom du produit",
	  "type":"product",
	  "field_barcode" : {
	    "und": [
          { "value":"Code bar du produit" }
        ]
      },
	  "field_description": {
	    "und":[
	      { "value": "Description du produit" }
        ]
	  }
	}

#### Création d'un prix

    {
	  "title":"Nom du prix",
	  "type":"price",
	  "field_product": {
        "und": <nid produit>
      }
	  "field_store": {
	    "und" : <nid store>
	  }
	  "field_price": {
	    "und" : [
          {value: "prix produit"}
        ]
	  }
	}
