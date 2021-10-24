<?xml version="1.0" encoding="utf-8"?>
<!--
	This file is part of the DITA-OT Watermark Plug-in project.
	See the accompanying LICENSE file for applicable licenses.
-->
<xsl:stylesheet
  xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
  xmlns:fo="http://www.w3.org/1999/XSL/Format"
  xmlns:rx="http://www.renderx.com/XSL/Extensions"
  version="2.0"
>

	<xsl:attribute-set name="__watermark.font">
		<xsl:attribute name="font-family">sans-serif</xsl:attribute>
		<xsl:attribute name="font-style">normal</xsl:attribute>
		<xsl:attribute name="font-weight">normal</xsl:attribute>
		<xsl:attribute name="fill-opacity">0.3</xsl:attribute>
	</xsl:attribute-set>

	<xsl:attribute-set name="__watermark.draft" use-attribute-sets="__watermark.font">
		<xsl:attribute name="fill">red</xsl:attribute>
		<xsl:attribute name="font-size">14pt</xsl:attribute>
	</xsl:attribute-set>

	<xsl:attribute-set name="__watermark.review" use-attribute-sets="__watermark.font">
		<xsl:attribute name="fill">#FFBF00</xsl:attribute>
		<xsl:attribute name="font-size">14pt</xsl:attribute>
	</xsl:attribute-set>

	<xsl:attribute-set name="__watermark.final" use-attribute-sets="__watermark.font">
		<xsl:attribute name="fill">gray</xsl:attribute>
		<xsl:attribute name="font-size">8pt</xsl:attribute>
	</xsl:attribute-set>

</xsl:stylesheet>
