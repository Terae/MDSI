Maxime ARENS, [arens@etud.insa-toulouse.fr](mailto:arens@etud.insa-toulouse.fr)

Benjamin BIGEY, [bigey@etud.insa-toulouse.fr](mailto:bigey@etud.insa-toulouse.fr)

Jordan DELENTE, [delente@etud.insa-toulouse.fr](mailto:delente@etud.insa-toulouse.fr)

Thomas MAISIERES, [maisiere@etud.insa-toulouse.fr](mailto:maisiere@etud.insa-toulouse.fr)

# Rapport du projet MDSI

Ce projet est réalisé dans le cadre du module MDSI lors de la formation de 4ème année à l'INSA Toulouse, en Informatique et Réseaux.

Le code source de ce projet est [entreposé sur un dépôt GitHub](https://github.com/Terae/MDSI/tree/master/Project).

## Objectif

Ce Bureau D'Étude a pour objectif de gérer la maquette des cours de l'INSA pour les étudiants étrangers.

La base de donnée est sous forme de XML, la validation schématique se fait grâce à un XSD et des fichiers XSL permettent de générer des fichiers HTML pour aider les étudiants étrangers avec un affichage utilisable.

## Travail en commun

### Conception de la base de donnée

Après avoir reçu le cahier des charges, nous avons commencé à définir un diagramme UML qui explicite la base de donnée répondant au problème.

Voici une image de ce diagramme. Un [fichier PDF](https://github.com/Terae/MDSI/blob/master/Project/UML.pdf) est également disponible.

![Diagramme UML](UML.png)

### Choix
* XSL : on a fait nos propres fichiers qui semblent utiles (pas de compteur d'UFs)
* GitHub : chacun travaille sur son fichier
	* mise en commun avec INSA.xml avec des balises <xml:include/>
* chronologiquement : UML, XML, XSD pour tout valider, on aurait dû faire XSD puis XML ? (ouverture, toussa)

## Travail individuel : répartition des taches

Travail de chacun
1.
2.
3.

4.
	1.	Partie XML:

		Pour ma partie, j'ai commencé par implémenter le fichier xml Personnes, contenant toutes les personnes travaillant à l'INSA en leurs donnant un identifiant sous la forme de "NOM-Prenom-1". Beaucoup d'autre elements ont un responsable étant une personne, l'identifiant de personne permet de faire reference a une personne comme etant un responsable.

 		Par la suite, après que mon collègue ai implémenté le fichier xml UFs, j'ai pu implémenter le fichier xml Cours, qui contient tout les cours, avec pour identifiant son nom, et ayant deux références, un responsable de cours, étant un id de Personnes ainsi qu'un UF associé qui est un id de UFs. De plus, chaque cours contient un élement type, permettant de savoir si le cours est obligatoire ou facultatif.

 		Suite à l'implémentation de cours, j'ai fais le xml de Epreuves,  ayant un identifiant étant le code de l'épreuve, et une référence vers le cours qui lui est associé, qui est le nom du cours. 

		Puis pour finir, j'ai implémenté le fichier xml Competences qui contient un identifiant, etant un nom de compétence, permettant aux UFs de faire référence à une compétence.


	2.	Partie XML-Schema:

		Les fichiers xml étant tous remplis avec chaque élement, attributs et sous élements, j'ai codé ma partie du fichier xml schema INSA.xsd, pour les elements Personnes, Personne, LesCours, Cours, Epreuves, Epreuve, Competences et Competence, ainsi que chaque clé et reference. Pour finir sur le xml schema, j'ai eu a creer un type pour l'élement type dans l'élement Cours. Comme dit précedement, ce type devait etre un string etant soit obligatoire soit facultatif.



## Conclusion

Points à améliorer, choses + et -
25% pour le projet c'est du foutage de gueule
