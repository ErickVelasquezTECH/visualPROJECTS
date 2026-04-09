<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
    <xsl:output method="html"/>
    <xsl:template match="/">
        <html>
            <head>
                <title>BIBLIOTECA</title>
                <style>
                    tbody tr:first-child{
                        background-color: green;
                    }
                    tbody tr:last-child .title:first-child {
                        background-color: red;
                        color: white;
                    }
                </style>
            </head>
            <body>
                <table border="1">
                    <thead>
                        <tr>
                            <th>Título</th>
                            <th>ISBN</th>
                            <th>Autor</th>
                            <th>Precio</th>
                            <th>Disponible</th>
                        </tr>
                    </thead>
                    <tbody>
                        <xsl:for-each select="biblioteca/libro">
                        <tr>
                            <td class="title" ><xsl:value-of select="titulo"/></td>
                            <td><xsl:value-of select="@isbn"/></td>
                            <td><xsl:value-of select="concat(autor/nombre,' ', autor/apellido)"/></td>
                            <td><xsl:value-of select="precio"/></td>
                            <td>
                                <xsl:choose>
                                    <xsl:when test="disponible = 'true'">
                                    Sí
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
                            <td colspan="3"><strong>Total precio de libros</strong></td>
                            <td colspan="2"><xsl:value-of select="format-number(sum(//precio),'#.00')"/></td>
                        </tr>
                        <tr>
                            <td colspan="3"><strong>Total precio medio</strong></td>
                            <td colspan="2"><xsl:value-of select="format-number(sum(//precio) div count(//precio),'#.00')"/></td>
                        </tr>
                    </tfoot>
                </table>
            </body>
        </html>
    </xsl:template>
</xsl:stylesheet>
<!-- 
*** biblioteca-to-html ***
Muestra la información en una tabla con las siguientes 5 columnas:
- Título
- ISBN
- Autor (nombre y apellidos)
- Precio
- Disponible (que salga "sí" o "no").
Pon una última fila (tfoot) en la que se vea la suma del precio de todos los libros, y el precio medio.
Pon un estilo a la celda del primer libro para que salga con un gradiente de fondo, y al título del último libro con otra clase y un color de fondo rojo.
-->