<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
    <xsl:template match="/">
        <html>
            <head>
                <title>Mis canciones favoritas</title>
            </head>
            <body>
                <h1>Mis canciones favoritas</h1>
                <ul>
                    <xsl:for-each select="songs/song">
                    <xsl:sort select="year" order="ascending"/>
                    <li>
                        <xsl:value-of select="concat(title,' (', year, ') - ', artist)"/>
                    </li>
                    </xsl:for-each>
                </ul>
            </body>
        </html>
    </xsl:template>
</xsl:stylesheet>