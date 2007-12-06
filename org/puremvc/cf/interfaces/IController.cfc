<!---
 PureMVC ColdFusion Port by Michael Oddis <michael.oddis@puremvc.org>
 PureMVC - Copyright(c) 2006, 2007 Futurescale, Inc., Some rights reserved.
 Your reuse is governed by the Creative Commons Attribution 3.0 License
--->
<cfinterface displayname="IController">
	
	<cffunction name="registerCommand" returntype="void" access="public" output="true">
		<cfargument name="notificationName" type="string" required="true">
		<cfargument name="commandClassRef" type="string" required="true">
	</cffunction>
	
	<cffunction name="executeCommand" returntype="void" access="public" output="true">
		<cfargument name="notification" type="org.puremvc.cf.interfaces.INotification" required="true">
	</cffunction>
	
	<cffunction name="removeCommand" returntype="void" access="public" output="true">
		<cfargument name="notificationName" type="string" required="true">
	</cffunction>
	
</cfinterface>