<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
    <xsl:output method="text"/>
    <xsl:template match="/">
        <xsl:text>{
            "restaurante": {
                "platos": [&#xa;</xsl:text>
                <xsl:for-each select="menu/dish">
                    <xsl:text>{
                        "nombre": "</xsl:text>
                        <xsl:value-of select="name"/>
                        <xsl:text>",
                        "categoria": "</xsl:text>
                        <xsl:value-of select="@category"/>
                        <xsl:text>",
                        "precio": </xsl:text>
                        <xsl:value-of select="price"/>
                        <xsl:text>,
                        "vegano": </xsl:text>
                        <xsl:value-of select="vegan"/>
                        <xsl:text>
                    }</xsl:text>
                    <xsl:if test="position() != last()"><xsl:text>,</xsl:text></xsl:if>
                    <xsl:text>&#xa;</xsl:text>
                </xsl:for-each>
                <xsl:text>],
                "precio_medio": </xsl:text>
                <xsl:value-of select="sum(//price) div count(//dish)"/>
                <xsl:text>
            }
        }</xsl:text>
    </xsl:template>
</xsl:stylesheet>