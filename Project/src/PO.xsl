<?xml version="1.0" encoding="UTF-8"?>

<xsl:stylesheet version="1.0"
  xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
  xmlns="http://www.w3.org/1999/xhtml">
  <xsl:template match="/">
    <html lang="fr">
      <head>
        <title>Nombre total d'UFs par PO</title>
      </head>
      <body>
        <xsl:apply-templates select="//Specialites"/>
      </body>
    </html>
  </xsl:template>

  <xsl:template match="//Specialites">
    <h1>PO</h1>
    <xsl:apply-templates select="Specialite"/>
  </xsl:template>

  <xsl:template match="//Specialites/Specialite">
    <h2> <xsl:value-of select="@acronyme"/></h2>
    <xsl:apply-templates select="Semestre"/>
  </xsl:template>

  <xsl:template match="//Specialites/Specialite/Semestre">
    <xsl:apply-templates select="//Semestres/Semestre"/>
  </xsl:template>

  <xsl:template match="//Semestres/Semestre">
    <h3> <xsl:value-of select="count(UF)"/></h3>
  </xsl:template>

</xsl:stylesheet>
