<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
    <xsl:template match="/">
        <html>
            <head>
                <title>Libreria</title>
            </head>
            <body>
                <h2>Libros</h2>
                <p>Estos son los libros del xml:</p>
                <ul>
                    <!-- forech-->
                     <xsl:for-each select="library/book">
                        <xsl:sort select="tittle" order="ascending"/>
                        <li>
                            <xsl:value-of select="title"/>, de
                            <xsl:value-of select="author"/>. Escrito en
                            <xsl:value-of select="year"/><br/>
                            <xsl:for-each select="links/link">
                             <xsl:sort select="tittle" order="ascending"/>
                            </xsl:for-each>
                             <xsl:if test="pages &gt; 500">
                                Es largo
                            </xsl:if>
                            <xsl:if test="pages &lt; 250">
                                    Es corto
                            </xsl:if>
                            <xsl:if test="pages &gt;= 250 and pages &lt;= 400">
                                Es medio
                            </xsl:if>
                            <xsl:choose>
                                <xsl:when test="year >= 2025">
                                !Novedad
                                </xsl:when>
                                <xsl:when test="year > 2020">
                                De los ultimos 5 años.
                                </xsl:when>
                                <xsl:when test="year > 2015">
                                De los ultimos 10 años.
                                </xsl:when>
                                <xsl:otherwise>
                                    De antes de 2015
                                </xsl:otherwise>
                            </xsl:choose>
                        </li>
                     </xsl:for-each>      
                </ul>
            </body>
        </html>
    </xsl:template>
</xsl:stylesheet>