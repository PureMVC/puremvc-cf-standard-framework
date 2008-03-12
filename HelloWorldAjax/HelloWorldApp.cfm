<cfsetting enablecfoutputonly="No">
<cfscript>
	oViewHelper = CreateObject("component","HelloWorldAjax.view.AppViewHelper").init();
</cfscript>
<cfajaxproxy cfc="HelloWorldAjax.service.EchoService" jsclassname="EchoService">
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Hello World Ajax Example</title>

<script type="text/javascript">
	
	var doHelloWorld = function()
	{
		// create an instance of the proxy.
		var service = new EchoService();
		
		// Setting a callback handler for the proxy automatically makes
		// the proxy’s calls asynchronous
		service.setCallbackHandler(helloWorldCallbackHandler);
		service.setErrorHandler(myErrorHandler);
		
		// The proxy getHelloWorld function represents the CFC
		// getHelloWorld function.
		service.echoHelloWorld();
	}
	
	var helloWorldCallbackHandler = function(res)
	{
		alert('Result: ' + res);
	}
	
	// Error handler for the asynchronous functions.
	var myErrorHandler = function(statusCode, statusMsg)
	{
		alert('Status: ' + statusCode + ', ' + statusMsg);
	}

</script>
</head>
<body>
<div>
	<form method="post">
		<input type="Submit" name="btnSubmit" value="Say Hello">
		<input type="Button" name="btnSubmit" value="Say Hello (Ajax Style)" onclick="doHelloWorld()">
	</form>
</div>
</body>
</html>