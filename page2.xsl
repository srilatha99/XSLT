<?xml version="1.0" encoding="ISO-8859-1"?>
<xsl:stylesheet version="1.0"
  xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
 
<xsl:param name="firstLetter"></xsl:param>
  <xsl:template match="/">
<xsl:for-each select="mdb/movies/movie">
<xsl:sort select="year" order="descending"/>
      <xsl:call-template name="VolumeTemplate">
        <xsl:with-param name="mytitle">
        <xsl:if test='starts-with(translate(normalize-space(title), "ABCDEFGHIJKLMNOPQRSTUVWXYZ", "abcdefghijklmnopqrstuvwxyz"), translate(normalize-space($firstLetter), "ABCDEFGHIJKLMNOPQRSTUVWXYZ", "abcdefghijklmnopqrstuvwxyz"))'>
            <xsl:value-of select="title"/>
          </xsl:if>
        </xsl:with-param>
      </xsl:call-template>
    </xsl:for-each>
  </xsl:template>


<xsl:template name="VolumeTemplate">
 <xsl:param name="mytitle"></xsl:param>
 <xsl:if test='starts-with(translate(normalize-space(title), "ABCDEFGHIJKLMNOPQRSTUVWXYZ", "abcdefghijklmnopqrstuvwxyz"), translate(normalize-space($firstLetter), "ABCDEFGHIJKLMNOPQRSTUVWXYZ", "abcdefghijklmnopqrstuvwxyz"))'>
 <div>
 <a href="#" onclick="displayArticles('{$mytitle}')"> 
  
  <xsl:value-of select="concat(' ',$mytitle, '(', year ,')' )"/>
 </a></div>
</xsl:if>
</xsl:template>

</xsl:stylesheet>
