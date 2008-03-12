<cfparam name="attributes.id" type="string" default="">

<cfscript>
	oViewHelper = CreateObject("component","LoginApp.view.login.LoginFormViewHelper").init();
	oViewHelper.setId(attributes.id);
</cfscript>
	
<cfif Len(oViewHelper.user.getUsername())>
	<cfoutput>
		Username: #oViewHelper.user.getUsername()#<br />
		Password: #oViewHelper.user.getPassword()#
	</cfoutput>
</cfif>

<form method="post" name="frmLogn">
<table>
	<tr>
		<td>Username:</td>
		<td><input name="userName" value=""></td>
	</tr>
	<tr>
		<td>Password:</td>
		<td><input name="userPassword" type="password" value=""></td>
	</tr>
	<tr>
		<td>&nbsp;</td>
		<td align="right"><input type="Submit" name="btnSubmit" value="Submit"><input type="Submit" name="btnSubmitWithQueryReturned" value="Submit (query returned)"></td>
	</tr>
</table>
</form>