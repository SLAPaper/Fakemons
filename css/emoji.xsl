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
                <style>
body
{
font-family:方正兰亭纤黑_GBK,方正兰亭纤黑,"Microsoft YaHei Light","微软雅黑 Light",Sans-serif;
font-size:100%;
text-align:center;
margin-top:2em;
margin-left:3em;
margin-right:3em;
margin-bottom:4em;
text-align:center
}
h2,h3
{
overflow:hidden;
}
h2
{
margin-top:2em;
margin-bottom:0.5em;
}
p
{
margin-top:0.5em;
margin-bottom:0.5em;
}
table
{
border-collapse:collapse;
}
td
{
border: 1px solid black;
}
                </style>
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
