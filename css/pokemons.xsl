<?xml version="1.0" encoding="UTF-8"?>

<!-- Edited by SLAPaper -->

<xsl:stylesheet version="1.0"
xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
  <xsl:output method="html" encoding="utf-8" />
  <xsl:template match="/">
    <html>
      <head>
        <link rel="stylesheet" type="text/css" href="css/pokemons.css" />
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
        </script>
      </head>
      <body>
        <h1>
          <a name="top">原创精灵</a>
        </h1>
        <h2>目录</h2>
        <button type="button" onclick="dealWithMenu()">显示/隐藏目录</button>
        <div id="menu" style="display:none;">
          <ul style="text-align:left;">
            <xsl:for-each select="pokemons/pokemon">
              <xsl:if test="@visible='yes'">
                <li>
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
              <script><![CDATA[var haveSecondType = 0;var isLegendary = 0;var type1 ="";var type2 = "";]]></script>
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
                  <script>
                    <![CDATA[type1 = chooseType("]]><xsl:value-of select="type/type1" /><![CDATA[");]]>
                  </script>
                  <xsl:choose>
                    <xsl:when test="type/type2=''">
                      <script><![CDATA[haveSecondType = 0;]]></script>
                    </xsl:when>
                    <xsl:otherwise>
                      <script><![CDATA[haveSecondType = 1;]]></script>
                      <script>
                        <![CDATA[type2 = chooseType("]]><xsl:value-of select="type/type2" /><![CDATA[");]]>
                      </script>
                    </xsl:otherwise>
                  </xsl:choose>
                  <!-- output the type1 -->
                  <script>
                    <![CDATA[
                      var x = '<td ';
                      if ( haveSecondType == 0 )
                          x += 'colspan="2" ';
                      else
                          x += 'style="width:8em;" ';
                      x += 'class="white ';
                      x += type1; //<td colspan="2" class="white normal">
                      x += '">';
                      document.write(x);
                    ]]>
                  </script>
                  <xsl:value-of select="type/type1" />
                  <script><![CDATA[document.write('</td>');]]></script>

                  <!-- output the type2 -->
                  <xsl:choose>
                    <xsl:when test="type/type2=''" />
                    <xsl:otherwise>
                      <script>
                        <![CDATA[
                          x = '<td style="width:8em;"class="white ';
                          x += type2;
                          x += '">';
                          document.write(x);
                        ]]>
                      </script>
                      <xsl:value-of select="type/type2" />
                      <script><![CDATA[document.write('</td>');]]></script>
                    </xsl:otherwise>
                  </xsl:choose>
                </tr>
                <tr>
                  <td class="title">特性</td>
                  <xsl:choose>
                    <xsl:when test="abilities/a2=''">
                      <td colspan="2">
                        <xsl:value-of select="abilities/a1" />
                      </td>
                    </xsl:when>
                    <xsl:otherwise>
                      <td>
                        <xsl:value-of select="abilities/a1" />
                      </td>
                      <td>
                        <xsl:value-of select="abilities/a2" />
                      </td>
                    </xsl:otherwise>
                  </xsl:choose>
                </tr>
                <tr>
                  <td class="title">隐藏特性</td>
                  <td colspan="2">
                    <xsl:value-of select="hidden-ability" />
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
                          <xsl:if test="species/@is-legendary='yes'">
                            <script><![CDATA[isLegendary=1;]]></script>
                          </xsl:if>
                          <script>
                            <![CDATA[
                              var x = "<td ";
                              if (isLegendary==1) x += "style='background-color:Gold;'";
                              x += ">"
                              document.write(x);
                              ]]>
                          </script>
                          <xsl:value-of select="species" />
                          <script><![CDATA[document.write("</td>");]]></script>
                          <td>
                            <xsl:value-of select="weight" />
                          </td>
                          <td>
                            <xsl:value-of select="height" />
                          </td>
                          <td>
                            <xsl:value-of disable-output-escaping="yes" select="color" />
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
                            <xsl:choose>
                              <xsl:when test="egg-group/eg2!=''"> 和 </xsl:when>
                            </xsl:choose>
                            <xsl:value-of select="egg-group/eg2" />
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
                      <script>
                        <![CDATA[var HP=]]><xsl:value-of select="stats/HP" /><![CDATA[;document.write("<div style="+'"'+"border:1px solid black;background-color:#ffce18;height:1em;width:"+HP+"px;"+'"'+"></div>");]]>
                      </script>
                    </td>
                  </tr>
                  <tr>
                    <td class="cyan limit">攻击</td>
                    <td>
                      <xsl:value-of select="stats/Attack" />
                    </td>
                    <td>
                      <script>
                        <![CDATA[var Attack=]]><xsl:value-of select="stats/Attack" /><![CDATA[;document.write("<div style="+'"'+"border:1px solid black;background-color:#f73942;height:1em;width:"+Attack+"px;"+'"'+"></div>");]]>
                      </script>
                    </td>
                  </tr>
                  <tr>
                    <td class="cyan limit">防御</td>
                    <td>
                      <xsl:value-of select="stats/Defense" />
                    </td>
                    <td>
                      <script>
                        <![CDATA[var Defense=]]><xsl:value-of select="stats/Defense" /><![CDATA[;document.write("<div style="+'"'+"border:1px solid black;background-color:#5284e7;height:1em;width:"+Defense+"px;"+'"'+"></div>");]]>
                      </script>
                    </td>
                  </tr>
                  <tr>
                    <td class="cyan limit">特攻</td>
                    <td>
                      <xsl:value-of select="stats/SpAtk" />
                    </td>
                    <td>
                      <script>
                        <![CDATA[var SpAtk=]]><xsl:value-of select="stats/SpAtk" /><![CDATA[;document.write("<div style="+'"'+"border:1px solid black;background-color:#5ae7ef;height:1em;width:"+SpAtk+"px;"+'"'+"></div>");]]>
                      </script>
                    </td>
                  </tr>
                  <tr>
                    <td class="cyan limit">特防</td>
                    <td>
                      <xsl:value-of select="stats/SpDef" />
                    </td>
                    <td>
                      <script>
                        <![CDATA[var SpDef=]]><xsl:value-of select="stats/SpDef" /><![CDATA[;document.write("<div style="+'"'+"border:1px solid black;background-color:#d663d6;height:1em;width:"+SpDef+"px;"+'"'+"></div>");]]>
                      </script>
                    </td>
                  </tr>
                  <tr>
                    <td class="cyan limit">速度</td>
                    <td>
                      <xsl:value-of select="stats/Speed" />
                    </td>
                    <td>
                      <script>
                        <![CDATA[var Speed=]]><xsl:value-of select="stats/Speed" /><![CDATA[;document.write("<div style="+'"'+"border:1px solid black;background-color:#52c642;height:1em;width:"+Speed+"px;"+'"'+"></div>");]]>
                      </script>
                    </td>
                  </tr>
                  <tr>
                    <td class="cyan limit">合计</td>
                    <td>
                      <script><![CDATA[var temp=HP+Attack+Defense+SpAtk+SpDef+Speed;document.write(temp);]]></script>
                    </td>
                    <td>
                      <script><![CDATA[;document.write("<div style="+'"'+"float:left;border:1px solid black;background-color:grey;height:1em;width:"+temp/6+"px;"+'"'+"></div>");]]></script>
                      <span style="font-size:80%;">（六项平均）</span>
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
                    <xsl:if test="type-effectiveness/@num!=''">
                      <td></td>
                    </xsl:if>
                  </tr>
                  <xsl:for-each select="type-effectiveness/type">
                    <tr>
                      <td>
                        <script>
                          <![CDATA[var normal = ]]><xsl:value-of select="normal" /><![CDATA[;document.write("<span style="+'"'+dealWithNumber(normal)+'"'+">");]]>
                        </script>
                        <xsl:value-of select="normal" />
                        <script><![CDATA[document.write("</span>");]]></script>
                      </td>
                      <td>
                        <script>
                          <![CDATA[var fire = ]]><xsl:value-of select="fire" /><![CDATA[;document.write("<span style="+'"'+dealWithNumber(fire)+'"'+">");]]>
                        </script>
                        <xsl:value-of select="fire" />
                        <script><![CDATA[document.write("</span>");]]></script>
                      </td>
                      <td>
                        <script>
                          <![CDATA[var water = ]]><xsl:value-of select="water" /><![CDATA[;document.write("<span style="+'"'+dealWithNumber(water)+'"'+">");]]>
                        </script>
                        <xsl:value-of select="water" />
                        <script><![CDATA[document.write("</span>");]]></script>
                      </td>
                      <td>
                        <script>
                          <![CDATA[var grass = ]]><xsl:value-of select="grass" /><![CDATA[;document.write("<span style="+'"'+dealWithNumber(grass)+'"'+">");]]>
                        </script>
                        <xsl:value-of select="grass" />
                        <script><![CDATA[document.write("</span>");]]></script>
                      </td>
                      <td>
                        <script>
                          <![CDATA[var electric = ]]><xsl:value-of select="electric" /><![CDATA[;document.write("<span style="+'"'+dealWithNumber(electric)+'"'+">");]]>
                        </script>
                        <xsl:value-of select="electric" />
                        <script><![CDATA[document.write("</span>");]]></script>
                      </td>
                      <td>
                        <script>
                          <![CDATA[var ice = ]]><xsl:value-of select="ice" /><![CDATA[;document.write("<span style="+'"'+dealWithNumber(ice)+'"'+">");]]>
                        </script>
                        <xsl:value-of select="ice" />
                        <script><![CDATA[document.write("</span>");]]></script>
                      </td>
                      <td>
                        <script>
                          <![CDATA[var fight = ]]><xsl:value-of select="fight" /><![CDATA[;document.write("<span style="+'"'+dealWithNumber(fight)+'"'+">");]]>
                        </script>
                        <xsl:value-of select="fight" />
                        <script><![CDATA[document.write("</span>");]]></script>
                      </td>
                      <td>
                        <script>
                          <![CDATA[var poison = ]]><xsl:value-of select="poison" /><![CDATA[;document.write("<span style="+'"'+dealWithNumber(poison)+'"'+">");]]>
                        </script>
                        <xsl:value-of select="poison" />
                        <script><![CDATA[document.write("</span>");]]></script>
                      </td>
                      <td>
                        <script>
                          <![CDATA[var ground = ]]><xsl:value-of select="ground" /><![CDATA[;document.write("<span style="+'"'+dealWithNumber(ground)+'"'+">");]]>
                        </script>
                        <xsl:value-of select="ground" />
                        <script><![CDATA[document.write("</span>");]]></script>
                      </td>
                      <td>
                        <script>
                          <![CDATA[var fly = ]]><xsl:value-of select="fly" /><![CDATA[;document.write("<span style="+'"'+dealWithNumber(fly)+'"'+">");]]>
                        </script>
                        <xsl:value-of select="fly" />
                        <script><![CDATA[document.write("</span>");]]></script>
                      </td>
                      <td>
                        <script>
                          <![CDATA[var psychic = ]]><xsl:value-of select="psychic" /><![CDATA[;document.write("<span style="+'"'+dealWithNumber(psychic)+'"'+">");]]>
                        </script>
                        <xsl:value-of select="psychic" />
                        <script><![CDATA[document.write("</span>");]]></script>
                      </td>
                      <td>
                        <script>
                          <![CDATA[var bug = ]]><xsl:value-of select="bug" /><![CDATA[;document.write("<span style="+'"'+dealWithNumber(bug)+'"'+">");]]>
                        </script>
                        <xsl:value-of select="bug" />
                        <script><![CDATA[document.write("</span>");]]></script>
                      </td>
                      <td>
                        <script>
                          <![CDATA[var rock = ]]><xsl:value-of select="rock" /><![CDATA[;document.write("<span style="+'"'+dealWithNumber(rock)+'"'+">");]]>
                        </script>
                        <xsl:value-of select="rock" />
                        <script><![CDATA[document.write("</span>");]]></script>
                      </td>
                      <td>
                        <script>
                          <![CDATA[var ghost = ]]><xsl:value-of select="ghost" /><![CDATA[;document.write("<span style="+'"'+dealWithNumber(ghost)+'"'+">");]]>
                        </script>
                        <xsl:value-of select="ghost" />
                        <script><![CDATA[document.write("</span>");]]></script>
                      </td>
                      <td>
                        <script>
                          <![CDATA[var dragon = ]]><xsl:value-of select="dragon" /><![CDATA[;document.write("<span style="+'"'+dealWithNumber(dragon)+'"'+">");]]>
                        </script>
                        <xsl:value-of select="dragon" />
                        <script><![CDATA[document.write("</span>");]]></script>
                      </td>
                      <td>
                        <script>
                          <![CDATA[var dark = ]]><xsl:value-of select="dark" /><![CDATA[;document.write("<span style="+'"'+dealWithNumber(dark)+'"'+">");]]>
                        </script>
                        <xsl:value-of select="dark" />
                        <script><![CDATA[document.write("</span>");]]></script>
                      </td>
                      <td>
                        <script>
                          <![CDATA[var steel = ]]><xsl:value-of select="steel" /><![CDATA[;document.write("<span style="+'"'+dealWithNumber(steel)+'"'+">");]]>
                        </script>
                        <xsl:value-of select="steel" />
                        <script><![CDATA[document.write("</span>");]]></script>
                      </td>
                      <td>
                        <script>
                          <![CDATA[var fairy = ]]><xsl:value-of select="fairy" /><![CDATA[;document.write("<span style="+'"'+dealWithNumber(fairy)+'"'+">");]]>
                        </script>
                        <xsl:value-of select="fairy" />
                        <script><![CDATA[document.write("</span>");]]></script>
                      </td>
                      <xsl:if test="../@num!=''">
                        <td style="word-break:keep-all;">
                          <xsl:value-of select="@ability" />
                          <xsl:if test="@ability!=''">修正值</xsl:if>
                        </td>
                      </xsl:if>
                    </tr>
                  </xsl:for-each>
                </tbody>
              </table>
              <h3>进化</h3>
              <p style="text-align:left;">
                <xsl:value-of select="envolution" />
              </p>
              <xsl:if test="signature-moves!=''">
                <h3>专属技能</h3>
                <table>
                  <tr>
                    <xsl:for-each select="signature-moves/move">
                      <td>
                        <script>
                          <![CDATA[document.write("<a target=\"_blank\" href=\"小精灵之路-设定集-原创技能.xml#]]><xsl:value-of select="@id" /><![CDATA[\">");]]>
                        </script>
                        <xsl:value-of select="." />
                        <script><![CDATA[document.write("</a>");]]></script>
                      </td>
                    </xsl:for-each>
                  </tr>
                </table>
              </xsl:if>
              <xsl:if test="story!=''">
                <h3>相关故事</h3>
                <div style="text-align:left;padding:2em;">
                  <xsl:value-of disable-output-escaping="yes" select="story" />
                </div>
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
                        <script>
                          <![CDATA[var ty = chooseType("]]><xsl:value-of select="ty" /><![CDATA[");document.write("<td class="+'"'+ty+'"'+">");]]>
                        </script>
                        <xsl:value-of select="ty" />
                        <script><![CDATA[document.write("</td>");]]></script>
                        <xsl:choose>
                          <xsl:when test="ca='物'">
                            <td style="background-color:#f05030;color:f8c030" >
                              <xsl:value-of select="ca" />
                            </td>
                          </xsl:when>
                          <xsl:when test="ca='特'">
                            <td style="background-color:#5070a8;color:c0d8f8" >
                              <xsl:value-of select="ca" />
                            </td>
                          </xsl:when>
                          <xsl:when test="ca='变'">
                            <td style="background-color:#a8a090;color:f8f8f8" >
                              <xsl:value-of select="ca" />
                            </td>
                          </xsl:when>
                        </xsl:choose>
                        <td>
                          <xsl:choose>
                            <xsl:when test="p!='-' and (ty=../../type/type1 or ty=../../type/type2)">
                              <span style="font-weight:bold;">
                                <xsl:value-of select="p" />
                              </span>
                            </xsl:when>
                            <xsl:otherwise>
                              <xsl:value-of select="p" />
                            </xsl:otherwise>
                          </xsl:choose>
                        </td>
                        <td>
                          <xsl:value-of select="acc" />
                        </td>
                      </tr>
                    </xsl:for-each>
                  </tbody>
                </table>
              </xsl:if>
              <p style="text-align:right;">
                <a href="#top">回到顶部</a>
              </p>
            </div>
          </xsl:if>
        </xsl:for-each>
      </body>
    </html>
  </xsl:template>
</xsl:stylesheet>
