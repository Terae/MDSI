<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0"
  xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
  xmlns="http://www.w3.org/1999/xhtml">
  <xsl:template match="/">
    <html lang="fr">
      <head>
        <title>Nombre d'enseignants</title>
      </head>
      <body>
        <h1>Calcul du nombre d'enseignants.</h1>
        <xsl:apply-templates select="//enseignants"/>

        <h1>Voici la liste des enseignants :</h1>
        <ul><xsl:apply-templates select="//enseignant"/></ul>

        <h1>Elle peut meme etre triee !</h1>
        <ul>
          <xsl:apply-templates select="//enseignant">
            <xsl:sort select="nom"/>
          </xsl:apply-templates>
        </ul>

        <h1>Enfin, ces enseignants sont dans des departements</h1>
        <ul>
          <xsl:apply-templates select="//departement">
            <xsl:sort/>
          </xsl:apply-templates>
        </ul>
      </body>
    </html>
  </xsl:template>

  <xsl:template match="//enseignants">
    L'universite contient <xsl:value-of select="count(//enseignant)"/> enseignants.
  </xsl:template>

  <xsl:template match="//enseignant">
    <li><xsl:value-of select="nom"/></li>
  </xsl:template>

  <xsl:template match="departement[not(preceding::enseignant/departement=current())]">
    <li><xsl:value-of select="."/></li>
  </xsl:template>
  <!-- Cas où on a un doublon -->
  <xsl:template match="departement"/>

</xsl:stylesheet>
