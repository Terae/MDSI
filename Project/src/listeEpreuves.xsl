<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0"
  xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
  xmlns="http://www.w3.org/1999/xhtml">
  <xsl:template match="/">
    <html lang="fr">
      <head>
        <title>Liste des Epreuves</title>
      </head>
      <body>
        <xsl:apply-templates select=".//LesCours"/>
      </body>
    </html>
  </xsl:template>

  <xsl:template match="LesCours">
    <h1>Responsables des departements</h1>
    <xsl:apply-templates select="Cours"/>
  </xsl:template>
  <xsl:template match="Cours">
    <h2>Cours <xsl:value-of select="@nom"/> </h2>
    <xsl:apply-templates select="@nom"/>
  </xsl:template>
  <xsl:template match="@nom">
    <xsl:variable name="My_Name" select="."/>
    <xsl:for-each select="//Epreuves/Epreuve">
      <xsl:if test="cours_associe=$My_Name">
        <h4> Epreuve : <xsl:value-of select="@code"/>  </h4>
        <h4> duree : <xsl:value-of select="Duree"/> ; nature : <xsl:value-of select="Nature"/> ; coeff : <xsl:value-of select="Coefficient"/></h4>
      </xsl:if>
    </xsl:for-each>
  </xsl:template>
</xsl:stylesheet>
