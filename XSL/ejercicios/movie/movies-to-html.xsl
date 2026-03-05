<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
    <xsl:template match="/">
        <html>
            <head>
                <title>Peliculas</title>
                <style>
                    table{
                        width: 100%
                    }
                    th { 
                        background-color: green; 
                        color: white; 
                    }
                    tr:nth-child(even) {
                        background-color: #f2f2f2; 
                    }
                </style>
            </head>
            <body>
                <table border="1px">
                    <tr>
                        <th>Titulo</th>
                        <th>Director</th>
                        <th>Año</th>
                        <th>Duración</th>
                        <th>Clasificación</th>
                        <th>Genero</th>
                        <th>Pais</th>
                    </tr>
                    <xsl:for-each select="movies/movie">
                    <xsl:sort select="year" order="descending"/>
                    <tr>
                        <td>
                            <xsl:value-of select="title"/>
                        </td>
                        <td>
                            <xsl:value-of select="director"/>
                        </td>
                        <td>
                            <xsl:value-of select="year"/>
                        </td>
                        <td>
                            <xsl:value-of select="duration"/>
                        </td>
                        <td>
                            <xsl:choose>
                                <xsl:when test="duration &lt; 105">
                                    Corta
                                </xsl:when>
                                <xsl:when test="duration &gt;= 105 and duration &lt;= 120">
                                    Media
                                </xsl:when>
                                <xsl:otherwise>
                                    Larga
                                </xsl:otherwise>
                            </xsl:choose>
                        </td>
                        <td>
                            <xsl:value-of select="genre"/>
                        </td>
                        <td>
                            <xsl:choose>
                                <xsl:when test="contains(country, 'Argentina')">
                                    <strong><xsl:value-of select="country"/></strong>
                                </xsl:when>
                                 <xsl:otherwise>
                                 <xsl:value-of select="country"/>
                                </xsl:otherwise>
                            </xsl:choose>
                        </td>
                    </tr>
                    </xsl:for-each>
                </table>
            </body>
        </html>
    </xsl:template>
</xsl:stylesheet>
