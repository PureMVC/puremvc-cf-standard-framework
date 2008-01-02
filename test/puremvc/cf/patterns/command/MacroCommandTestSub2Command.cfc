<!---
 PureMVC ColdFusion Port by Michael Oddis <michael.oddis@puremvc.org>
 PureMVC - Copyright(c) 2006, 2007 Futurescale, Inc., Some rights reserved.
 Your reuse is governed by the Creative Commons Attribution 3.0 License
--->
<cfcomponent extends="org.puremvc.cf.patterns.command.SimpleCommand"
			 output="true" 
			 hint="Tests the execute method of a SimpleCommand.">
	
	<cffunction name="execute" returntype="void" access="public" output="true" hint="Fabricate a result by multiplying the input by itself">
		<cfargument name="notification" type="org.puremvc.cf.interfaces.INotification" required="true" hint="The INotification carrying the MacroCommandTestVO">
		<cfscript>
			var vo = notification.getBody();
			
			// Fabricate a result2
			vo.result2 = vo.input * vo.input;
		</cfscript>
	</cffunction>
	
</cfcomponent>