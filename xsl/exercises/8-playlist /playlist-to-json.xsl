<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
    <xsl:output method="text"/>
    <xsl:template match="/">
        
        <xsl:text>{
            "playlist": {
                "total_canciones": </xsl:text>
                <xsl:value-of select="count(//song)"/>
                <xsl:text>,
                "canciones":[&#xa;</xsl:text>
                <xsl:for-each select="playlist/song">
                    <xsl:text>{
                        "titulo": "</xsl:text>
                        <xsl:value-of select="title"/>
                        <xsl:text>",
                        "artista": "</xsl:text>
                        <xsl:value-of select="artist"/>
                        <xsl:text>",
                        "duracion": </xsl:text>
                        <xsl:value-of select="duration"/>
                        <xsl:text>,
                        "genero": "</xsl:text>
                        <xsl:value-of select="genre"/>
                        <xsl:text>"
                    }</xsl:text>
                    <xsl:if test="position() != last()"><xsl:text>,</xsl:text></xsl:if>
                    <xsl:text>&#xa;</xsl:text>
                </xsl:for-each>
                <xsl:text>]
            }
        }</xsl:text>

    </xsl:template>
</xsl:stylesheet>
