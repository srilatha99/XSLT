<?xml version="1.0" encoding="ISO-8859-1"?>
<xsl:stylesheet version="1.0" 
                xmlns:xsl="http://www.w3.org/1999/XSL/Transform">

<xsl:template match="/">
  <h4>Movie Browser</h4>
  <xsl:apply-templates select="letters"/>
</xsl:template>



<xsl:template name="JournalTemplate">
  
  <xsl:param name="startLetter">  </xsl:param > 
    <a href="#" onclick="displayVolumes('{$startLetter}')">  <xsl:value-of select="$startLetter"/></a> , 
 
</xsl:template>

<xsl:template match="letters">
  <xsl:for-each select="letter">
  <xsl:call-template name="JournalTemplate">
    <xsl:with-param name="startLetter"> 
      <xsl:value-of select='.'/>
    </xsl:with-param> 
  </xsl:call-template>
  </xsl:for-each>
</xsl:template>

</xsl:stylesheet>
