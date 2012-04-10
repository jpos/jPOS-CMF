<?xml version='1.0'?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
                xmlns:d="http://docbook.org/ns/docbook"
                xmlns:exsl="http://exslt.org/common"
                xmlns:fo="http://www.w3.org/1999/XSL/Format"
                xmlns:ng="http://docbook.org/docbook-ng"
                xmlns:db="http://docbook.org/ns/docbook"
                exclude-result-prefixes="db ng exsl d"
                version='1.0'>


  <!-- imports the original docbook stylesheet -->
  <xsl:import href="urn:docbkx:stylesheet"/>
  <xsl:import href="urn:docbkx:stylesheet/highlight.xsl"/>

  <xsl:attribute-set name="formal.object.properties">
    <xsl:attribute name="keep-together.within-column">auto</xsl:attribute>
  </xsl:attribute-set> 

  <!-- set bellow all your custom xsl configuration -->

    <!--###################################################
        Custom Title Page
        ################################################### -->
    <xsl:template name="book.titlepage.recto">
        <fo:block>
            <fo:table table-layout="fixed" width="175mm">
                <fo:table-column column-width="175mm"/>
                <fo:table-body>
                    <fo:table-row>
                        <fo:table-cell text-align="center">
                            <fo:block>
                                <fo:external-graphic src="url(images/logo.jpg)"/>
                            </fo:block>
                            <fo:block font-family="Helvetica" font-size="22pt" padding-before="10mm">
                                <xsl:value-of  select="/d:book/d:info/d:title"/>
                            </fo:block>
                            <fo:block font-family="Helvetica" font-size="18pt" padding-before="10mm">
                                <xsl:value-of  select="/d:book/d:info/d:subtitle"/>
                            </fo:block>
                            <fo:block font-family="Helvetica" font-size="12pt" padding="10mm">
                                <xsl:value-of select="/d:book/d:info/d:releaseinfo"/>
                            </fo:block>
                        </fo:table-cell>
                    </fo:table-row>
                </fo:table-body>
            </fo:table>
            <fo:block font-family="Helvetica" font-size="14pt" padding="10mm">
                <xsl:value-of select="/d:book/d:info/d:abstract"/>
            </fo:block>
        </fo:block>
    </xsl:template>

    <!-- Prevent blank pages in output -->
    <xsl:template name="book.titlepage.before.verso">
    </xsl:template>
    <xsl:template name="book.titlepage.verso">
    </xsl:template>
    <xsl:template name="book.titlepage.separator">
    </xsl:template>

    <!-- Monospaced fonts are smaller than regular text -->
    <xsl:attribute-set name="monospace.properties">
        <xsl:attribute name="font-family">
            <xsl:value-of select="$monospace.font.family"/>
        </xsl:attribute>
        <xsl:attribute name="font-size">0.8em</xsl:attribute>
    </xsl:attribute-set>

    <!-- Line Break -->
    <xsl:template match="processing-instruction('br')">
        <fo:block>
            <xsl:text> </xsl:text>
        </fo:block>
    </xsl:template>

    <!--  
         Add page break (see: "docbook", "customization layer")
         www.sagehill.net/docbookxsl/CustomMethods.html#CustomizationLayer
         To enable hard page breaks, add the following template 
	 to your customization layer: (dflc 15/06/2006)
     -->
    <xsl:template match="processing-instruction('hard-pagebreak')">
      <fo:block break-before='page'/>
    </xsl:template>

    <!--###################################################
                          Programlistings
        ################################################### -->

    <!-- Verbatim text formatting (programlistings) -->
    <xsl:attribute-set name="monospace.verbatim.properties" use-attribute-sets="verbatim.properties">
        <xsl:attribute name="space-before.minimum">1em</xsl:attribute>
        <xsl:attribute name="space-before.optimum">1em</xsl:attribute>
        <xsl:attribute name="space-before.maximum">1em</xsl:attribute>
        <xsl:attribute name="space-after.minimum">0.1em</xsl:attribute>
        <xsl:attribute name="space-after.optimum">0.1em</xsl:attribute>
        <xsl:attribute name="space-after.maximum">0.1em</xsl:attribute>
        <xsl:attribute name="border-color">#444444</xsl:attribute>
        <xsl:attribute name="border-style">solid</xsl:attribute>
        <xsl:attribute name="border-width">0.1pt</xsl:attribute>
        <xsl:attribute name="padding-top">0.5em</xsl:attribute>
        <xsl:attribute name="padding-left">0.5em</xsl:attribute>
        <xsl:attribute name="padding-right">0.5em</xsl:attribute>
        <xsl:attribute name="padding-bottom">0.5em</xsl:attribute>
        <xsl:attribute name="margin-left">0.5em</xsl:attribute>
        <xsl:attribute name="margin-right">0.5em</xsl:attribute>
    </xsl:attribute-set>

    <!-- Shade (background) programlistings -->
    <xsl:param name="shade.verbatim">1</xsl:param>
    <xsl:attribute-set name="shade.verbatim.style">
        <xsl:attribute name="background-color">#F0F0F0</xsl:attribute>
    </xsl:attribute-set>

  <!--
    Important links:
    - http://www.sagehill.net/docbookxsl/
    - http://docbkx-tools.sourceforge.net/
  -->

</xsl:stylesheet>

