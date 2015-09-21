<?xml version="1.0" encoding="UTF-8"?>

<!-- Edited by SLAPaper -->

<xsl:stylesheet version="1.0"
xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
  <xsl:output method="html" encoding="utf-8" indent="yes" doctype-system="about:legacy-compat" omit-xml-declaration="yes" />
  <xsl:template match="/">
    <html>
      <head>
        <link rel="stylesheet" href="css/index.css" />
        <link rel="stylesheet" href="css/fakemons.css" />
        <link rel="stylesheet" href="css/pokemons.css" />
        <meta name="description" content="原创精灵列表"></meta>
        <meta name="keywords" content="pokemon"></meta>
        <meta name="author" content="SLAPaper"></meta>
        <meta charset="UTF-8"></meta>
        <title>原创精灵</title>
        <script>
          function dealWithMenu() {
          if ( document.getElementById("menu").style.display != "none" ) {
          document.getElementById("menu").style.display = "none";
          } else {
          document.getElementById("menu").style.display = "inline";
          }
          }
        </script>
      </head>
      <body>
        <div style="padding: 0.5em; margin: 0.5em; border-radius: 0.5em; border:1px solid black; position: fixed; top: 1em; right: 1em; background-color: white; box-shadow: 0 0 5px gray;">
          <a href="#top">回到顶部</a>
        </div>
        <h1>
          <a name="top">原创精灵</a>
        </h1>
        <button type="button" onclick="dealWithMenu()">显示/隐藏目录</button>
        <div id="menu" style="display:none;">
          <h2>目录</h2>
          <ul style="text-align:center; list-style-type: none; column-rule: 1px solid black; column-width: 10em;">
            <xsl:for-each select="pokemons/pokemon">
              <xsl:if test="@visible='yes'">
                <li style="margin: 0.5em 0;">
                  <a href="#{generate-id(.)}">
                    <xsl:value-of select="name/cn" />
                  </a>
                </li>
              </xsl:if>
            </xsl:for-each>
          </ul>
        </div>

        <xsl:for-each select="pokemons/pokemon">
          <xsl:sort select="@id" data-type="number" />
          <xsl:if test="@visible='yes'">
            <div style="margin-bottom:5em;">
              <h2>
                <a id="{generate-id(.)}">
                  <xsl:value-of select="name/cn" />
                </a>
              </h2>
              <table style="float:right;border-radius:2em;border-collapse:separate;clear:both;margin:auto auto 0.3em 0.3em;">
                <thead>
                  <tr>
                    <td colspan="3" style="font-size:150%;font-weight:bold;border:0;">
                      <div>
                        <span style="font-size:70%;">
                          <xsl:value-of select="@id" />
                        </span>.&#160;<xsl:value-of select="name/cn" />
                      </div>
                      <div style="font-size:70%;">
                        <xsl:value-of select="name/en" />
                      </div>
                    </td>
                  </tr>
                </thead>
                <tr>
                  <td class="title">属性</td>

                  <td>
                    <!-- output the type1 -->
                    <xsl:choose>
                      <xsl:when test="not(type/type2)">
                        <xsl:attribute name="colspan">2</xsl:attribute>
                      </xsl:when>
                      <xsl:otherwise>
                        <xsl:attribute name="style">width:8em;</xsl:attribute>
                      </xsl:otherwise>
                    </xsl:choose>
                    <xsl:attribute name="class">
                      white <xsl:value-of select="type/type1/@class"/>
                    </xsl:attribute>
                    <xsl:value-of select="type/type1" />
                  </td>

                  <xsl:if test="type/type2">
                    <!-- output the type2 -->
                    <td style="width: 8em;">
                      <xsl:attribute name="class">
                        white <xsl:value-of select="type/type2/@class"/>
                      </xsl:attribute>
                      <xsl:value-of select="type/type2" />
                    </td>
                  </xsl:if>
                </tr>
                <tr>
                  <td class="title">特性</td>
                  <td>
                    <xsl:if test="not(abilities/a2)">
                      <xsl:attribute name="colspan">2</xsl:attribute>
                    </xsl:if>
                    <xsl:value-of select="abilities/a1" />
                  </td>
                  <xsl:if test="abilities/a2">
                    <td>
                      <xsl:value-of select="abilities/a2" />
                    </td>
                  </xsl:if>
                </tr>
                <tr>
                  <td class="title">隐藏特性</td>
                  <td colspan="2">
                    <xsl:choose>
                      <xsl:when test="hidden-ability">
                        <xsl:value-of select="hidden-ability" />
                      </xsl:when>
                      <xsl:otherwise>-</xsl:otherwise>
                    </xsl:choose>
                  </td>
                </tr>
                <tr>
                  <td colspan="3" style="border:0;">
                    <table class="inside">
                      <thead>
                        <tr>
                          <td class="darkslategrey" colspan="4">图鉴信息</td>
                        </tr>
                      </thead>
                      <tbody>
                        <tr>
                          <td class="cyan" style="width:25%;">种类</td>
                          <td class="cyan" style="width:25%;">体重</td>
                          <td class="cyan" style="width:25%;">身高</td>
                          <td class="cyan" style="width:25%;">颜色</td>
                        </tr>
                        <tr>
                          <td>
                            <xsl:if test="species/@is-legendary='yes'">
                              <xsl:attribute name="style">background-color:gold;</xsl:attribute>
                            </xsl:if>
                            <xsl:value-of select="species" />
                          </td>
                          <td>
                            <xsl:value-of select="weight" />
                          </td>
                          <td>
                            <xsl:value-of select="height" />
                          </td>
                          <td>
                            <xsl:for-each select="colors/color">
                              <div class="color">
                                <xsl:attribute name="style">
                                  background-color:<xsl:value-of select="." />; width:<xsl:value-of select="2 div count(../color)" />em;
                                </xsl:attribute>
                              </div>
                            </xsl:for-each>
                            <xsl:value-of select ="colors/text" />
                          </td>
                        </tr>
                      </tbody>
                    </table>
                  </td>
                </tr>
                <tr>
                  <td colspan="3" style="border:0;">
                    <table class="inside">
                      <thead>
                        <tr>
                          <td class="darkslategrey" colspan="2">培育信息</td>
                        </tr>
                      </thead>
                      <tbody>
                        <tr>
                          <td class="cyan limit">生蛋分组</td>
                          <td>
                            <xsl:value-of select="egg-group/eg1" />
                            <xsl:if test="egg-group/eg2">
                              &#160;和&#160;<xsl:value-of select="egg-group/eg2" />
                            </xsl:if>
                          </td>
                        </tr>
                        <tr>
                          <td class="cyan limit">孵化步数</td>
                          <td>
                            <xsl:value-of select="hatch-time" />
                          </td>
                        </tr>
                        <tr>
                          <td class="cyan limit">性别比率</td>
                          <td>
                            <xsl:value-of select="gender-ratio" />
                          </td>
                        </tr>
                        <tr>
                          <td class="cyan limit">捕获度</td>
                          <td>
                            <xsl:value-of select="catch-rate" />
                          </td>
                        </tr>
                        <tr>
                          <td class="cyan limit">初始亲密度</td>
                          <td>
                            <xsl:value-of select="base-friendship" />
                          </td>
                        </tr>
                        <tr>
                          <td class="cyan limit">满级经验</td>
                          <td>
                            <xsl:value-of select="max-exp" />
                          </td>
                        </tr>
                      </tbody>
                    </table>
                  </td>
                </tr>
                <tr>
                  <td class="title" colspan="3">说明</td>
                </tr>
                <tr>
                  <td colspan="3" style="text-align:left;border:0;padding-left:1em;">
                    <xsl:choose>
                      <xsl:when test="description/@is-multi-line='yes'">
                        <xsl:for-each select="description/p">
                          <xsl:value-of select="." />
                          <br/>
                        </xsl:for-each>
                      </xsl:when>
                      <xsl:otherwise>
                        <xsl:value-of select="description" />
                      </xsl:otherwise>
                    </xsl:choose>
                  </td>
                </tr>
              </table>
              <p style="text-align:left;">
                <!--图鉴说明-->
                <xsl:value-of select="pokedex" />
              </p>
              <h3>种族值</h3>
              <table>
                <tbody>
                  <tr>
                    <td class="cyan limit">HP</td>
                    <td>
                      <xsl:value-of select="stats/HP" />
                    </td>
                    <td>
                      <div>
                        <xsl:attribute name="style">
                          border:1px solid black;background-color:#ffce18;height:1em;width:<xsl:value-of select="stats/HP" />px;
                        </xsl:attribute>
                      </div>
                    </td>
                  </tr>
                  <tr>
                    <td class="cyan limit">攻击</td>
                    <td>
                      <xsl:value-of select="stats/Attack" />
                    </td>
                    <td>
                      <div>
                        <xsl:attribute name="style">
                          border:1px solid black;background-color:#f73942;height:1em;width:<xsl:value-of select="stats/Attack" />px;
                        </xsl:attribute>
                      </div>
                    </td>
                  </tr>
                  <tr>
                    <td class="cyan limit">防御</td>
                    <td>
                      <xsl:value-of select="stats/Defense" />
                    </td>
                    <td>
                      <div>
                        <xsl:attribute name="style">
                          border:1px solid black;background-color:#5284e7;height:1em;width:<xsl:value-of select="stats/Defense" />px;
                        </xsl:attribute>
                      </div>
                    </td>
                  </tr>
                  <tr>
                    <td class="cyan limit">特攻</td>
                    <td>
                      <xsl:value-of select="stats/SpAtk" />
                    </td>
                    <td>
                      <div>
                        <xsl:attribute name="style">
                          border:1px solid black;background-color:#5ae7ef;height:1em;width:<xsl:value-of select="stats/SpAtk" />px;
                        </xsl:attribute>
                      </div>
                    </td>
                  </tr>
                  <tr>
                    <td class="cyan limit">特防</td>
                    <td>
                      <xsl:value-of select="stats/SpDef" />
                    </td>
                    <td>
                      <div>
                        <xsl:attribute name="style">
                          border:1px solid black;background-color:#d663d6;height:1em;width:<xsl:value-of select="stats/SpDef" />px;
                        </xsl:attribute>
                      </div>
                    </td>
                  </tr>
                  <tr>
                    <td class="cyan limit">速度</td>
                    <td>
                      <xsl:value-of select="stats/Speed" />
                    </td>
                    <td>
                      <div>
                        <xsl:attribute name="style">
                          border:1px solid black;background-color:#52c642;height:1em;width:<xsl:value-of select="stats/Speed" />px;
                        </xsl:attribute>
                      </div>
                    </td>
                  </tr>
                  <tr>
                    <td class="cyan limit">合计</td>
                    <td>
                      <xsl:value-of select="sum(stats/*)" />
                    </td>
                    <td>
                      <div>
                        <xsl:attribute name="style">
                          border:1px solid black;background-color:grey;height:1em;width:<xsl:value-of select="sum(stats/*) div 6" />px;
                        </xsl:attribute>
                      </div>
                    </td>
                  </tr>
                </tbody>
              </table>
              <h3>抵抗力</h3>
              <table style="text-align:center;">
                <tbody>
                  <tr style="border-bottom:3px solid darkslategrey;">
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
                    <xsl:if test="count(type-effectiveness/type) > 1">
                      <td></td>
                    </xsl:if>
                  </tr>
                  <xsl:for-each select="type-effectiveness/type">
                    <!--处理每一个特性的抗性列表-->
                    <tr>
                      <xsl:for-each select="./*">
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
                            <xsl:when test=". > 0.25">
                              <xsl:attribute name="class">hitXhalf</xsl:attribute>
                            </xsl:when>
                            <xsl:when test=". > 0">
                              <xsl:attribute name="class">hitXquater</xsl:attribute>
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
                      <xsl:if test="count(../type) > 1">
                        <td style="word-break:keep-all;">
                          <xsl:if test="@ability">
                            <xsl:value-of select="@ability" />
                          </xsl:if>
                        </td>
                      </xsl:if>
                    </tr>
                  </xsl:for-each>
                </tbody>
              </table>
              <h3>进化</h3>
              <p>
                <xsl:apply-templates select="evolution"/>
              </p>
              <xsl:if test="signature-moves!=''">
                <h3>专属技能</h3>
                <table>
                  <tr>
                    <xsl:for-each select="signature-moves/move">
                      <td>
                        <xsl:attribute name="style">
                          width: <xsl:value-of select="ceiling(100 div count(../move))" />%;
                        </xsl:attribute>
                        <a target="_blank">
                          <xsl:attribute name="href">
                            小精灵之路-设定集-原创技能.xml#<xsl:value-of select="@id" />
                          </xsl:attribute>
                          <xsl:value-of select="." />
                        </a>
                      </td>
                    </xsl:for-each>
                  </tr>
                </table>
              </xsl:if>
              <xsl:if test="story!=''">
                <h3>相关故事</h3>
                <xsl:copy-of select="story"></xsl:copy-of>
              </xsl:if>
              <xsl:if test="skills!=''">
                <h3>技能表</h3>
                <table>
                  <thead>
                    <tr class="title">
                      <td>等级</td>
                      <td>名称</td>
                      <td>属性</td>
                      <td>类型</td>
                      <td>威力</td>
                      <td>命中</td>
                    </tr>
                  </thead>
                  <tbody>
                    <xsl:for-each select="skills/skill">
                      <tr>
                        <td>
                          <xsl:value-of select="lv" />
                        </td>
                        <td>
                          <xsl:value-of select="n" />
                        </td>
                        <td>
                          <xsl:attribute name="class">
                            white <xsl:value-of select="ty/@class"/>
                          </xsl:attribute>
                          <xsl:value-of select="ty" />
                        </td>
                        <xsl:choose>
                          <xsl:when test="ca='物'">
                            <td class="skillPhy">
                              <xsl:value-of select="ca" />
                            </td>
                          </xsl:when>
                          <xsl:when test="ca='特'">
                            <td class="skillSpe">
                              <xsl:value-of select="ca" />
                            </td>
                          </xsl:when>
                          <xsl:when test="ca='变'">
                            <td class="skillShi">
                              <xsl:value-of select="ca" />
                            </td>
                          </xsl:when>
                        </xsl:choose>
                        <td>
                          <xsl:if test="p!='-' and (ty=../../type/type1 or ty=../../type/type2)">
                            <xsl:attribute name="style">font-weight:bold;</xsl:attribute>
                          </xsl:if>
                          <xsl:value-of select="p" />
                        </td>
                        <td>
                          <xsl:value-of select="acc" />
                        </td>
                      </tr>
                    </xsl:for-each>
                  </tbody>
                </table>
              </xsl:if>
            </div>
          </xsl:if>
        </xsl:for-each>
      </body>
    </html>
  </xsl:template>

  <xsl:template match="text()">
    <xsl:copy></xsl:copy>
  </xsl:template>

  <xsl:template match="link">
    <xsl:variable name="id" select="@id" />
    <a>
      <xsl:attribute name="href">
        #<xsl:value-of select="generate-id(/pokemons/pokemon[@id = $id])" />
      </xsl:attribute>
      <xsl:value-of select="."/>
    </a>
  </xsl:template>

</xsl:stylesheet>
