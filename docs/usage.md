<h1>Usage</h1>

The plugin extends standard PDF processing:

```bash
PATH_TO_DITA_OT/bin/dita -f pdf -o out -i document.ditamap --pdf.watermark=draft|review|final
```

By default the output PDF will be watermarked as a **DRAFT**

### Parameter Reference

-   `pdf.watermark` - Decides which watermark to use:
    -   `draft` - Adds a watermark stating **DRAFT DOCUMENT**
    -   `review` - Adds a watermark stating _Copy for review only_
    -   `final` - Adds an nearly invisible **FINAL** watermark
    -   `none` - Does not add a watermark

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
[Authorized Watermark DITA-OT plug-in](https://github.com/jason-fox/fox.jason.watermark.auth)
