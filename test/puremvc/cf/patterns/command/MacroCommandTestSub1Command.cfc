<!---
 PureMVC ColdFusion Port by Michael Oddis <michael.oddis@puremvc.org>
 PureMVC - Copyright(c) 2006, 2007 Futurescale, Inc., Some rights reserved.
 Your reuse is governed by the Creative Commons Attribution 3.0 License
--->
<cfcomponent extends="org.puremvc.cf.patterns.command.SimpleCommand"
			 output="false" 
			 hint="Tests the execute method of a SimpleCommand.">
	
	<cffunction name="execute" returntype="void" access="public" output="false" hint="Fabricate a result1 by multiplying the input by 2">
		<cfargument name="notification" type="org.puremvc.cf.interfaces.INotification" required="true" hint="The INotification carrying the MacroCommandTestVO">
		<cfscript>
			var vo = notification.getBody();
			
			// Fabricate a result
			vo.result1 = 2 * vo.input;
		</cfscript>
	</cffunction>
	
</cfcomponent>