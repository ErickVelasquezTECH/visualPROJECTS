<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
    <xsl:template match="/">
        <html>
            <head>
                <title>Librería</title>
            </head>
            <body>
                <h2>Libros</h2>
                <p>Estos son los libros del xml:</p>
                <ul>
                    <!-- foreach -->
                    <xsl:for-each select="library/book">
                        <xsl:sort select="title" order="ascending"/>
                        <li>
                            <!-- Las malas, de Camila Sosa. Escrito en 2019-->
                            <xsl:value-of select="title" />, de <xsl:value-of select="author" />.
        Escrito en <xsl:value-of select="year" /><br />
                            Link: <xsl:value-of select="links/link" />
                            <br />
                            <!--TODO:
                            imprimir si hay varios links-->

                            <!-- Si el libro tiene más de 500 páginas, que diga que es largo-->
                            <xsl:if
                                test="pages > 500"> Es largo. </xsl:if>
                            <!-- Si el libro tiene menos de 250 páginas, que diga que es corto-->
                            <xsl:if test="pages &lt; 250">
                                Es corto.
                            </xsl:if>

                            <!-- Si el libro tiene entre 250 y 400 páginas que diga que es de
                            longitud media-->
                            <xsl:if test="pages &gt;= 250 and pages &lt;= 400">
                                Es medio.
                            </xsl:if>
                            <br/>
                            <!-- choose (switch de java)-->
                            <xsl:choose>
                                <xsl:when test="year >= 2025">
                                    ¡Novedad!
                                </xsl:when>
                                <xsl:when test="year > 2020">
                                    De los últimos 5 años.
                                </xsl:when>
                                <xsl:when test="year > 2015">
                                    De los últimos 10 años.
                                </xsl:when>
                                <xsl:otherwise>
                                    De antes de 2015.
                                </xsl:otherwise>
                        </xsl:choose>
                        </li>
                    </xsl:for-each>
                </ul>
            </body>
        </html>
    </xsl:template>
</xsl:stylesheet>