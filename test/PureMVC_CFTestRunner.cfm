<cfsilent>
	<cfsetting showdebugoutput="No">
	<cfset testClasses = ArrayNew(1)>
	<cfset ArrayAppend(testClasses, "test.puremvc.cf.core.model.ModelTest")>
	<cfset ArrayAppend(testClasses, "test.puremvc.cf.core.view.ViewTest")>
	<cfset ArrayAppend(testClasses, "test.puremvc.cf.core.controller.ControllerTest")>
	<cfset ArrayAppend(testClasses, "test.puremvc.cf.patterns.proxy.ProxyTest")>
	<!--- Add as many test classes as you would like to the array --->
	<cfset testSuite = CreateObject("component", "net.sourceforge.cfunit.framework.TestSuite").init( testClasses )>
</cfsilent>

<cfoutput>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">

<html>
<head>
	<title>PureMVC_CF Unit Tests</title>
</head>

<body
<h1>PureMVC_CF Unit Tests</h1>

<cfinvoke component="net.sourceforge.cfunit.framework.TestRunner" method="run">
	<cfinvokeargument name="test" value="#testSuite#">
	<cfinvokeargument name="name" value="PureMVC_CF Init Tests">
</cfinvoke>

</body>
</html>
</cfoutput>
