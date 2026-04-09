<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
    <xsl:output method="html"/>
    <xsl:template match="/">
        <html>
            <head>
            <title>Mi Playlist Favorita</title>
            <style>
                body{
                    background-color: black;
                    color: white;
                }
                ol{
                    background-color: grey;
                    border-radius:10px;

                }
            </style>
            </head>
            <body>
                <ol>
                    <xsl:for-each select="playlist/song">
                    <li><xsl:value-of select="concat(title,' - ', Artista,' (duracion: ', duration,' segundos')"></xsl:value-of></li>
                    </xsl:for-each>
                </ol>
                <p>Total de canciones: 
                    <xsl:value-of select="count(//song)"/>
                </p>
                <p>Duracion total de segundos: 
                    <xsl:value-of select="sum(//duration)"/>
                </p>
                    
            </body>
        </html>
    </xsl:template>
</xsl:stylesheet>
