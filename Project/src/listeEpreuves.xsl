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
    <xsl:apply_templates select="code_epreuve"/>
  </xsl:template>
  <xsl:template match="code_epreuve">
      <h2> Epreuves <xsl:value-of select="//Epreuves/Epreuve/code"/> </h2>
  </xsl:template>
</xsl:stylesheet>
