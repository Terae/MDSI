<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0"
  xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
  xmlns="http://www.w3.org/1999/xhtml">
  <xsl:template match="/">
    <html lang="fr">
      <head>
        <title>Liste Respo</title>
      </head>
      <body>
        <xsl:apply-templates select=".//Personnes"/>
      </body>
    </html>
  </xsl:template>

  <xsl:template match="Personnes">
    <h1>Liste des Responsabilites par personne</h1>
    <xsl:apply-templates select="Personne"/>
  </xsl:template>

  <xsl:template  match="Personne" >
    <h2> * <xsl:value-of select="@id"/> </h2>
    <xsl:apply-templates select="@id"/>
  </xsl:template>



  <xsl:template match="@id" >
    <xsl:variable name="My_id" select="."/>
    <xsl:for-each select="//Departements/Departements">
      <xsl:if test="directeur=$My_id">
        <h3> - Responsable de <xsl:value-of select="nom"/> </h3>
      </xsl:if>
    </xsl:for-each>

    <xsl:for-each select="//Specialites/Specialite">
      <xsl:if test="Responsable=$My_id">
        <h3> - Responsable de <xsl:value-of select="nom"/> </h3>
      </xsl:if>
    </xsl:for-each>

    <xsl:for-each select="//Semestres/Semestre">
      <xsl:if test="responsable_semestre=$My_id">
        <h3> - Responsable de <xsl:value-of select="@id"/> </h3>
      </xsl:if>
    </xsl:for-each>

    <xsl:for-each select="//UFs/UF">
      <xsl:if test="responsable_UF=$My_id">
        <h3> - Responsable de <xsl:value-of select="nom"/> </h3>
      </xsl:if>
    </xsl:for-each>

    <xsl:for-each select="//LesCours/Cours">
      <xsl:if test="responsable_cours=$My_id">
        <h3> - Responsable de <xsl:value-of select="@nom"/> </h3>
      </xsl:if>
    </xsl:for-each>

  </xsl:template>




</xsl:stylesheet>
