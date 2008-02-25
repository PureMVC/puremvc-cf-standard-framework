<!---
 PureMVC ColdFusion Port by Michael Oddis <michael.oddis@puremvc.org>
 PureMVC - Copyright(c) 2006, 2008 Futurescale, Inc., Some rights reserved.
 Your reuse is governed by the Creative Commons Attribution 3.0 License

 The interface definition for ICommand.
--->
<cfinterface displayName="ICommand">
			
	<cffunction name="execute" returntype="void" access="public" output="true" hint="Execute the ICommand's logic to handle a given INotification.">
		<cfargument name="notification" type="org.puremvc.cf.interfaces.INotification" required="true" hint="An INotification to handle.">
	</cffunction>
	
</cfinterface>