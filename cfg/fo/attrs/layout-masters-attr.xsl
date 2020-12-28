<?xml version="1.0" encoding="utf-8"?>
<!--
	This file is part of the DITA-OT Watermark Plug-in project.
	See the accompanying LICENSE file for applicable licenses.
-->
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
		xmlns:fo="http://www.w3.org/1999/XSL/Format"
		xmlns:rx="http://www.renderx.com/XSL/Extensions"
		version="2.0">

	<xsl:attribute-set name="region-body.odd">
		<xsl:attribute name="margin-top">
			<xsl:value-of select="$page-margin-top"/>
		</xsl:attribute>
		<xsl:attribute name="margin-bottom">
			<xsl:value-of select="$page-margin-bottom"/>
		</xsl:attribute>
		<xsl:attribute name="{if ($writing-mode = 'lr') then 'margin-left' else 'margin-right'}">
			<xsl:value-of select="$page-margin-inside"/>
		</xsl:attribute>
		<xsl:attribute name="{if ($writing-mode = 'lr') then 'margin-right' else 'margin-left'}">
			<xsl:value-of select="$page-margin-outside"/>
		</xsl:attribute>
		<xsl:attribute name="background-image">Configuration/OpenTopic/cfg/common/artwork/watermark.svg</xsl:attribute>
		<xsl:attribute name="background-repeat">repeat</xsl:attribute>
	</xsl:attribute-set>

	<xsl:attribute-set name="region-body.even">
		<xsl:attribute name="margin-top">
			<xsl:value-of select="$page-margin-top"/>
		</xsl:attribute>
		<xsl:attribute name="margin-bottom">
			<xsl:value-of select="$page-margin-bottom"/>
		</xsl:attribute>
		<xsl:attribute name="{if ($writing-mode = 'lr') then 'margin-left' else 'margin-right'}">
			<xsl:value-of select="$page-margin-outside"/>
		</xsl:attribute>
		<xsl:attribute name="{if ($writing-mode = 'lr') then 'margin-right' else 'margin-left'}">
			<xsl:value-of select="$page-margin-inside"/>
		</xsl:attribute>
		<xsl:attribute name="background-image">Configuration/OpenTopic/cfg/common/artwork/watermark.svg</xsl:attribute>
		<xsl:attribute name="background-repeat">repeat</xsl:attribute>
	</xsl:attribute-set>

</xsl:stylesheet>