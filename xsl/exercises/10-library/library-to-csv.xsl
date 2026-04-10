<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
    <xsl:output method="text"/>
    <xsl:template match="/">
    <xsl:text>ID,Titulo,Autor,Year,Paginas,Idioma,Disponible&#xa;</xsl:text>
    <xsl:for-each select="library/book[@language = 'es']">
    <xsl:value-of select="@id"/>
    <xsl:text>,</xsl:text>
    <xsl:value-of select="title"/>
    <xsl:text>,</xsl:text>
    <xsl:value-of select="author"/>
    <xsl:text>,</xsl:text>
    <xsl:value-of select="year"/>
    <xsl:text>,</xsl:text>
    <xsl:value-of select="@pages"/>
    <xsl:text>,</xsl:text>
    <xsl:value-of select="@language"/>
    <xsl:text>,</xsl:text>
    <xsl:choose>
        <xsl:when test="available = 'true' ">
            <xsl:text>Si</xsl:text>
        </xsl:when>
        <xsl:otherwise>
            <xsl:text>No</xsl:text>
        </xsl:otherwise>
    </xsl:choose>
    <xsl:text>&#xa;</xsl:text>
    </xsl:for-each>
    </xsl:template>
</xsl:stylesheet>