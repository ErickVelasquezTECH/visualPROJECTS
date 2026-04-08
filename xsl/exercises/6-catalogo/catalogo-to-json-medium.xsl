<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
    <xsl:output method="text" encoding="UTF-8"/>
    <xsl:template match="/">
        
        <xsl:text>{
            "tienda":"</xsl:text>
            <xsl:value-of select="catalogo/@tienda"/>
            <xsl:text>",
            "categorias":[&#xa;</xsl:text>
            <xsl:for-each select="catalogo/categoria">
                <xsl:text>{
                    "id": "</xsl:text>
                    <xsl:value-of select="@id"/>
                    <xsl:text>",
                    "nombre": "</xsl:text>
                    <xsl:value-of select="@nombre"/>
                    <xsl:text>",
                    "productos": [&#xa;</xsl:text>
                    <xsl:for-each select="producto">
                    <xsl:if test="stock > 10">
                    <xsl:text>{
                            "id": "</xsl:text>
                            <xsl:value-of select="@id"/>
                            <xsl:text>",
                            "nombre": "</xsl:text>
                            <xsl:value-of select="nombre"/>
                            <xsl:text>",
                            "marca": "</xsl:text>
                            <xsl:value-of select="marca"/>
                            <xsl:text>",
                            "precio":{
                                "moneda": "</xsl:text>
                                <xsl:value-of select="precio/@moneda"/>
                                <xsl:text>",
                                "value": "</xsl:text>
                                <xsl:value-of select="precio"/>
                                <xsl:text>"
                            },
                            "stock": "</xsl:text>
                            <xsl:value-of select="stock"/>
                            <xsl:text>",
                            "especificaciones":{&#xa;</xsl:text>
                                <xsl:for-each select="especificaciones/*">
                                <xsl:text>"</xsl:text>
                                <xsl:value-of select="name()"/>
                                <xsl:text>": "</xsl:text>
                                <xsl:value-of select="."/>
                                <xsl:text>"</xsl:text>
                                <xsl:if test="position() != last()"><xsl:text>,</xsl:text></xsl:if>
                                <xsl:text>&#xa;</xsl:text>
                                </xsl:for-each>
                            <xsl:text>},
                            "etiquetas":[&#xa;</xsl:text>
                            <xsl:for-each select="etiquetas/etiqueta">
                            <xsl:text>"</xsl:text>
                            <xsl:value-of select="."/>
                            <xsl:text>"</xsl:text>
                            <xsl:if test="position() != last()"><xsl:text>,</xsl:text></xsl:if>
                            <xsl:text>&#xa;</xsl:text>
                            </xsl:for-each>
                            <xsl:text>]
                        }</xsl:text>
                        <xsl:if test="position() != last()"><xsl:text>,</xsl:text></xsl:if>
                        <xsl:text>&#xa;</xsl:text>
                    </xsl:if>
                    </xsl:for-each>
                    <xsl:text>]
                }</xsl:text>
                <xsl:if test="position() != last()"><xsl:text>,</xsl:text></xsl:if>
                <xsl:text>&#xa;</xsl:text>
            </xsl:for-each>
            <xsl:text>]
        }</xsl:text>


    
    </xsl:template>
</xsl:stylesheet>   