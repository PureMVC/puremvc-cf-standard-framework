<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<cfimport prefix="view" taglib="/LoginApp/view/login/">
<cfscript>
	oViewHelper = CreateObject("component","LoginApp.view.AppViewHelper").init();
</cfscript>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Login App</title>
</head>
<body>
	<view:LoginView id="LoginView">
</body>
</html>