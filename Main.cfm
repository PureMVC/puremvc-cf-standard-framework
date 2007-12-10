<cfimport prefix="view" taglib="com\modimation\helloworld\view">
<cfscript>
	oViewHelper = CreateObject("component", "cfc.modimation.helloworld.view.AppViewHelper").init();
</cfscript>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Hello World Example</title>
</head>
<body>
<div>
	<view:LoginFormView id="LoginViewHelper">
</div>
</body>
</html>