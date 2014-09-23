<?xml version="1.0" encoding="UTF-8"?>

<!-- Edited by SLAPaper -->

<xsl:stylesheet version="1.0"
xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
    <xsl:template match="/">
        <html>
            <head>
                <link rel="stylesheet" type="text/css" href="css\emoji.css"/>
                <meta name="description" content="颜文字"></meta>
                <meta name="keywords" content="emoji"></meta>
                <meta name="author" content="SLAPaper"></meta>
                <meta charset="UTF-8"></meta>
                <title>颜文字</title>
                <style></style>
            </head>
            <body>
                <h1>颜文字</h1>
                <xsl:for-each select="emoji/category">
                    <h2><xsl:value-of select="@name"/></h2>
                    <table align="center">
                        <tr>
                            <td class="title">颜文字</td>
                            <td class="title">说明</td>
                        </tr>
                        <xsl:for-each select="entry">
                            <tr>
                                <td><xsl:value-of select="string"/></td>
                                <td><xsl:value-of select="note"/></td>
                            </tr>
                        </xsl:for-each>
                    </table>
                </xsl:for-each>
            </body>
        </html>
    </xsl:template>
</xsl:stylesheet>
