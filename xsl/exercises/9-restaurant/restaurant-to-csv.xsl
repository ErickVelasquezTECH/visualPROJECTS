<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
    <xsl:output method="text"/>
    <xsl:template match="/">
    <xsl:text>Plato,Categoria,Precio,Vegano&#xa;</xsl:text>
    <xsl:for-each select="menu/dish">
        <xsl:if test="price &lt; 20">
            <xsl:value-of select="name"/>
            <xsl:text>,</xsl:text>
            <xsl:value-of select="@category"/>
            <xsl:text>,</xsl:text>
            <xsl:value-of select="price"/>
            <xsl:text>,</xsl:text>
            <xsl:choose>
                <xsl:when test="vegan = 'true'">
                <xsl:text>Si</xsl:text>
                </xsl:when>
                <xsl:otherwise>
                <xsl:text>No</xsl:text>
                </xsl:otherwise>
            </xsl:choose>
            <xsl:text>&#xa;</xsl:text>
        </xsl:if>
    </xsl:for-each>

    </xsl:template>
</xsl:stylesheet>
