<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0"
  xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
  xmlns="http://www.w3.org/1999/xhtml">
  <xsl:template match="/">
    <html lang="fr">
      <head>
        <title>Nb Heures par Cours</title>
		<link rel="stylesheet" type="text/css" href="../css/styles.css"/>
      </head>
      <body>
        <xsl:apply-templates select=".//UFs"/>
      </body>
    </html>
  </xsl:template>

  <xsl:template match="UFs">
    <h1>Nombre d'heures par Cours</h1>
    <xsl:apply-templates select="UF"/>
  </xsl:template>

  <xsl:template  match="UF" >
    <h2> * <xsl:value-of select="nom"/> </h2>
    <xsl:apply-templates select="@code"/>
  </xsl:template>



  <xsl:template match="@code" >
    <xsl:variable name="My_Code" select="."/>
    <xsl:for-each select="//LesCours/Cours">
      <xsl:if test="uf_associe=$My_Code">

        <h3> - <xsl:value-of select="@nom"/> : <xsl:value-of select="CM+TD+TP"/>h </h3>
      </xsl:if>
    </xsl:for-each>
  </xsl:template>



</xsl:stylesheet>
