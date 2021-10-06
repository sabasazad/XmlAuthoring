<?xml version="1.0" encoding="UTF-8"?>

<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
  <xsl:template match="/cookbook">
    <html>
      <head>
        <title><xsl:value-of select="description"/></title>
        <link href="style.css" rel="stylesheet" type="text/css"/>
      </head>
      <body>
        <table border="1">
          <xsl:apply-templates select="recipe"/>
		</table>
      </body>
    </html>
  </xsl:template>

  <xsl:template match="recipe">
    <tr>
      <td>
        <h1><xsl:value-of select="title"/></h1>
        <h3>Course:<xsl:text> </xsl:text><xsl:value-of select="course"/></h3>
        <h3>Cuisine:<xsl:text> </xsl:text><xsl:value-of select="cuisine/@type"/></h3>
        <ul><xsl:apply-templates select="ingredients"/></ul>
        <xsl:apply-templates select="preparation"/>
        <xsl:apply-templates select="comment"/>
        <xsl:apply-templates select="nutrition"/>
        <xsl:apply-templates select="GRAPHIC"/>
      </td>
    </tr>        
  </xsl:template>

  <xsl:template match="ingredients">
    <xsl:for-each select="ingredient">
    <xsl:choose>
      <xsl:when test="amount">
        <li>
          <xsl:if test="amount!='*'">
            <xsl:value-of select="amount"/>
            <xsl:text> </xsl:text>
            <xsl:if test="unit">
              <xsl:value-of select="unit"/>
              <xsl:if test="number(amount)>number(1)">
                <xsl:text>s</xsl:text>
              </xsl:if>
              <xsl:text> </xsl:text>
            </xsl:if>
          </xsl:if>
          <xsl:text> </xsl:text>
          <xsl:value-of select="name"/>
        </li>
      </xsl:when>
      <xsl:otherwise>
        <li><xsl:value-of select="name"/></li>
      </xsl:otherwise>
    </xsl:choose>
  </xsl:for-each>
  </xsl:template>


  
  <xsl:template match="preparation">
    <ol><xsl:apply-templates select="step"/></ol>
  </xsl:template>

  <xsl:template match="step">
    <li><xsl:value-of select="node()"/></li>
  </xsl:template>

  <xsl:template match="comment">
    <ul>
      <li type="square"><xsl:value-of select="node()"/></li>
    </ul>
  </xsl:template>

  <xsl:template match="nutrition">
    <table border="2">
		  <tr>
        <th>Calories</th><th>Protein</th><th>Carbohydrates</th><th>Fat</th>
		   </tr>
		<tr>
        <td align="right"><xsl:value-of select="calories"/></td>
        <td align="right"><xsl:value-of select="protein"/></td>
        <td align="right"><xsl:value-of select="carbohydrates"/></td>
        <td align="right"><xsl:value-of select="fat"/></td> 
		</tr> 
	</table>
		
  </xsl:template>

<xsl:template match="GRAPHIC">
<xsl:element name="img">
<xsl:attribute name="src">
<xsl:value-of select="@url"/>
</xsl:attribute>
<xsl:attribute name="alt">
Picture: <xsl:value-of select="@url"/>
</xsl:attribute>

</xsl:element>
</xsl:template>

</xsl:stylesheet>
