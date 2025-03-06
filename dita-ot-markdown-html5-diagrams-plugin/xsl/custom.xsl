<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
                xmlns:xs="http://www.w3.org/2001/XMLSchema"
                xmlns:dita-ot="http://dita-ot.sourceforge.net/ns/201007/dita-ot"
                version="3.0"
                exclude-result-prefixes="xs dita-ot">

    <xsl:template match="*[contains(@class, ' topic/pre ')][contains(@outputclass, 'language-mermaid')]" priority="100">
    <pre>
        <xsl:call-template name="commonattributes">
        <xsl:with-param name="default-output-class">
            <!-- <xsl:value-of select="replace(@outputclass, '(^|\s)language-mermaid(\s|$)', '$1another$2')"/> -->
            <xsl:value-of select="replace(@outputclass, 'language-mermaid', 'mermaid')"/>
        </xsl:with-param>
        </xsl:call-template>
        <xsl:call-template name="setidaname"/>
        <!-- Apply templates to text nodes and non-code elements, or get text from code elements -->
        <xsl:apply-templates select="text() | *[not(self::code)]/text() | code/text()"/>
    </pre>
    </xsl:template>

    <xsl:template match="@outputclass" mode="get-value-for-class">
        <xsl:value-of select="replace(., '(^|\s)language-mermaid(\s|$)', '$1')"/>
    </xsl:template>

</xsl:stylesheet>