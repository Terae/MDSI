# TDs de XML

Il faut installer l'exécutable `xmllint` pour valider de nombreuses choses en XML.

Voici des commandes à lancer :
* vérifier si un **document XML** est bien formé : `xmllint --noout document_XML.xml `
* tester la validité d'un **document XML** vis-à-vis d'une **DTD** : `xmllint --valid --noout  document_XML.xml`
* tester la validité d'un **document XML** vis-à-vis d'un **Schéma XML** : `xmllint --schema nom_XML_schéma.xsd document_XML.xml `
