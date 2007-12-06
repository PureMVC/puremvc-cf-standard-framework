<!---
 PureMVC ColdFusion Port by Michael Oddis <michael.oddis@puremvc.org>
 PureMVC - Copyright(c) 2006, 2007 Futurescale, Inc., Some rights reserved.
 Your reuse is governed by the Creative Commons Attribution 3.0 License
--->
<cfinterface name="INotification" displayname="INotification">
	
	<!--- 
	 * Get the name of the <code>INotification</code> instance. 
	 * No setter, should be set by constructor only
	--->
	<cffunction name="getName" returntype="string" access="public" output="true">
	</cffunction>
	
	<!--- 
	/**
	 * Set the body of the <code>INotification</code> instance
	 */
	--->
	<cffunction name="setBody" returntype="void" access="public" output="true">
		<cfargument name="notificationBody" type="any" required="true">
	</cffunction>
	
	<!---  
	/**
	 * Get the body of the <code>INotification</code> instance
	 */
	--->
	<cffunction name="getBody" returntype="any" access="public" output="true">
	</cffunction>
	
	<!---  
	/**
	 * Set the type of the <code>INotification</code> instance
	 */
	--->
	<cffunction name="setType" returntype="void" access="public" output="true">
		<cfargument name="notificationType" type="string" required="true">
	</cffunction>
	
	<!---  
	/**
	 * Get the type of the <code>INotification</code> instance
	 */
	--->
	<cffunction name="getType" returntype="string" access="public" output="true">
	</cffunction>
	
</cfinterface>