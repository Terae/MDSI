<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0"
  xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
  xmlns="http://www.w3.org/1999/xhtml">
  <xsl:template match="/">
    <html lang="fr">
      <head>
        <title>Responsables a l'INSA</title>
      </head>
      <body>
        <xsl:apply-templates select="//Departements"/>
      </body>
    </html>
  </xsl:template>

  <xsl:template match="//Departements">
    <h1>Responsables des departements</h1>
    <xsl:apply-templates select="Departement"/>
  </xsl:template>

  <xsl:template match="//Departements/Departement">
    <h2>Departement <xsl:value-of select="@acronyme"/></h2>
  </xsl:template>

</xsl:stylesheet>
