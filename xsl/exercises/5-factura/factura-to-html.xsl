<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
<xsl:output method="html"/>
    <xsl:template match="/">
        <html>
            <head>
                <title>Factura de Maria</title>
                <style>
                    table{
                        border-collapse: collapse;
                    }
                    th{
                        background-color:green;
                    }
                    tr:nth-child(even) {
                        background-color: #f2f2f2; 
                    }
                </style>
            </head>
            <body>
                <table border="1">
                    <caption>
                        <xsl:value-of select="concat(factura//cliente,' (',factura//nif,') - ',factura//direccion)"/>
                    </caption>
                    <thead>
                        <tr>
                            <th>producto</th>
                            <th>cantidad</th>
                            <th>precio unitario</th>
                            <th>subtotal por línea</th>
                            <th>iva</th>
                            <th>total final</th>
                        </tr>
                    </thead>
                    <tbody>
                        <xsl:variable name="iva" select="factura/iva"></xsl:variable>
                        <xsl:for-each select="//linea">
                        <xsl:variable name="subtotal" select="cantidad * precio_unitario"/>
                        <tr>
                            <td><xsl:value-of select="producto"/></td>
                            <td><xsl:value-of select="cantidad"/></td>
                            <td><xsl:value-of select="format-number(precio_unitario, '#.00')"/>€</td>
                            <td><xsl:value-of select="format-number($subtotal, '#.00')"/>€</td>
                            <td><xsl:value-of select="format-number($subtotal * ($iva div 100), '#.00')"/>€</td>
                            <td><xsl:value-of select="format-number($subtotal * (1+($iva div 100)), '#.00')"/>€</td>
                        </tr>
                        </xsl:for-each>
                    </tbody>
                </table>
            </body>
        </html>
    </xsl:template>
</xsl:stylesheet>
