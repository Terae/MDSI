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

Voici une image de ce diagramme final. Un [fichier PDF](https://github.com/Terae/MDSI/blob/master/Project/UML.pdf) est également disponible.

![Diagramme UML](UML.png)

### Écriture des bases de données

Une fois que l'on était d'accord sur l'architecture des bases de données, nous nous sommes répartis l'écriture des différentes classes dans des fichiers différents pour paralléliser les tâches.

Ainsi, le [fichier XSD principal](https://github.com/Terae/MDSI/blob/master/Project/src/INSA.xml) est une succession de balises `<xi:include>` tandis que chaque classe est renseignée dans des fichiers séparés.

Un simple appel à la fonction `xmllint --xinclude <file.xml> > <file.generated.xml>` permets à posteriori de n'avoir qu'un unique fichier XML utilisable pour générer des documents utiles aux étudiants étrangers.

### Validation du XSD

Une fois que les documents XML étaient bien avancés, on a commencé à rédiger le XSD pour valider l'ensemble de la base de données.

Nous avons fait le choix de rédiger les XML puis de rédiger différents XSD correspondant à chaque XML. Ça permettait à chacun de s'occuper d'une classe dans sa globalité, c'est à dire qu'après nous être réparti les classes, on pensait chacun écrire son document XML et XSD.

Cependant, ce procédé n'était pas le bon et nous a fait perdre du temps car les classes sont liées entre elles, et notamment le [fichier regroupant les personnes](https://github.com/Terae/MDSI/blob/master/Project/src/Personnes.xml) est utilisé par tous les autres fichiers.

Ainsi, on a centralisé la rédaction du fichier de validation. Les documents XML ont ainsi pu être validés relativement tôt dans leur écriture.

### Génération de documents HTML

Une fois que toute la base de donnée a été remplie et validée, on a commencé à écrire différents fichiers XSL pour fournir aux étudiants des fichiers web plus lisibles.

On en a écrit huit différents pour fournir une prévisualisation efficace des différentes formations proposées par l'INSA :
* [Liste des compétences par spécialité](https://github.com/Terae/MDSI/blob/master/Project/src/listeCompParSpe.xsl)
* [Liste des cours par spécialité](https://github.com/Terae/MDSI/blob/master/Project/src/listeCoursParSpe.xsl)
* [Liste des épreuves](https://github.com/Terae/MDSI/blob/master/Project/src/listeEpreuves.xsl
* [Liste des responsabilités de chaque personne](https://github.com/Terae/MDSI/blob/master/Project/src/listeRespo.xsl)
* [Liste des Unités de Formation par spécialité](https://github.com/Terae/MDSI/blob/master/Project/src/listeUFImportantes.xsl) qui rapportent plus de 5 crédits ECTS
* [Liste de toutes les Unités de Formation par spécialité](https://github.com/Terae/MDSI/blob/master/Project/src/listeUfParSpe.xsl)
* [Nombre d'heures de chaque cours](https://github.com/Terae/MDSI/blob/master/Project/src/NbHeuresCours.xsl)
* [Liste des pré-orientations](https://github.com/Terae/MDSI/blob/master/Project/src/PO.xsl)

## Travail individuel : répartition des tâches

### Maxime ARENS
### Benjamin BIGEY

Durant ce projet, mon rôle global a été de coordiner le travail de toute l'équipe : j'ai encadré l'avancement du diagramme UML, je l'ai mis au propre sur ordinateur puis une fois qu'il était accepté par toute le monde j'ai converti la structure en 3NF.

Ensuite, après nous avoir réparti le travail d'écriture des documents XML, j'ai commencé à maintenir un [makefile](https://github.com/Terae/MDSI/blob/master/Project/src/makefile) 

### Thomas MAISIERES

Après avoir fait la conception du diagramme de classe en groupe, comme il est expliqué au dessus, il m'a été confié de m'occuper de la classe UF et Semestre en priorité, j'ai donc commencé par implementer le fichier UF.xml, contenant l'ensemble des UF du semestre 3 à 6, ainsi que les semestres 6 (pour chaque pré-Orientation existante) de MIC, IC et ICBE, avec le code, nombre de crédits ECTS apportés, le nom, le grand domaine, le type, le semestre associés, si c'est un semestre avec évaluation par compétences et la compétence acquise.

![Extrait du fichier UF.xml](UF.png)

Je me suis ensuite occupé des Semestres, ou il fallait faire correspondre les Id des UFs implémentés précedemment. Il est constitué de Id, responsable semestre, et de la spécialité associées.

![Extrait du fichier Semestres.xml](Semestre.png)

Il était important de respecter les mises en formes élaborées précedemment pour pouvoir avoir une concordance entre chaque fichier, par exemple la syntaxe pour les UFs, ou les noms ( Prenom-NOM-1 ) pour les responsables UF.

Puis pour finir avec les fichiers xml, avec Jordan on a implémenté le fichier xml Competences qui contient un identifiant, etant un nom de compétence, permettant aux UFs de faire référence à une compétence.

Ensuite, je suis passé à la partie XML-Schema, sur INSA.xsd, avec UF et UFs, Semestre et Semestres, pour UFs et Semestres, j'ai du créer des types personnalisés, pour faire correspondre au .xml, il y a d'abord le type "par_competence" qui ne peut etre qu'un string avec pour valeurs "oui" ou "non". Le type "hetero_ou_continu" lui aussi un string avec comme valeurs "Heterogene" ou "Homogene". Les deux sont utilisés dans UFs, en dehors de ses deux là, les autres sont de type "classique" c'est à dire qu'ils sont soit "xsd:string" soit "xsd:int". 

### Jordan DELENTE

1. Partie XML:

Pour ma partie, j'ai commencé par implémenter le fichier xml Personnes, contenant toutes les personnes travaillant à l'INSA en leurs donnant un identifiant sous la forme de "NOM-Prenom-1". Beaucoup d'autres éléments ont un responsable étant une personne, l'identifiant de personne permet de faire référence à une personne comme étant un responsable.

Par la suite, après que mon collègue ai implémenté le fichier xml UFs, j'ai pu implémenter le fichier xml Cours, qui contient tous les cours, avec pour identifiant son nom, et ayant deux références, un responsable de cours, étant un id de Personnes ainsi qu'un UF associé qui est un id de UFs. De plus, chaque cours contient un élement type, permettant de savoir si le cours est obligatoire ou facultatif.

Suite à l'implémentation de cours, j'ai fait le xml de Epreuves, ayant un identifiant étant le code de l'épreuve, et une référence vers le cours qui lui est associé, qui est le nom du cours.

2. Partie XML-Schema:

Les fichiers xml étant tous remplis avec chaque élement, attributs et sous élements, j'ai codé ma partie du fichier xml schema INSA.xsd, pour les éléments Personnes, Personne, LesCours, Cours, Epreuves, Epreuve, Competences et Competence, ainsi que chaque clé et référence. Pour finir sur le xml schema, j'ai eu à créer un type pour l'élément type dans l'élément Cours. Comme dit précedement, ce type devait etre un string étant soit obligatoire soit facultatif.

## Conclusion

Nous pensons qu'une des choses à améliorer dans le projet en lui même, c'est l'implémentation des valeurs, car une grosse partie du temps est consacré à entrer des données diverses pour pouvoir tester au mieux nos fichiers via de multiples requetes xslt, donc forcément du temps en moins pour améliorer la conception, ou encore travailler sur un CSS plus développé.
Pour ce qui est de l'organisation de la matière nous trouvons que le pourcentage de la notation accordé au projet, par rapport au temps passé dessus n'est pas du tout proportionnel alors qu'un bon nombres de compétences sont acquises lors de ce projet, et peut refléter parfois autant si ce n'est plus l'acquisition des compétences attendues qu'un partiel.

Pour ce qu'il y a de positif, nous avons trouvé que le déroulement était bien organisé, nous avons pu bénéficier d'une aide pour différents type de quesitons facilement et régulièrement. De plus, les séances n'étant pas trop écartées entres elles, celà ne permet de pas perdre le fil et de pouvoir être à notre avis plus efficace que si le projet était répartie sur une plus grande durée.

    
Points à améliorer, choses + et -
25% pour le projet c'est du foutage de gueule
