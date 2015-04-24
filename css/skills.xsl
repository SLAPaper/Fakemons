<?xml version="1.0" encoding="UTF-8"?>

<!-- Edited by SLAPaper -->

<xsl:stylesheet version="1.0"
xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
  <xsl:output method="html" encoding="utf-8" />
  <xsl:template match="/">
    <html>
      <head>
        <meta name="description" content="原创技能列表"></meta>
        <meta name="keywords" content="pokemon"></meta>
        <meta name="author" content="SLAPaper"></meta>
        <meta charset="UTF-8"></meta>
        <title>原创技能</title>
        <style>
          body {
            font-family: Helvetica, Tahoma, Arial, 'Hiragino Sans GB', 'Wenquanyi Micro Hei', 'Microsoft Yahei UI', sans-serif;
            font-size: 100%;
            text-align: center;
            margin: 2em 3em 4em;
          }

          h2, h3 {
            border-bottom: 1px solid black;
            overflow: hidden;
          }

          h2 {
            text-align: left;
            margin-top: 1em;
            margin-bottom: 0.5em;
          }

          h3, h4 {
            text-align: left;
          }

          p {
            margin-top: 0.5em;
            margin-bottom: 0.5em;
          }

          table {
            border-collapse: collapse;
            border: 3px solid darkslategrey;
            empty-cells: show;
            width: 30em;
          }

            table.inside {
              border: 2px dotted;
              border-radius: 0;
              width: 100%;
            }

          td {
            border: 1px solid black;
            ext-align: center;
            padding: 0.3em;
          }

            td.title {
              background-color: darkslategray;
              color: white;
              width: 4em;
            }

            td.cyan {
              background-color: Cyan;
            }

            td.limit {
              width: 30%;
            }

            td.darkslategrey {
              background-color: darkslategrey;
              color: white;
            }

            td.white {
              color: white;
            }

            td.normal {
              background-color: #A8A090;
            }

            td.fire {
              background-color: #F05030;
            }

            td.water {
              background-color: #3898F8;
            }

            td.grass {
              background-color: #78C850;
            }

            td.electric {
              background-color: #F8C030;
            }

            td.ice {
              background-color: #58C8E0;
            }

            td.fight {
              background-color: #A05038;
            }

            td.poison {
              background-color: #B058A0;
            }

            td.ground {
              background-color: #D0B058;
            }

            td.fly {
              background-color: #98A8F0;
            }

            td.psychic {
              background-color: #F870A0;
            }

            td.bug {
              background-color: #A8B820;
            }

            td.rock {
              background-color: #B8A058;
            }

            td.ghost {
              background-color: #6060B0;
            }

            td.dragon {
              background-color: #7860E0;
            }

            td.dark {
              background-color: #705848;
            }

            td.steel {
              background-color: #A8A8C0;
            }

            td.fairy {
              background-color: #F1A7F9;
            }
          
          .hitX4 {
            color: red;
            font-weight:bold;
          }
          .hitX2 {
            color: red;
          }
          .hitX1 {
          }
          .hitXhalf {
            color: blue;
          }
          .hitX0 {
            color: green;
          }
          .hitXminus {
            color: black;
          }
        </style>
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
                    <tbody style="color:lightgrey;">
                      <tr>
                        <td style="color:black;">
                          <xsl:attribute name="class">
                            <xsl:value-of select="type/@class" />
                          </xsl:attribute>
                          <xsl:value-of select="type" />
                        </td>
                        <td>1</td>
                        <td>1</td>
                        <td>1</td>
                        <td>1</td>
                        <td>1</td>
                        <td>1</td>
                        <td>1</td>
                        <td>1</td>
                        <td>1</td>
                        <td>1</td>
                        <td>1</td>
                        <td>1</td>
                        <td>1</td>
                        <td>1</td>
                        <td style="color:red;">2</td>
                        <td>1</td>
                        <td style="color:blue">0.5</td>
                        <td style="color:blue">0</td>
                      </tr>
                      <tr>
                        <td class="title">修正值</td>
                        <td>
                          <xsl:choose>
                            <xsl:when test="eff/normal > 2">
                              <xsl:attribute name="class">hitX4</xsl:attribute>
                            </xsl:when>
                            <xsl:when test="eff/normal > 1">
                              <xsl:attribute name="class">hitX2</xsl:attribute>
                            </xsl:when>
                            <xsl:when test="eff/normal &lt; 1 and eff/normal > 0">
                              <xsl:attribute name="class">hitXhalf</xsl:attribute>
                            </xsl:when>
                            <xsl:when test="eff/normal = 0">
                              <xsl:attribute name="class">hitX0</xsl:attribute>
                            </xsl:when>
                            <xsl:otherwise>
                                <xsl:attribute name="class">hitXminus</xsl:attribute>
                            </xsl:otherwise>
                          </xsl:choose>
                          <xsl:value-of select="eff/normal" />
                        </td>
                        <td>
                          <xsl:value-of select="eff/fire" />
                        </td>
                        <td>
                          <xsl:value-of select="eff/water" />
                        </td>
                        <td>
                          <xsl:value-of select="eff/grass" />
                        </td>
                        <td>
                          <xsl:value-of select="eff/electric" />
                        </td>
                        <td>
                          <xsl:value-of select="eff/ice" />
                        </td>
                        <td>
                          <xsl:value-of select="eff/fight" />
                        </td>
                        <td>
                          <xsl:value-of select="eff/poison" />
                        </td>
                        <td>
                          <xsl:value-of select="eff/ground" />
                        </td>
                        <td>
                          <xsl:value-of select="eff/fly" />
                        </td>
                        <td>
                          <xsl:value-of select="eff/psychic" />
                        </td>
                        <td>
                          <xsl:value-of select="eff/bug" />
                        </td>
                        <td>
                          <xsl:value-of select="eff/rock" />
                        </td>
                        <td>
                          <xsl:value-of select="eff/ghost" />
                        </td>
                        <td>
                          <xsl:value-of select="eff/dragon" />
                        </td>
                        <td>
                          <xsl:value-of select="eff/dark" />
                        </td>
                        <td>
                          <xsl:value-of select="eff/steel" />
                        </td>
                        <td>
                          <xsl:value-of select="eff/fairy" />
                        </td>
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
