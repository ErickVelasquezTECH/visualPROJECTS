<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
    <xsl:output method="html"/>
    <xsl:template match="/">
        <html>
            <head>
                <title>Tienda Online</title>
            </head>
            <body>
                <table border="1">
                    <thead>
                        <tr>
                            <th>#</th>
                            <th>Producto</th>
                            <th>Sección</th>
                            <th>Precio</th>
                            <th>Rating</th>
                            <th>¿Oferta?</th>
                        </tr>
                    </thead>
                    <tbody>
                        <xsl:for-each select="//item">
                        <tr>
                            <td><xsl:value-of select="position()"/></td>
                            <td><xsl:value-of select="name"/></td>
                            <td><xsl:value-of select="../@name"/></td>
                            <td><xsl:value-of select="round(price)"/></td>
                            <td><xsl:value-of select="format-number(rating, '#.0')"/></td>
                            <td>
                                <xsl:choose>
                                    <xsl:when test="tags[tag = 'sale']">
                                        <xsl:text>Si</xsl:text>
                                    </xsl:when>
                                    <xsl:otherwise>
                                        <xsl:text>NO</xsl:text>
                                    </xsl:otherwise>
                                </xsl:choose>
                            </td>
                        </tr>
                        </xsl:for-each>
                    </tbody>
                </table>
            </body>
        </html>
    </xsl:template>
</xsl:stylesheet>