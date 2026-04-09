<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
    <xsl:output method="text"/>
    <xsl:template match="/">
        <xsl:text>Titulo,Artista,Duracion,Genero&#xa;</xsl:text>
        <xsl:for-each select="playlist/song">
        <xsl:value-of select="title"/>
        <xsl:text>,</xsl:text>
        <xsl:value-of select="artist"/>
        <xsl:text>,</xsl:text>
        <xsl:value-of select="duration"/>
        <xsl:text>,</xsl:text>
        <xsl:value-of select="genre"/>
        <xsl:text>&#xa;</xsl:text>
        </xsl:for-each>
    </xsl:template>
</xsl:stylesheet>
