# MDSI - XML et ses Technologies

**XML** : eXtensible Marktup Language

Manière de structurer les données, sans s'occuper de la mise en forme

## Modèles de représentation existants
* **hiérarchique** *(LDAP)* : modèle logique avec des descendances ; problème : pas de cycle (impossible de remonter l'arbre) ; obligation de faire des duplications de données : pas de plusieurs vers plusieurs
* **relationnel** *(SQL)* : domaine, attributs et tuples : création de tables liées par des relations ; notion de normalisation
	* points forts : modèle simple, formel et bien fondé (normalisé) ; langage répandu (SQL), de bons systèmes de gestion de BDD
	* points faibles : ne permets pas de représenter les objets les plus complexes qu'une simple relation obliée de tout décomposer en éléments très simples
* **objets** : procipaux concepts : classe, objet, héritage, polymorphisme, persistance
	* langage apparu tardivement dans les entreprises : pas de transfert simple depuis le relationnel donc peu utilisé maintenant
	* pas de normalisation (à l'origine : langage de prog)
* **BDD relationnelles-objets** : extension du modèle relationnel à l'aide de type de données abstraits -> donne le ***SQL3***
	* héritage entre types
	* encapsulation des données des tables
	* migration relationnel -> objet facile, mais le retour en arrière est complexe
* **NoSQL** : pas de relations entre les données, bien pour les données massives
* **Web sémantique** : se base sur le sens des données *(cf cours S2)*

---

## XML

_Objectif :_ Mettre en forme un document et donner un sens aux éléments qu'il contient grâce à la notion de **balise**

```xml
<laboratoire type="recherche">
	<nom>LAAS-CNRS</nom>
	<addresse>7 avenue du Colonel Roche, F 31077 Toulouse France</adresse>
</laboratoire>
```

Un document XML possède une **structure arborescente** avec différents types de noeuxs : element, comment, attribute, Test

```xml
<?xml version =" 1.0 " encoding=" iso-8859-1" ?> : Entête XML

<!-- ceci est un commentaire --> : Commentaire

<laboratoire type="recherche"> : élément racine

</laboratoire  : Balise fermante de l'élément racine 'laboratoire'
```

### Caractères spéciaux
Certains caractères sont réservés : `<`, `>`, `&`, `"`, `'`
Pour les intégrer dans le texte, il faut utiliser des chapines prédéfinies (`&lt`, `&gt`, ...)

### Attributs

La représentation avec attributs est équivalente à celle par éléments :

```xml
<chercheur nom="Eude" prenom="Jean">
<chercheur>
	<nom>Eude</nom>
	<prenom>Jean</prenom>
</chercheur>
```

Il faut favoriser les attributs pour :

* une valeur simple
* une valeur qui n'est pas répétée
* *exemple* : id, numéro, code, réf, ...

***Exemple :***

```xml
<?xml version="1.0" encoding="iso-8859-1" ?>

<laboratoire type="recherche">
	<projet acronyme="AC1" titre="Premier projet" portee="national">
		<partenaire nom="Dupuis" prenom="Jean" pays="Belgique">
			<role>Inspecteur des travaux finis</role>
		</partenaire>
		<partenaire nom="Dupont" prenom="Paulette" pays="Canada">
			<role>Stagiaire</role>
			<role>Maîtresse</role>
		</partenaire>
	</projet>

	<projet acronyme="AC2" titre="Projet trop cool" portee="europeen">
		<partenaire nom="LAAS" prenom="CNRS" pays="France">
			<role>Ceux qui sont intelligents</role>
		</partenaire>
	</projet>
</liste>
```

### Les espaces de nom
Permet d'identifier la prevenance de chaque élément ou attribut

Les identifiants doivent avoir la forme d'une URL.

```xml
<?xml ...>
<commande xmlns:produit="http://entreprise1/produit" xmlns:client="http://entreprise2/serviceA/client">
	<produit:numero>p125</produit:numero>
	<produit:quantite>2</produit:quantite>
	<client:numero>0618953658></client:produit>
	<client:nom>Claude</client:nom>
</commande>
```

On peut faire des 'nested' espaces de nom :
```xml
<enseignant xmlns="http://..."
			xmlns:c="http://cours/...">
	<nom>...</nom>
	<titre>...</titre>
	<c:cours>
		<c:titre>...</c:titre>
		.
		.
		.
	</c:cours>
</enseignant>
```