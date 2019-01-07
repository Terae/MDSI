<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0"
  xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
  xmlns="http://www.w3.org/1999/xhtml">
  <xsl:template match="/">
    <html lang="fr">
      <head>
        <title>Liste des UF par Specialite</title>
		<link rel="stylesheet" type="text/css" href="../css/styles.css"/>
      </head>
      <body>
        <xsl:apply-templates select=".//Specialites"/>
      </body>
    </html>
  </xsl:template>

  <xsl:template match="Specialites">
    <h1>Liste des Unites de Formation par Specialite</h1>
    <xsl:apply-templates select="Specialite"/>
  </xsl:template>

  <xsl:template  match="Specialite" >
    <h2> * <xsl:value-of select="@acronyme"/> </h2>
    <xsl:apply-templates select="@acronyme"/>
  </xsl:template>

  <xsl:template match="@acronyme" >
    <xsl:variable name="My_Name" select="."/>
    <xsl:for-each select="//Semestres/Semestre">
      <xsl:if test="specialite_associee=$My_Name">
        <h3> == <xsl:value-of select="@id"/> == </h3>
        <xsl:apply-templates select="@id"/>
      </xsl:if>
    </xsl:for-each>
  </xsl:template>

  <xsl:template match="@id">
    <xsl:variable name="My_id" select="."/>
    <xsl:for-each select="//UFs/UF">
      <xsl:if test="semestre_associe=$My_id">
        <xsl:if test="ECTS >= 5">
          <h4> - <xsl:value-of select="nom"/> </h4>
        </xsl:if>
      </xsl:if>
    </xsl:for-each>
  </xsl:template>

</xsl:stylesheet>
