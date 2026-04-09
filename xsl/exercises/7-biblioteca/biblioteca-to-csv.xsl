<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
    <xsl:output method="text"/>
    <xsl:template match="/">
        <xsl:text>ISBN,Título,Autor,Editorial,Año,Precio,Géneros,Disponible&#xa;</xsl:text>
        <xsl:for-each select="biblioteca/libro">
        <xsl:sort select="precio" order="descending"/>
        <xsl:if test="disponible = 'true'">
        <xsl:value-of select="@isbn"/>
        <xsl:text>,</xsl:text>
        <xsl:value-of select="titulo"/>
        <xsl:text>,</xsl:text>
        <xsl:value-of select="concat(autor/nombre, ' ', autor/apellido)"/>
        <xsl:text>,</xsl:text>
        <xsl:value-of select="editorial"/>
        <xsl:text>,</xsl:text>
        <xsl:value-of select="substring(fecha_publicacion, 1, 4)"/>
        <xsl:text>,</xsl:text>
        <xsl:value-of select="precio"/>
        <xsl:text>,"</xsl:text>
        <xsl:for-each select="generos/genero">
            <xsl:value-of select="."/>
            <xsl:if test="position() != last()"><xsl:text>;</xsl:text></xsl:if>
        </xsl:for-each>
        <xsl:text>",</xsl:text>
        <xsl:value-of select="disponible"/>
        <xsl:text>&#xa;</xsl:text>
        </xsl:if>
        </xsl:for-each>
    </xsl:template>
</xsl:stylesheet>


<!-- 
*** biblioteca-to-csv ***
Genera un archivo CSV con cabeceras: ISBN,Título,Autor,Editorial,Año,Precio,Géneros,Disponible
El autor debe ser "Nombre Apellido" concatenado
El año debe extraerse de la fecha (solo el año)
Los géneros deben aparecer separados por punto y coma (;)
Filtra solo los libros disponibles (disponible = true)
Ordena los libros por precio descendente
-->