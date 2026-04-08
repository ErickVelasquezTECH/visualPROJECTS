<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
<xsl:output method="text"/>      
<xsl:template match="/">
    {
        "book": {
            "title": "<xsl:value-of select="book/title"/>",
            "author": "<xsl:value-of select="book/author"/>",
            "year": <xsl:value-of select="book/year"/>
            "pages": <xsl:value-of select="book/pages"/>
            "description": "<xsl:value-of select="book/description"/>",
            "links":{<xsl:for-each select="book/links/link">
                "link": "<xsl:value-of select="."/>"</xsl:for-each>
            }
        }
    }
    </xsl:template>
</xsl:stylesheet>