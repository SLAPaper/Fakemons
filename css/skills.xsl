<?xml version="1.0" encoding="UTF-8"?>

<!-- Edited by SLAPaper -->

<xsl:stylesheet version="1.0"
xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
  <xsl:template match="/">
    <html>
      <head>
        <link rel="stylesheet" type="text/css" href="css/skills.css" />
        <meta name="description" content="原创技能列表"></meta>
        <meta name="keywords" content="pokemon"></meta>
        <meta name="author" content="SLAPaper"></meta>
        <meta charset="UTF-8"></meta>
        <title>原创技能</title>
        <script>
          function chooseType(x) {
          switch (x) {
          case "普":
          return "normal";
          break;
          case "斗":
          return "fight";
          break;
          case "飞":
          return "fly";
          break;
          case "毒":
          return "poison";
          break;
          case "地":
          return "ground";
          break;
          case "岩":
          return "rock";
          break;
          case "虫":
          return "bug";
          break;
          case "鬼":
          return "ghost";
          break;
          case "钢":
          return "steel";
          break;
          case "火":
          return "fire";
          break;
          case "水":
          return "water";
          break;
          case "草":
          return "grass";
          break;
          case "电":
          return "electric";
          break;
          case "超":
          return "psychic";
          break;
          case "冰":
          return "ice";
          break;
          case "龙":
          return "dragon";
          break;
          case "恶":
          return "dark";
          break;
          case "妖":
          return "fairy";
          break;
          default:
          return "nothing";
          break;
          }
          }
        </script>
      </head>
      <body>
        <div style="width:30em;margin-left:auto;margin-right:auto;" align="center">
          <h1>原创技能</h1>
          <xsl:for-each select="skills/skill">
            <xsl:sort select="@id" data-type="number"/>
            <xsl:if test="@visible='yes'">
              <article>
                <h2>
                  <script>
                    <![CDATA[
                      var s = "<a rel=\"bookmark\" id=\"";
                      s += "]]><xsl:value-of select="@id"/><![CDATA[\"";
                      s += ">";
                      document.write(s);
                    ]]>
                  </script>
                  <span style="font-size:70%;">
                    <xsl:value-of select="@id"/>
                  </span>.&#160;<xsl:value-of select="name/cn"/><span style="font-size:80%;">
                    &#160;<xsl:value-of select="name/en"/>
                  </span>
                  <script>
                    <![CDATA[
                      document.write("</a>");
                    ]]>
                  </script>
                </h2>
                <table>
                  <tr>
                    <td class="title">属性</td>
                    <script>
                      <![CDATA[var type = chooseType("]]><xsl:value-of select="type"/><![CDATA[");document.write("<td class="+'"'+type+" white"+'"'+">");]]>
                    </script>
                    <xsl:value-of select="type"/>
                    <script><![CDATA[document.write("</td>");]]></script>
                    <td class="title">分类</td>
                    <xsl:choose>
                      <xsl:when test="catagory='物理'">
                        <td style="background-color:#f05030;color:f8c030">
                          <xsl:value-of select="catagory"/>
                        </td>
                      </xsl:when>
                      <xsl:when test="catagory='特殊'">
                        <td style="background-color:#5070a8;color:c0d8f8">
                          <xsl:value-of select="catagory"/>
                        </td>
                      </xsl:when>
                      <xsl:when test="catagory='变化'">
                        <td style="background-color:#a8a090;color:f8f8f8">
                          <xsl:value-of select="catagory"/>
                        </td>
                      </xsl:when>
                      <xsl:otherwise>
                        <td>
                          <xsl:value-of select="catagory"/>
                        </td>
                      </xsl:otherwise>
                    </xsl:choose>
                  </tr>
                  <tr>
                    <td class="title">威力</td>
                    <td style="width:30%;">
                      <xsl:value-of select="power"/>
                    </td>
                    <td class="title">命中</td>
                    <td style="width:30%;">
                      <xsl:value-of select="accuracy"/>
                    </td>
                  </tr>
                  <tr>
                    <td class="title">目标</td>
                    <td>
                      <xsl:value-of select="target"/>
                    </td>
                    <td class="title">PP</td>
                    <td>
                      <xsl:value-of select="PP"/>
                    </td>
                  </tr>
                  <tr>
                    <td class="title">效果</td>
                    <td colspan="3" style="text-align:left; padding:0.5em;">
                      <xsl:choose>
                        <xsl:when test="effect/@is-multi-line='yes'">
                          <xsl:for-each select="effect/p">
                            <p>
                              <xsl:value-of select="."/>
                            </p>
                          </xsl:for-each>
                        </xsl:when>
                        <xsl:otherwise>
                          <p>
                            <xsl:value-of select="effect"/>
                          </p>
                        </xsl:otherwise>
                      </xsl:choose>
                    </td>
                  </tr>
                  <tr>
                    <td class="title">说明</td>
                    <td colspan="3" style="text-align:left; padding:0.5em;">
                      <xsl:choose>
                        <xsl:when test="description/@is-multi-line='yes'">
                          <xsl:for-each select="description/p">
                            <p>
                              <xsl:value-of select="."/>
                            </p>
                          </xsl:for-each>
                        </xsl:when>
                        <xsl:otherwise>
                          <p>
                            <xsl:value-of select="description"/>
                          </p>
                        </xsl:otherwise>
                      </xsl:choose>
                    </td>
                  </tr>
                </table>
                <xsl:if test="eff!=''">
                  <xsl:value-of select="eff" disable-output-escaping="yes"/>
                </xsl:if>
              </article>
            </xsl:if>
          </xsl:for-each>
        </div>
      </body>
    </html>
  </xsl:template>
</xsl:stylesheet>
