<?xml version="1.0" encoding="UTF-8"?>

<!-- Edited by SLAPaper -->

<xsl:stylesheet version="1.0"
xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
  <xsl:output method="html" encoding="utf-8" />
  <xsl:template match="/">
    <html>
      <head>
        <link rel="stylesheet" href="css/skills.css"/>
        <meta name="description" content="原创技能列表"></meta>
        <meta name="keywords" content="pokemon"></meta>
        <meta name="author" content="SLAPaper"></meta>
        <meta charset="UTF-8"></meta>
        <title>原创技能</title>
      </head>
      <body>
        <div style="width:30em;margin-left:auto;margin-right:auto;" align="center">
          <h1>原创技能</h1>
          <xsl:for-each select="skills/skill">
            <xsl:sort select="@id" data-type="number"/>
            <xsl:if test="@visible='yes'">
              <article>
                <h2>
                  <a>
                    <xsl:attribute name="rel">bookmark</xsl:attribute>
                    <xsl:attribute name="id">
                      <xsl:value-of select="@id" />
                    </xsl:attribute>
                    <span style="font-size:70%;">
                      <xsl:value-of select="@id"/>
                    </span>.&#160;<xsl:value-of select="name/cn"/><span style="font-size:80%;">
                      &#160;<xsl:value-of select="name/en"/>
                    </span>
                  </a>
                </h2>
                <table>
                  <tr>
                    <td class="title">属性</td>
                    <td>
                      <xsl:attribute name="class">
                        white <xsl:value-of select="type/@class"/>
                      </xsl:attribute>
                      <xsl:value-of select="type"/>
                    </td>
                    <td class="title">分类</td>
                    <td>
                      <xsl:choose>
                        <xsl:when test="catagory='物理'">
                          <xsl:attribute name="class">skillPhy</xsl:attribute>
                        </xsl:when>
                        <xsl:when test="catagory='特殊'">
                          <xsl:attribute name="class">skillSpe</xsl:attribute>
                        </xsl:when>
                        <xsl:when test="catagory='变化'">
                          <xsl:attribute name="class">skillShi</xsl:attribute>
                        </xsl:when>
                      </xsl:choose>
                      <xsl:value-of select="catagory"/>
                    </td>
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
                              <xsl:value-of select="." />
                            </p>
                          </xsl:for-each>
                        </xsl:when>
                        <xsl:otherwise>
                          <p>
                            <xsl:value-of select="description" />
                          </p>
                        </xsl:otherwise>
                      </xsl:choose>
                    </td>
                  </tr>
                </table>
                <xsl:if test="eff">
                  <h3>属性相性表</h3>
                  <table style="text-align:center;">
                    <thead>
                      <tr style="border-bottom:3px solid darkslategrey;">
                        <td class="title" style="word-break:keep-all;">防御方</td>
                        <td class="normal">普</td>
                        <td class="fire">火</td>
                        <td class="water">水</td>
                        <td class="grass">草</td>
                        <td class="electric">电</td>
                        <td class="ice">冰</td>
                        <td class="fight">斗</td>
                        <td class="poison">毒</td>
                        <td class="ground">地</td>
                        <td class="fly">飞</td>
                        <td class="psychic">超</td>
                        <td class="bug">虫</td>
                        <td class="rock">岩</td>
                        <td class="ghost">鬼</td>
                        <td class="dragon">龙</td>
                        <td class="dark">恶</td>
                        <td class="steel">钢</td>
                        <td class="fairy">妖</td>
                      </tr>
                    </thead>
                    <tbody>
                      <tr>
                        <td class="title">相性值</td>
                        <xsl:for-each select="eff/*">
                          <!--这里可能需要一个xsl:sort-->
                          <td>
                            <xsl:choose>
                              <xsl:when test=". > 2">
                                <xsl:attribute name="class">hitX4</xsl:attribute>
                              </xsl:when>
                              <xsl:when test=". > 1">
                                <xsl:attribute name="class">hitX2</xsl:attribute>
                              </xsl:when>
                              <xsl:when test=". = 1">
                                <xsl:attribute name="class">hitX1</xsl:attribute>
                              </xsl:when>
                              <xsl:when test=". &lt; 1 and . > 0">
                                <xsl:attribute name="class">hitXhalf</xsl:attribute>
                              </xsl:when>
                              <xsl:when test=". = 0">
                                <xsl:attribute name="class">hitX0</xsl:attribute>
                              </xsl:when>
                              <xsl:otherwise>
                                <xsl:attribute name="class">hitXminus</xsl:attribute>
                              </xsl:otherwise>
                            </xsl:choose>
                            <xsl:value-of select="." />
                          </td>
                        </xsl:for-each>
                      </tr>
                    </tbody>
                  </table>
                </xsl:if>
              </article>
            </xsl:if>
          </xsl:for-each>
        </div>
      </body>
    </html>
  </xsl:template>
</xsl:stylesheet>
