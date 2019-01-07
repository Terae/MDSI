<?xml version="1.0" encoding="UTF-8"?>

<xsl:stylesheet version="1.0"
  xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
  xmlns="http://www.w3.org/1999/xhtml">
  <xsl:template match="/">
    <html lang="fr">
      <head>
        <title>Specialite</title>
		<link rel="stylesheet" type="text/css" href="../css/styles.css"/>
      </head>
      <body>
        <xsl:apply-templates select="//Specialites"/>
      </body>
    </html>
  </xsl:template>

  <xsl:template match="//Specialites">
    <h1>Specialites</h1>
    <xsl:apply-templates select="Specialite"/>
  </xsl:template>

  <xsl:template match="//Specialites/Specialite">
    <h2> * <xsl:value-of select="@acronyme"/></h2>
  </xsl:template>

</xsl:stylesheet>
