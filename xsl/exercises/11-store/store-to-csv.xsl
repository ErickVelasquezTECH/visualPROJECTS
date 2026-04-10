<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
    <xsl:output method="text"/>
    <xsl:template match="/">
        <xsl:text>Producto,Seccion,Precio,Rating,TieneOferta&#xa;</xsl:text>
        <xsl:for-each select="//item">
        <xsl:sort select="price" order="descending" data-type="number"/>
            <xsl:value-of select="name"/>
            <xsl:text>,</xsl:text>
            <xsl:value-of select="../@name"/>
            <xsl:text>,</xsl:text>
            <xsl:value-of select="price"/>
            <xsl:text>,</xsl:text>
            <xsl:value-of select="rating"/>
            <xsl:text>,</xsl:text>
            <xsl:choose>
                <xsl:when test="tags[tag = 'sale']">
                    <xsl:text>Si</xsl:text>
                </xsl:when>
                <xsl:otherwise>
                    <xsl:text>NO</xsl:text>
                </xsl:otherwise>
            </xsl:choose>
            <xsl:text>&#xa;</xsl:text>
        </xsl:for-each>
    </xsl:template>
</xsl:stylesheet>