<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
    <xsl:template match="/">
        <html>
            <p>Lista de todos los links:</p>
            <ul>
                <xsl:for-each select="//link">
                <li><xsl:value-of select="."/></li>
                </xsl:for-each>
            </ul>
            <p>Libros con nationality Argentina:</p>
            <ul>
                <xsl:for-each select="//author[@nationality='Argentina']">
                <li><xsl:value-of select="."/></li>
                </xsl:for-each>
            </ul>

            <p>La suma de todas las páginas es:
                <xsl:value-of select="sum(//pages)"/> 
            </p>

            <p>El número de libros (contando los que tienen el elemento pages): 
                <xsl:value-of select="count(//book)"/>
            </p>

            <p>La media de todas las páginas es: 
                <xsl:value-of select="sum(//pages) div count(//pages)"/>
            </p>

            <p>La media de todas las páginas con solamente dos decimales es: 
                <xsl:value-of select="format-number(sum(//pages) div count(//pages), '#.##')"/>
            </p>
        </html>
    </xsl:template>
</xsl:stylesheet>