<cfimport prefix="view" taglib="/LoginApp/view/login/">
<cfparam name="attributes.id" type="string" default="">

<cflayout type="vbox" align="center">
	<cflayoutarea align="center" style="background-color:##EEEEEF; width: 100%; padding: 10px">
		<view:LoginFormView id="LoginFormView">
	</cflayoutarea>
</cflayout>

