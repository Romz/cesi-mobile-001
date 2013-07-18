Hello world angularjs
=====================

Intro
-----

Le but de ce TP est de créer une application checklist avec angularjs et bootstrap

Requirements
------------

- Un serveur web d'installé (apache par exemple)
- Un navigateur assez récent pour bien gérer l'html5 (chrome, safari, firefox)
- Un éditeur de texte
- Des base en javascript

Etapes
------

### Etape 1 : Installation

- Cloner le projet github [angular-seed](https://github.com/angular/angular-seed)
- Copier le répertoire app dans votre serveur web (Vous pouvez aussi utiliser le serveur nodejs fourni)
- Supprimer les balises autres que script dans le body du index.html
- Supprimer tout les fichiers du dossier partials
- Supprimer les 3 lignes du callback de la fonction config dans app.js
- Supprimer les 2 controllers dans js/controllers.js
- Télécharger une version de [twitter bootstrap](http://twitter.github.io/bootstrap/) 
- Inclure dans le index.html le fichier boostrap.min.css

### Etape 2 : Création de la première page

- Dans le fichier index.html, ajouter dans le body la directive ng-view
- Créer un nouveau fichier list.html dans le répertoire partials et y ajouter le texte suivant :  "page liste"
- Ajouter le controller ListController dans le fichier controllers.js (ne pas oublier de passer $scope dans le constructeur)
- Dans app.js, configurer la route vers "checklists" avec en template list.html et en controller ListController
- Ajouter la page checklists en chemin par défault

### Etape 3 : Navbars

- Au début du fichier list.html, ajouter une navbar avec en title "Checklists"
- Ajouter dans cette navbar un lien en forme de bouton avec une icone "+"

### Etape 4 : Deuxième page

- Créer un nouveau fichier view.html dans le dossier partials
- Ajouter une navbar avec "Checklist 1" en title et un bouton back poitant vers la page list
- Ajouter dans le contenu "Contenu de la checklist 1"
- Ajouter le controller ViewController dans controllers.js (passer $scope et $routeParams en paramètre du constructeur)
- Dans app.js, créer la route pour accéder à cette page sous la form "checklists/:checklistId"
- Dans la page list, créer un lien vers la nouvelle page (vers checklists/1 par exemple)

### Etape 5 : Page List

- Dans le fichier list.html, ajouter une list en nav tabs stacked (pour donner un effet list mobile)
- Les liens de la liste doivent pointer vers la page view
- Dans les liens de la liste, ajouter une icon-chevron-right avec la class pull-right(pour la mettre a droite)
- Dans le header, ajouter à droite une bouton pour éditer la checklist avec un icon-pencil (Pour un affichage plus propre, utiliser le fluid grid system de bootstrap)

### Etape 6 : Page View

- Dans le fichier view.html, ajouter une list en nav tabs stacked
- Ajouter dans les liens à droite des icon-ok et remove

### Etape 7 : Page Formulaire

- Créer un page pour le formulaire avec 2 chemins mais un seul controller
  - Pour l'ajout le chemin est checklists/add
  - Pour l'édition le chemin est  checklists/edit/:checkListsId
- Ajouter un header avec un title
- Créer le formulaire avec
  - Un input text pour le nom de la checklist
  - Une liste d'input text pour les tâches
  - Un bouton pour ajouter des input de tâche

### Etape 8 : Page list dynamique

- Ajouter un controller AppController au body (directive ngController).
- Ajouter un attribut checklists à l'objet $scope qui contiendra les données de la checklist.
- Dans le fichier list.html, supprimer le contenu de la liste (les li)
- Ajouter un li avec la directive ng-repeat pour parcourir l'object checklist
  - Mettre en label du lien le nom de la checklist
  - Mettre en url du lien le chemin vers la page view avec le bonne id

Exemple de structure de l'objet checklists:

    $scope.checklists = [
	  {
	    name: 'checklist1',
		id: 1,
		tasks: [
		  {name: 'Tâche 1', done: true},
		  {name: 'Tâche 2', done: false},
		  {name: 'Tâche 3', done: false},
		]
	  },
	  {
	    name: 'checklist2',
		id: 2,
		tasks: [
		  {name: 'Tâche 1', done: true},
		  {name: 'Tâche 2', done: false},
		  {name: 'Tâche 3', done: false},
		]
	  },
	  {
	    name: 'checklist3',
		id: 3,
		tasks: [
		  {name: 'Tâche 1', done: true},
		  {name: 'Tâche 2', done: false},
		  {name: 'Tâche 3', done: false},
		]
	  },
	];

### Etape 9 : Filtre page list

- Ajouter un champs input text avec la class "search-query", en lui ajoutant le ng-model query.name
- Ajouter le filtre dans le ng-repeat pour filtrer la liste

### Etape 10 : Page view dynamique

- Récupérer l'id de la checklist à l'aide du paramètre $routeParams, et ajouté la checklist dans le scope
- Stocker l'id dans le scope
- Dans le fichier view.html, changer le titre de la page par le nom de la checklist
- Ajouter le bouton edit dans le header pointant vers le formulaire d'édition
- Afficher la liste de tâches de la checklist à l'aide de la directive ng-repeat
- Afficher l'icon-ok si l'attribut done est à true ou icon-remove si done est à false (Indice: ng-show, ng-hide)
- Dans le lien de la tâche, ajouter la directive "ng-click" avec en paramètre une fonction pour mettre à jour la tâche (updateTask par exemple), en lui passant en paramètre l'index de la tâche
- Dans le controller ViewController, ajouter dans le scope la méthode updateTask qui changera l'état de l'attribut done de la tâche référencé par l'index passé en paramètre

### Etape 11 : Page form

- Récupérer l'id de la checklist à l'aide du paramètre $routeParams, et ajouté la checklist dans le scope
- Si il n'y a pas d'id
  - Créer un nouvel objet checklist
  - Ajouter le nouvel objet aux autres checklists
  - Récupérer l'id du nouvel objet
- Stocker l'id dans le scope
- Changer le title par "Edit <Nom de la checklist>"
- Ajouter un bouton back pointant vers la page view avec l'id
- Dans le input text du nom, ajouter le ng-model pour qu'il pointe sur le nom de la checklist
- Ajouter un ng-repeat et ajouter un input pour chaque tâche avec comme ng-model la tâche courante
- Dans le bouton, ajouter une directive ng-click avec en paramètre une méthode pour ajouter une tâche
- Dans le controller, ajouter la méthode d'ajout de tâche au scope

### Etape 12 : Le stockage

- Dans le controller AppController, remplir l'object checklists avec les données du localstorage avec la clé "checklists"
- Lors de chaque action sur l'object checklists, sauvegarder les changement dans le localstorage avec la clé checklist


Ressources
----------

### Angular

- [Directives](http://docs.angularjs.org/guide/directive)
- [Controllers](http://docs.angularjs.org/guide/dev_guide.mvc.understanding_controller)
- [Routes](http://docs.angularjs.org/tutorial/step_07)
- [Model & Scope](http://docs.angularjs.org/tutorial/step_02)
- [Filtres](http://docs.angularjs.org/tutorial/step_03)

### Bootstrap

- [Navbars](http://twitter.github.io/bootstrap/components.html#navbar)
- [Buttons](http://twitter.github.io/bootstrap/base-css.html#buttons)
- [Icons](http://twitter.github.io/bootstrap/base-css.html#icons)
- [Navs](http://twitter.github.io/bootstrap/components.html#navs)
- [Grid system](http://twitter.github.io/bootstrap/scaffolding.html#gridSystem)
- [Forms](http://twitter.github.io/bootstrap/base-css.html#forms)

### Autre

- [Localstorage](http://www.lafermeduweb.net/billet/le-stockage-local-en-html5-localstorage-942.html)
