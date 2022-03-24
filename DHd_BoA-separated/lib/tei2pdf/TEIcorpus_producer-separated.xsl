<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet
    version="2.0"
    xmlns:xs="http://www.w3.org/2001/XMLSchema"

    xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
    xmlns:tei="http://www.tei-c.org/ns/1.0"
    xmlns="http://www.tei-c.org/ns/1.0"
    xmlns:functx="http://www.functx.com"

    xpath-default-namespace="http://www.tei-c.org/ns/1.0"
    exclude-result-prefixes="#all">

    <xsl:function name="functx:equal-any-of" as="xs:boolean"
    >
        <xsl:param name="arg" as="xs:string?"/>
        <xsl:param name="searchStrings" as="xs:string*"/>
        <xsl:sequence select="
            some $searchString in $searchStrings
            satisfies $arg eq $searchString
            "/>
    </xsl:function>
    <!-- =================================================================================
         XSL to create a TEI Corpus file from the individual XML files in input/xml.

         v.1 Created for Digital Humanities 2013 at the University of Nebraska-Lincoln by Karin Dalziel

         All selections are very literal, which may work or not depending on your TEI.
         Change as necessary

         ================================================================================= -->

    <xsl:output indent="no"/><!-- Wed, 22 Jun 2016 10:02:03 +0200 moocow: indent="yes" breaks manual formatting (e.g. for subscripts) -->

    <!-- This is a wildly inefficient but convienent way to select documents -->

    <!-- =================================================================================
         Main Document Structure
         ================================================================================= -->
    <xsl:variable name="types">
        <type>
            <item>Keynote</item> <!-- 2018, 2019, 2020, 2022 -->
            <item>Workshop</item> <!-- 2016, 2017, 2018, 2019, 2020, 2022 -->
            <item>Panel</item> <!-- 2016, 2017, 2018, 2019, 2020, 2022 -->
            <item>Vortrag</item> <!-- 2016, 2017, 2018, 2019, 2020, 2022 -->
            <item>Poster</item> <!-- 2016, 2017, 2018 -->
            <item>Posterpräsentation</item> <!-- 2019, 2020, 2022 -->
            <item>Sektion</item> <!-- 2016 -->
            <item>Doctoral Consortium</item> <!-- 2020, 2022 -->
            <item>Plenary</item> <!-- 2016, 2017 --> 
        </type>
    </xsl:variable> 
      <xsl:template match="/">

        <teiCorpus xml:id="Book_Corpus">
            <!-- Begin repeating corpus info -->

            <!-- Introductory Materials -->

           <xsl:if test="functx:equal-any-of(normalize-space(.//keywords[@n = 'subcategory']/data(.)),$types/type/item)">
                <xsl:variable name="id"><xsl:value-of select="/TEI/@xml:id"/></xsl:variable>
                <TEI n="{$id}">
                    <xsl:for-each select="/TEI/teiHeader[1]">
                        <xsl:copy>
                            <xsl:apply-templates select="@*|node()"/>
                        </xsl:copy>
                    </xsl:for-each>
                    <xsl:copy-of select="TEI/text"/>
                </TEI>
            </xsl:if> 

            <!-- End repeating corpus info -->

        </teiCorpus> 

    </xsl:template>


    <!-- =================================================================================
         TEI Text template rules
         ================================================================================= -->

    <xsl:template match="p">
        <xsl:element name="p">
            <xsl:apply-templates/>
        </xsl:element>
    </xsl:template>

    <xsl:template match="@*|node()">
        <xsl:copy>
            <xsl:apply-templates select="@*|node()"/>
        </xsl:copy>
    </xsl:template>



    <xsl:template match="author">
        <author>
            <xsl:attribute name="n">
                <xsl:value-of select="replace(persName/surname,'[^a-zA-Z0-9]','')"/> <!-- for 2016 change persName to name -->
                <xsl:value-of select="replace(persName/forename,'[^a-zA-Z0-9]','')"/> <!-- for 2016 change persName to name -->
                <xsl:choose>
                    <xsl:when test="/teiCorpus">
                        <xsl:value-of select="/teiCorpus/@xml:id"/>
                    </xsl:when>
                    <xsl:when test="/TEI">
                        <xsl:value-of select="/TEI/@xml:id"/>
                    </xsl:when>
                </xsl:choose>
            </xsl:attribute>
            <persName>
                <xsl:attribute name="n">
                    <xsl:value-of select="replace(persName/surname,'[^a-zA-Z0-9]','') "/> <!-- for 2016 change persName to name -->
                    <xsl:value-of select="replace(persName/forename,'[^a-zA-Z0-9]','') "/> <!-- for 2016 change persName to name -->
                </xsl:attribute>
                <xsl:copy-of select="persName/node()"/></persName> <!-- for 2016 change persName to name -->
            <xsl:copy-of select="affiliation"/>
            <xsl:copy-of select="email"/>

        </author>
    </xsl:template>

    <xsl:template name="TEIHeader">
        <xsl:param name="title"/>
            <teiHeader>
                <fileDesc>
                    <titleStmt>
                        <title><xsl:value-of select="$title"/></title>
                    </titleStmt>
                    <publicationStmt>
                    </publicationStmt>


                    <sourceDesc>
                        <p>No source: created in electronic format.</p>
                    </sourceDesc>
                </fileDesc>


            </teiHeader>
    </xsl:template>

</xsl:stylesheet>
