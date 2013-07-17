Création d'un pluggin phonegap
==============================

Ce TP à pour but de créer un plugin phonegap pour vous permettre d'étendre ses fonctionnalités.

Nous allons créer un plugin qui permet d'envoyer des SMS.

Création d'un plugin android
----------------------------

Un plugin phonegap pour android est en général composé d'au moins 3 fichiers:
- Un fichier JAVA qui va contenir le code natif du plugin
- Un fichier javascript qui va permettre de créer des fonction pour appeler le code natif
- Un fichier plugin.xml quoi va contenir la description du plugin et des information pour faire le lien entre JAVA et javascript

On va donc créer ces fichiers avec la hiérarchie suivante:

- SMSPlugin
    - plugin.xml
    - www
        - sms.js
    - scr
        - android
	    - SMSPlugin.java

Le fichier plugin.xml
---------------------

Comme tout fichier xml, ce fichier contien l'entête xml:

    <?xml version="1.0" encoding="UTF-8"?>

On a ensuite la balise plugin:

    <plugin xmlns="http://apache.org/cordova/ns/plugins/1.0"
        xmlns:android="http://schemas.android.com/apk/res/android"
	    id="com.phonegap.plugins.sms"
		version="0.1.0">

L'attribut id correspond au package de votre application JAVA
L'attribut version correspond à la version de votre plugin

Dans cette balise plugin nous avons ensuite la balise name qui contien le nom du plugin

    <name>SMSPlugin</name>

Ensuite viens la balise engines qui permet de définir les version de phonegap compatible avec le plugin

    <engines>
	    <engine name="cordova" version=">=2.0.0" />
    </engines>

On a ensuite la définition du module js

    <js-module src="www/sms.js" name="SMSPlugin">
        <clobbers target="sms" />
	</js-module>

L'attribut src défini le chemin du module javascript à inclure.
L'attribut name sert peut être à quelquechose
L'attribut target de l'élément clobbers permet de définir le nom de l'objet javascript qui sera utiliser pour appeler les fonctions de votre plugin

On défini ensuite les configurations spécifiques pour chaque platformes

    <platform name="android">

L'attribut name est le nom de la platforme. Dans notre cas c'est android, mais on peut mettre ios, blackberry, wp7, w8

    <source-file src="src/android/SMSPlugin.java" target-dir="src/com/phonegap/plugins/sms"/>

L'attribut src est le chemin vers le fichier JAVA du plugin
L'attribut target-dir et le chemin dans lequel sera inclut le fichier java dans l'application android (En général on suit les éléments du package)

    <config-file target="res/xml/config.xml" parent="plugins">
        <plugin name="SMSPlugin" value="com.phonegap.plugins.sms.SMSPlugin" />
    </config-file>

L'élément config permet d'ajouter des éléments au fichiers de config de l'application android.
L'attribut target est le chemin du fichier dans lequel on désire ajouter des éléments.
L'attribut parent est l'élément xml parent dans lequel on va rajouter nos nouvelles balises
L'élément plugin est l'élément qu'on va rajouter dans l'élément plugins.
L'attribut name est le nom du plugin.
L'attribut value correspond au packack.<nom de la class> du plugin. C'est cet élément qui va permettre de faire le liens entre le js et le JAVA.

    <config-file target="AndroidManifest.xml" parent="/manifest">
	    <uses-permission android:name="android.permission.SEND_SMS" />
    </config-file>
	
Ici on ajoute dans le fichier AndroidManifest.xml la permission pour envoyer les sms.

    </platform>
	</plugin>

On ferme les balises pour avoir un fichier xml complet

Fichier sms.js
--------------

On va dans un premier temps récupérer l'objet qui va permettre d'exécuter les fonction JAVA depuis le js

    var exec = require('cordova/exec')

On va ensuite créer un objet SMS avec la méthode send

    var SMS = function(){};

    SMS.prototype.send = function(number, message, success, error) {
        var args = [number, message];
		exec(success, error, "SMSPlugin", "send", args);
    }

Le premier paramètre de la fonction exec est le callback qui est appelé en cas de réussit de la fonction.
Le deuxième paramètre est le callback qui est appelé en cas d'échec de la fonction.
Le troisième paramètre est le nom de notre class JAVA
Le quatrième paramètre est le nom de l'action à exécuter
Le cinquième paramètre contiens les arguments à passer à la fonction JAVA

Il faut ensuite exporter le notre object pour qu'il soit utilisable.

    module.exports = new SMS();

Fichier SMSPlugin.java
----------------------

La première chose à faire est de mettre le package:

    package com.phonegap.plugins.sms

Il faut ensuite ajouter les différents imports:

    import org.json.JSONArray;
	import org.json.JSONException;
	import org.json.JSONObject;

    import android.app.Activity;
    import android.content.Intent;
    import android.util.Log;

    import org.apache.cordova.api.CordovaPlugin;
    import org.apache.cordova.api.CallbackContext;
    import org.apache.cordova.api.PluginResult;

    import android.telephony.SmsManager;

On va ensuite créer la class qui va hériter de CordovaPlugin

    public class SMSPlugin extends CordovaPlugin {
       
Il faut ensuite créer la méthode execute qui est la méthode qui sera appelé par cordova.

    public boolean execute(String action, JSONArray args, final CallbackContext callbackContext){
        
Le premier paramètre est le nom de l'action qui doit être exécuter. Dans notre cas c'est send.
Le deuxième paramètre est un objet contenant les arguments passer à la fonction exec
Le troisième paramètre est l'objet qui va parmètre d'appeler les callback success et error

    if("send".equals(action)) {
        try{
           SmsManager smsManager = SmsManager.getDefault();
		   String phoneNumber = args.getString(0);
		   String message = args.getString(1);
		   smsManager.sendTextMessage(phoneNumber, null, message, null, null);
		   callbackContext.success("SMS sent");
		   return true;
		}catch(Exception e) {
            callbackContext.error("SMS failed");
        }
    }
	return false;

Ici, on test que l'action est "send".
On récupère un objet SmsManager qui va permettre d'envoyer un sms.
On récupère les 2 paramètres passer dans args.
On envois le sms.
On envois le callback de success en cas de succes ou le callback d'échec en cas d'échec

        }
	}

On ferme les accolades pour fermer la fonction.

Nous avons donc maintenant un plugin permettant d'envoyer des sms.
Pour utiliser le plugin en javascript, il ne reste plus qu'à appeler l'objet sms (qu'on a défini dans la balise clobbers):

    widonw.sms.send("+3314567899", "Hello", function(success) {
        alert(success);
    }, function(error) {
        alert(error);
    });

Utilisation du plugin
---------------------

Pour mettre en application ce plugin, vous pouvez faire une application qui liste les contacts de l'utilisateur, et de leur envoyer un sms.
