<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
    <xsl:output method="text"/>
    <xsl:template match="/">
        <xsl:text>{
            "biblioteca": {
                "libros":[&#xa;</xsl:text>
                <xsl:for-each select="library/book">
                    <xsl:text>{
                        "id": "</xsl:text>
                        <xsl:value-of select="@id"/>
                        <xsl:text>",
                        "titulo": "</xsl:text>
                        <xsl:value-of select="title"/>
                        <xsl:text>",
                        "autor": "</xsl:text>
                        <xsl:value-of select="author"/>
                        <xsl:text>",
                        "year": </xsl:text>
                        <xsl:value-of select="year"/>
                        <xsl:text>,
                        "paginas": </xsl:text>
                        <xsl:value-of select="@pages"/>
                        <xsl:text>,
                        "disponible": </xsl:text>
                        <xsl:value-of select="available"></xsl:value-of>
                        <xsl:text>&#xa;}</xsl:text>
                    <xsl:if test="position() != last()"><xsl:text>,</xsl:text></xsl:if>
                    <xsl:text>&#xa;</xsl:text>
                </xsl:for-each>
                <xsl:text>]
            }
        }</xsl:text>
    </xsl:template>
</xsl:stylesheet>