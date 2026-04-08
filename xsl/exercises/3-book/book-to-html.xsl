<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
    <xsl:template match="/">
          <html>
            <head>
                <title>Un libro</title>
            </head>
            <body>
                <h2>
                     <xsl:value-of select="/book/title"/>
                </h2>
                <h3>Autora:
                    <xsl:value-of select="/book/author"/>
                </h3>
                <p>
                     <xsl:value-of select="/book/pages"/><br/>
                     y es del año <xsl:value-of select="/book/year"/>
                </p>
                <p>
                    <xsl:value-of select="/book/description"/>
                </p>
                <p><xsl:for-each select="book/links/link">
                    Link:
                     <xsl:value-of select="."/><br/>
                    </xsl:for-each>
                </p>
            </body>
          </html>
    </xsl:template>
</xsl:stylesheet>