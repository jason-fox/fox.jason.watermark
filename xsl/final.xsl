<!--
  This file is part of the DITA-OT Watermark Plug-in project.
  See the accompanying LICENSE file for applicable licenses.
-->
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
	xmlns:xs="http://www.w3.org/2001/XMLSchema"
	xmlns:fo="http://www.w3.org/1999/XSL/Format"
	xmlns:dita-ot="http://dita-ot.sourceforge.net/ns/201007/dita-ot" 
	exclude-result-prefixes="xs"
	version="2.0">

	<xsl:import href="../cfg/fo/attrs/watermark-attr.xsl"/>
	<xsl:import href="plugin:org.dita.base:xsl/common/dita-utilities.xsl"/>
	<xsl:import href="plugin:org.dita.base:xsl/common/output-message.xsl"/>

	<xsl:template match="/">
		<xsl:text disable-output-escaping="yes">
		&lt;!DOCTYPE svg PUBLIC "-//W3C//DTD SVG 1.1//EN" "http://www.w3.org/Graphics/SVG/1.1/DTD/svg11.dtd"&gt;
		</xsl:text>
		<svg xmlns="http://www.w3.org/2000/svg" xmlns:xlink="http://www.w3.org/1999/xlink" version="1.1" width="500" height="710" viewBox="0 0 500 710" xml:space="preserve">
			<text x="250" y="678.5" text-anchor="middle" xsl:use-attribute-sets="__watermark.final">
				<xsl:call-template name="getVariable">
					<xsl:with-param name="id" select="'Final'"/>
				</xsl:call-template>
			</text>
		</svg>
	</xsl:template>
</xsl:stylesheet>