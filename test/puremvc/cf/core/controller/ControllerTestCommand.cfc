<!---
 PureMVC ColdFusion Port by Michael Oddis <michael.oddis@puremvc.org>
 PureMVC - Copyright(c) 2006, 2007 Futurescale, Inc., Some rights reserved.
 Your reuse is governed by the Creative Commons Attribution 3.0 License
--->
<cfcomponent displayname="ControllerTestCommand" extends="org.puremvc.cf.patterns.command.SimpleCommand" output="true">
	
	<cffunction name="execute" returntype="void" access="public" output="true">
		<cfargument name="notification" type="org.puremvc.cf.interfaces.INotification" required="true">
		<cfscript>
			var controllerTestVo = arguments.notification.getBody();
			// Fabricate a result
			controllerTestVo.setResult(2 * controllerTestVo.getInput());
		</cfscript>
	</cffunction>
	
</cfcomponent>