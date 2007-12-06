<!---
 PureMVC ColdFusion Port by Michael Oddis <michael.oddis@puremvc.org>
 PureMVC - Copyright(c) 2006, 2007 Futurescale, Inc., Some rights reserved.
 Your reuse is governed by the Creative Commons Attribution 3.0 License
--->
<cfcomponent output="true" implements="org.puremvc.cf.interfaces.INotification">
	
	<cfproperty name="notificationName" type="string" required="true">
	<cfproperty name="notificationBody" type="any" required="true">
	<cfproperty name="notificationType" type="string" required="true">
	
	<cfscript>
		// the name of the notification instance
		variables.notificationName = "";
		// the body of the notification instance
		variables.notificationBody = 0;
		// the type of the notification instance
		variables.notificationType = "";
	</cfscript>
	
	<!--- 
	 * Constructor. 
	 * 
	 * @param name name of the <code>Notification</code> instance. (required)
	 * @param body the <code>Notification</code> body. (optional)
	 * @param type the type of the <code>Notification</code> (optional)
	--->
	<cffunction name="init" returntype="void" access="public" output="true">
		<cfargument name="notificationName" type="string" required="true" hint="Name of the Notification instance">
		<cfargument name="notificationBody" type="any" required="false" hint="Body the Notification body.">
		<cfargument name="notificationType" type="string" required="false" hint="Type the type of the Notification">
		<!--- <cftrace text="In init() of Notification."> --->
		<cfscript>
			variables.notificationName = arguments.notificationName;
			
			if (IsDefined("arguments.notificationBody"))
			{
				variables.notificationBody = arguments.notificationBody;
			}
			
			if (IsDefined("arguments.notificationType"))
			{
				variables.notificationType = arguments.notificationType;
			}
		</cfscript>
	</cffunction>
		
	<!--- 
	 * Get the name of the <code>INotification</code> instance. 
	 * No setter, should be set by constructor only
	--->
	<cffunction name="getName" returntype="string" access="public" output="true">
		<cfscript>
			return variables.notificationName;
		</cfscript>
	</cffunction>
	
	<!--- 
	 * Set the body of the <code>INotification</code> instance
	--->
	<cffunction name="setBody" returntype="void" access="public" output="true">
		<cfargument name="notificationBody" type="any" required="true">
		<cfscript>
			variables.notificationBody = arguments.notificationBody;
		</cfscript>
	</cffunction>
	
	<!---  
	 * Get the body of the <code>INotification</code> instance
	--->
	<cffunction name="getBody" returntype="any" access="public" output="true">
		<cfscript>
			return variables.notificationBody;
		</cfscript>
	</cffunction>
	
	<!---  
	 * Set the type of the <code>INotification</code> instance
	--->
	<cffunction name="setType" returntype="void" access="public" output="true">
		<cfargument name="notificationType" type="string" required="true">
		<cfscript>
			variables.notificationType = arguments.notificationType;
		</cfscript>
	</cffunction>
	
	<!---  
	 * Get the type of the <code>INotification</code> instance
	--->
	<cffunction name="getType" returntype="string" access="public" output="true">
		<cfscript>
			return variables.notificationType;
		</cfscript>
	</cffunction>

</cfcomponent>