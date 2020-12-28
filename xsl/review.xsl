<!--
  This file is part of the DITA-OT Watermark Plug-in project.
  See the accompanying LICENSE file for applicable licenses.
-->
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
	xmlns:xs="http://www.w3.org/2001/XMLSchema"
	xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance"
	xmlns:dita-ot="http://dita-ot.sourceforge.net/ns/201007/dita-ot"
	exclude-result-prefixes="xs dita-ot"
	version="2.0">

	<xsl:import href="../cfg/fo/attrs/watermark-attr.xsl"/>

	<xsl:import href="plugin:org.dita.base:xsl/common/dita-utilities.xsl"/>
	<xsl:import href="plugin:org.dita.base:xsl/common/output-message.xsl"/>

	<xsl:variable name="msgprefix" select="'DOTX'"/>
	<xsl:param name="DEFAULTLANG">en-us</xsl:param>

	<xsl:template match="/">
		<xsl:text disable-output-escaping="yes">
		&lt;!DOCTYPE svg PUBLIC "-//W3C//DTD SVG 1.1//EN" "http://www.w3.org/Graphics/SVG/1.1/DTD/svg11.dtd"&gt;
		</xsl:text>
		<svg xmlns="http://www.w3.org/2000/svg" xmlns:xlink="http://www.w3.org/1999/xlink" version="1.1" width="120" height="120" viewBox="0 0 120 120" xml:space="preserve">

			<text x="30" y="15" transform="rotate(45 30,15)" xsl:use-attribute-sets="__watermark.review">
				<xsl:call-template name="getVariable">
					<xsl:with-param name="id" select="'Copy for'"/>
				</xsl:call-template>
			</text>
			<text x="5" y="15" transform="rotate(45 5,15)" xsl:use-attribute-sets="__watermark.review">
				<xsl:call-template name="getVariable">
					<xsl:with-param name="id" select="'Review Only'"/>
				</xsl:call-template>
			</text>
		</svg>
	</xsl:template>
</xsl:stylesheet>