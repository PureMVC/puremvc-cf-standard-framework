<!---
******************************************************************************
 PureMVC ColdFusion Port by Michael Oddis <michael.oddis@puremvc.org>
 PureMVC - Copyright(c) 2006, 2008 Futurescale, Inc., Some rights reserved.
 Your reuse is governed by the Creative Commons Attribution 3.0 License
******************************************************************************
--->
<cfinterface displayname="INotification" hint="The interface definition for INotification.">
	
	<cffunction name="getName" returntype="string" access="public" output="true" hint="Get the name of the INotification instance. No setter, should be set by constructor only.">
	</cffunction>
	
	<cffunction name="setBody" returntype="void" access="public" output="true" hint="Set the body of the INotification instance.">
		<cfargument name="notificationBody" type="any" required="true">
	</cffunction>
	
	<cffunction name="getBody" returntype="any" access="public" output="true" hint="Get the body of the INotification instance.">
	</cffunction>
	
	<cffunction name="setType" returntype="void" access="public" output="true" hint="Set the type of the INotification instance">
		<cfargument name="notificationType" type="string" required="true">
	</cffunction>
	
	<cffunction name="getType" returntype="string" access="public" output="true" hint="Get the type of the INotification instance.">
	</cffunction>
	
</cfinterface>