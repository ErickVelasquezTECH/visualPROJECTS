<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
    <xsl:output method="html"/>
    <xsl:template match="/">
        <html>
            <head>
                <title>Carta del Restaurante</title>
                <style>
                    table{
                        border-collapse: collapse;
                    }
                    td, th{
                        padding: 5px;
                    }
                    tr:nth-child(even){
                        background-color: grey;
                    }
                </style>
            </head>
            <body>
                <table border="1px">
                    <thead>
                        <tr>
                            <th>Plato</th>
                            <th>Categoría</th>
                            <th>Precio</th>
                            <th>Vegano</th>
                        </tr>
                    </thead>
                    <tbody>
                        <xsl:for-each select="menu/dish">
                        <xsl:sort select="price" order="ascending" data-type="number"/>
                        <tr>
                            <td>
                                <xsl:choose>
                                    <xsl:when test="vegan = 'true'">
                                        <strong><xsl:value-of select="name"/></strong>
                                    </xsl:when>
                                    <xsl:otherwise>
                                        <xsl:value-of select="name"/>
                                    </xsl:otherwise>
                                </xsl:choose>
                            </td>
                            <td><xsl:value-of select="@category"/></td>
                            <td><xsl:value-of select="price"/></td>
                            <td>
                                <xsl:choose>
                                    <xsl:when test="vegan = 'true'">
                                    Si
                                    </xsl:when>
                                    <xsl:otherwise>
                                    No
                                    </xsl:otherwise>
                                </xsl:choose>
                            </td>
                        </tr>
                        </xsl:for-each>
                    </tbody>
                    <tfoot>
                        <tr>
                            <td colspan="3">Precio medio de los platos</td>
                            <td><xsl:value-of select="sum(//price) div count(//dish)"/></td>
                        </tr>
                    </tfoot>
                </table>
            </body>
        </html>
    </xsl:template>
</xsl:stylesheet>
