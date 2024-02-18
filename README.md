# Watermark Plugin for DITA-OT [<img src="https://jason-fox.github.io/fox.jason.watermark/watermark.png" align="right" width="300">](http://watermarkdita-ot.rtfd.io/)


[![license](https://img.shields.io/github/license/jason-fox/fox.jason.watermark.svg)](http://www.apache.org/licenses/LICENSE-2.0)
[![DITA-OT 4.2](https://img.shields.io/badge/DITA--OT-4.2-green.svg)](http://www.dita-ot.org/4.2)
[![Documentation Status](https://readthedocs.org/projects/watermarkdita-ot/badge/?version=latest)](https://watermarkdita-ot.readthedocs.io/en/latest/?badge=latest)

This is a [DITA-OT Plug-in](https://www.dita-ot.org/plugins) to add a watermark to generated PDF files. The plugin
extends standard PDF processing. It offers an extension-point for further processing.

> ![](https://jason-fox.github.io/fox.jason.watermark/watermark-pdf.png)

<details>
<summary><strong>Table of Contents</strong></summary>

-   [Install](#install)
    -   [Installing DITA-OT](#installing-dita-ot)
    -   [Installing the Plug-in](#installing-the-plug-in)
-   [Usage](#usage)
    -   [Parameter Reference](#parameter-reference)
    -   [Extension points](#extension-points)
-   [License](#license)

</details>

## Install

The DITA-OT Watermark plug-in has been tested against [DITA-OT 3.x](http://www.dita-ot.org/download). It is recommended that
you upgrade to the latest version.

### Installing DITA-OT

<a href="https://www.dita-ot.org"><img src="https://www.dita-ot.org/images/dita-ot-logo.svg" align="right" height="55"></a>

The DITA-OT Watermark plug-in is a plug-in for the DITA Open Toolkit.

-   Full installation instructions for downloading DITA-OT can be found
    [here](https://www.dita-ot.org/4.2/topics/installing-client.html).

    1.  Download the `dita-ot-4.2.zip` package from the project website at
        [dita-ot.org/download](https://www.dita-ot.org/download)
    2.  Extract the contents of the package to the directory where you want to install DITA-OT.
    3.  **Optional**: Add the absolute path for the `bin` directory to the _PATH_ system variable.

    This defines the necessary environment variable to run the `dita` command from the command line.

```console
curl -LO https://github.com/dita-ot/dita-ot/releases/download/4.2/dita-ot-4.2.zip
unzip -q dita-ot-4.2.zip
rm dita-ot-4.2.zip
```

### Installing the Plug-in

-   Run the plug-in installation commands:

```console
dita install https://github.com/jason-fox/fox.jason.watermark/archive/master.zip
```

The `dita` command line tool requires no additional configuration.

---

## Usage

The plugin extends standard PDF processing:

```console
PATH_TO_DITA_OT/bin/dita -f pdf -o out -i document.ditamap --pdf.watermark=draft|review|final
```

By default the output PDF will be watermarked as a **DRAFT**

### Parameter Reference

-   `pdf.watermark` - Decides which watermark to use:
    -   `draft` - Adds a watermark stating _Draft Document_
    -   `review` - Adds a watermark stating _Copy for review only_
    -   `final` - Adds an invisible watermark with transparent text
    -   `none` - Does not add a watermark **DEFAULT*
-   `pdf.watermark.width` - Width of the watermark
-   `pdf.watermark.height` - Height of the watermark
-   `pdf.watermark.color` - Color of the watermark
-   `pdf.watermark.fontsize` - Override the font size of the watermark text
-   `pdf.watermark.text1` - Override the first line of watermark text
-   `pdf.watermark.text2` - Override the second line of watermark text

### Extension points

This plug-in is designed to be extended and offers an extension point:

-   `watermark.pre` - Runs an additional Ant target before the watermarking processing stage.

#### Example

The following `plugin.xml` will enable the watermarking of PDF files to depend on an authorization server.

##### `plugin.xml` Configuration

```xml
<plugin id="com.example.watermark.dita">
  <require plugin="fox.jason.watermark"/>
  <feature extension="watermark.pre" value="watermark.auth"/>
  <feature extension="depend.preprocess.pre" value="watermark.check"/>
</plugin>
```

##### ANT build file

```xml
<project name="com.example.passthrough.dita">

  <macrodef name="authorize-user">
    <attribute name="token"/>
    <attribute name="action"/>
    <sequential>
      <!-- do-something to authorize the action -->
      <property if:true="${authorized}" name="pdf.watermark" value="@{value}"/>
    </sequential>
  </macrodef>

  <target name="watermark.check">
    <!-- Ensure watermark isn't preset on the command line -->
    <dita-ot-fail if:set="pdf.watermark"/>
    <condition property="auth.watermark.review">
      <equals arg1="${auth.level}" arg2="review"/>
    </condition>
    <condition property="auth.watermark.final">
        <equals arg1="${auth.level}" arg2="final"/>
    </condition>
    <condition property="auth.watermark.none">
        <equals arg1="${auth.level}" arg2="none"/>
    </condition>
  </target>

  <target name="watermark.auth">
    <!-- Now set watermark if authorized to do so -->
    <authorize-action if:true="${auth.watermark.review}" token="${auth.token}"  action="review" />
    <authorize-action if:true="${auth.watermark.final}" token="${auth.token}"  action="final"/>
    <authorize-action if:true="${auth.watermark.none}" token="${auth.token}"  action="none"/>
  </target>
</project>
```

A working example can be found in the
[DITA-OT Watermark Auth plug-in](https://github.com/jason-fox/fox.jason.watermark.auth) repository.

## License

[Apache 2.0](LICENSE) © 2021 - 2024 Jason Fox
