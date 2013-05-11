Hello World jQuery mobile
=========================

Intro
-----

Expliquer ici la finalité du tp

Requirements
------------

- Un serveur web d'installé (apache par exemple)
- Un navigateur assez récent pour bien gérer l'html5 (chrome, safari, firefox)
- Un éditeur de texte
- Des base en javascript et jquery

Etapes
---------

### Etape 1 : Installation

Créer une page index.html et inclure jquery et jquery mobile.

### Etape 2 : Première page

Créer une première page avec en header le title "Checklist" et en content "Hello world".
Cette page aura comme id "list"

### Etape 3 : Deuxième page et lien

Dans le même fichier html, ajouter une deuxième page avec en header "Checklist 1" et en content "todo".
Cette page aura l'id "view"
Ajouter dans la première page un liens vers la nouvel page, en utilisant l'id. (Template multi page)

### Etape 4 : Séparation des fichiers

Créer un nouveau fichier view.html et copier coller le code de la nouvelle page dedans.
Changer le lien de la page 1 pour pointer vers le nouveau fichier. (Template single page)

### Etape 5 : Bouton back

Dans la deuxième page, ajouter un bouton back pour revenir sur la page précédante dans le header (cf section header des ressources)

### Etape 6 : Transition

Ajouter une transition de type "slide" lors de la naviagation entre la page list et la page view

### Etape 7 : List

Dans la première page, supprimer le content et ajouté y une liste de liens en dure vers la page view.
Exemple:
- Checklist 1
- Checklist 2
- Checklist 3

### Etape 8 : Filtre de recherce

Ajouter à cette liste un filtre de recherche.

### Etape 9 : 

Dans la page view, Ajouter une liste de checkboxes, avec des label.
Par exemple:

- Tâche 1
- Tâche 2
- Tâche 3

### Etape 10 : Le formulaire d'édition

- Créer un nouveau fichier form.html.
- Ajouter un premier champs text en mettant en placeholder "Nom de la checklist".
- Ajouter ensuite un control group avec plusieurs champs textes (qui vont correspondre au différentes tâches de la checklist).
- Ajouter un bouton "Ajouter une tâche" en dessous de la liste d'input
- Ajouter un title dans le header: "Edit Checklist 1"
- Ajouter un bouton "Sauvegarder" dans le footer avec comme icone un "check"

### Etape 11 : Lien vers le formulaire

- Dans la page list, ajouter en footer un bouton "Ajouter une checklist" pointant vers la page form
- Dans la listview, ajouter pour chaque ligne des Split button avec comme icone un "gear" pointant vers la page form
(Cela va permettre de respectivement ajouter et éditer une checklist)

### Etape 12 : Script

- Ajouter un fichier script.js dans la page list entre l'inclusion de jquery et de jquery mobile.
- Ajouter le code d'initialisation permettant de se bind sur l'évènement "mobileinit".

### Etape 13 : Objet de test

Créer un objet avec des données de tests pour définir la structure.
Par exemple:

    var checklists = {
	  1: { //id of checklist
	    name: 'checklist1',
		tasks : [
		  {name: 'Task1', done: true},
		  {name: 'Task2', done: false},
		  {name: 'Task3', done: false},
		]
	  },
	  2: {
	    name:'checklist2',
		tasks : [
		  {name: 'Task1', done: true},
		  {name: 'Task2', done: false},
		  {name: 'Task3', done: true},
		]
      }
	]

### Etape 14 : Page de list dynamique

- Ajouter un bind sur l'évènement "pagebeforeshow" de la page list
- Parcourir l'objet checklist et créer dynamiquement la listview
- Ajouter l'id de la checklist en paramètre de l'url du lien vers la page view (ex: view.html?id=5)
- Ajouter cette id également pour les liens vers la page de formulaire

Tips:
- Utiliser la méthode jquery "html()" pour vider la liste
- Utiliser la méthode jquery "append()" pour ajouter des éléments à la listview
- Ne pas oublier de rafraichir de listview une fois que les éléments sont dynamiquement créé(.listview("refresh"))

### Etape 15: Page view dynamique

- Ajouter un bind sur l'évènement "pagebeforeshow" de la page view
- Récupérer le paramètre de l'url pour récupérer la bonne checklist
- Parcourir la liste de tâches de la checklist et créer dynamiquement les checkboxes.
- Pour chaque checkbox, ajouter un bind sur l'évènement "change" et changer la valeur du "done" dans l'objet checklist
  

Helper pour récupérer le paramètre de l'url:

    var getUrlParameter = function(paramName) {
	  var urlParams = window.location.href.split('?')[1];
	  if (urlParams) {
	    var params = urlParams.split('&');

        for (var i = 0; i <  params.length; i++) {
	      var param = params[i].split('=');
		  if (param[0] == paramName)
	        return param[1];
		}
	  }
	}


### Etape 16 : Page form dynamique

- Ajouter un bind sur l'évènement "pagebeforeshow" de la page form
- Récupérer l'id dans l'url
- Tester si l'id est présent pour savoir si c'est un ajout ou une édition
- Si c'est une édition
  - Remplir le champs name avec le nom de la checklist
  - Parcourir la liste des tâches et ajouter des input text pour chaque tâches avec le nom de la tâche déjà renseigné
- Ajouter un bind sur l'évènement "click" du bouton d'ajout de tâche qui ajoutera un input de tâche
- Ajouter un bind sur l'évènement "click du bouton de sauvegarde qui ajoutera une entré dans l'objet checklist en cas d'ajout et qui modifira la checklist en cas d'édition

### Etape 17 : Le stocackage


- Ajouter un bind sur l'évènement pageinit
- Remplir l'object checklists avec les données du localstorage avec la clé "checklists"
- Lors de chaque action sur l'object checklists, sauvegarder les changement dans le localstorage avec la clé checklist

Ressources
----------
[Structure d'une page jquery](http://jquerymobile.com/demos/1.3.0-beta.1/docs/pages/page-anatomy.html)
[Les liens](http://view.jquerymobile.com/1.3.1/dist/demos/widgets/links/)
[les headers](http://view.jquerymobile.com/1.3.1/dist/demos/widgets/headers/)
[Les transitions](http://jquerymobile.com/demos/1.3.0-beta.1/docs/pages/page-transitions.html)
[Les listes](http://jquerymobile.com/demos/1.3.0-beta.1/docs/lists/index.html)
[Les checkboxes](http://jquerymobile.com/demos/1.3.0-beta.1/docs/forms/checkboxes/)
[Text input](http://jquerymobile.com/demos/1.3.0-beta.1/docs/forms/textinputs/)
[Forms](http://jquerymobile.com/demos/1.3.0-beta.1/docs/forms/docs-forms.html)
[Split button](http://jquerymobile.com/demos/1.3.0-beta.1/docs/lists/lists-split.html)
[Base script](http://jquerymobile.com/demos/1.3.0-beta.1/docs/api/globalconfig.html)
[Events](http://jquerymobile.com/demos/1.3.0-beta.1/docs/api/events.html)
[Localstorage](http://www.lafermeduweb.net/billet/le-stockage-local-en-html5-localstorage-942.html)
