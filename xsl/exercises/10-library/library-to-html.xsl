<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
    <xsl:output method="html"/>
    <xsl:template match="/">
        <html>
            <head>
            <title>Biblioteca</title>
            <style>
                thead{
                    background-color: blue;
                    color: white;
                }
                tbody>tr:first-child{
                    background-color: yellow;
                }
            </style>
            </head>
            <body>
                <table border="1">
                    <thead>
                        <tr>
                            <th>Título</th>
                            <th>Autor</th>
                            <th>Año</th>
                            <th>Páginas</th>
                            <th>Disponible</th>
                            <th>Idioma</th>
                        </tr>
                    </thead>
                    <tbody>
                        <xsl:for-each select="library/book[@pages > 250]">
                        <tr>
                            <td>
                                <xsl:value-of select="title"/><xsl:if test="year &lt; 1950"> (clasico)</xsl:if>
                            </td>
                            <td><xsl:value-of select="author"/></td>
                            <td><xsl:value-of select="year"/></td>
                            <td><xsl:value-of select="@pages"/></td>
                            <td>
                                <xsl:choose>
                                    <xsl:when test="available = 'false'">
                                        En préstamo
                                    </xsl:when>
                                    <xsl:otherwise>
                                       Disponible 
                                    </xsl:otherwise>
                                </xsl:choose>
                            </td>
                            <td><xsl:value-of select="@language"/></td>
                        </tr>
                        </xsl:for-each>
                    </tbody>
                </table>
            </body>
        </html>
    </xsl:template>
</xsl:stylesheet>