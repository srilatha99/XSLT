<?xml version="1.0" encoding="ISO-8859-1"?>
<xsl:stylesheet version="1.0"
  xmlns:xsl="http://www.w3.org/1999/XSL/Transform">

<xsl:template name="ElectronicEditionTemplate">
  <xsl:param name="mytitle">url</xsl:param>
  <a href="{$mytitle}" target="_blank">
  <xsl:value-of select="ElectronicEdition"/></a>
</xsl:template>

  <xsl:template match="/">
    <table border="1">
      <tr>
        <td>
    Title:
        </td>
        <td>
          <xsl:value-of select="mdb/movies/movie[title=$mytitle]/title"/>
        </td>
      </tr>
      <tr>
        <td>
       Year:
        </td>
        <td>
          <xsl:value-of select="mdb/movies/movie[title=$mytitle]/year"/>

        </td>
      </tr>
      <tr>
        <td>
      Director(s):
        </td>
        <td>
          <xsl:variable name="performer_id">
            <xsl:value-of select="mdb/movies/movie[title=$mytitle]/directors/director/@idref"/>
          </xsl:variable>
          <xsl:value-of select="mdb/performers/performer[@id=$performer_id]/name"/>
        </td>
      </tr>
      <tr>
        <td>
      Genre(s):
        </td>
        <td>
          <xsl:value-of select="mdb/movies/movie[title=$mytitle]/genres/genre"/>

        </td>
      </tr>
      <tr>
        <td>
      Plot:
        </td>
        <td>
          <xsl:value-of select="mdb/movies/movie[title=$mytitle]/plot"/>
        </td>
      </tr>

      <tr>
        <td>
      Cast:
        </td>
        <td>
          <xsl:for-each select="mdb/movies/movie[title=$mytitle]/cast/performer">
            <div>
       Actor: 
              <xsl:variable name="actor_id">
             <xsl:value-of select="actor/@idref"/>
           </xsl:variable>
         
            <xsl:value-of select="//mdb/performers/performer[@id=$actor_id]/name"/><br/>
       
       Role:<xsl:value-of select="role"/>
            </div>
          </xsl:for-each>
        </td>
      </tr>
    </table>
    <xsl:call-template name="ElectronicEditionTemplate">
        <xsl:with-param name="ee"> 
          <xsl:value-of select="ElectronicEdition"/>
        </xsl:with-param> 
      </xsl:call-template>
  </xsl:template>


</xsl:stylesheet>
