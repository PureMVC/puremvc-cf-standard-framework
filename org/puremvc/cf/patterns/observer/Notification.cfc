<!---
 PureMVC ColdFusion Port by Michael Oddis <michael.oddis@puremvc.org>
 PureMVC - Copyright(c) 2006, 2008 Futurescale, Inc., Some rights reserved.
 Your reuse is governed by the Creative Commons Attribution 3.0 License
--->
<cfcomponent displayName="Notification" 
			 implements="org.puremvc.cf.interfaces.INotification"
			 output="true">
	
	<cfproperty name="notificationName" type="string" required="true" hint="The name of the notification instance">
	<cfproperty name="notificationBody" type="any" required="true" hint="The body of the notification instance">
	<cfproperty name="notificationType" type="string" required="true" hint="The type of the notification instance">
	
	<cfscript>
		// the name of the notification instance
		variables.notificationName = "";
		// the body of the notification instance
		variables.notificationBody = 0;
		// the type of the notification instance
		variables.notificationType = "";
	</cfscript>
	
	<cffunction name="init" returntype="void" access="public" output="true">
		<cfargument name="notificationName" type="string" required="true" hint="Name of the Notification instance">
		<cfargument name="notificationBody" type="any" required="false" hint="Body the Notification body.">
		<cfargument name="notificationType" type="string" required="false" hint="Type the type of the Notification">
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
	
	<cffunction name="getName" returntype="string" access="public" output="true" description="Get the name of the INotification instance. No setter, should be set by constructor only">
		<cfscript>
			return variables.notificationName;
		</cfscript>
	</cffunction>
	
	<cffunction name="setBody" returntype="void" access="public" output="true" description="Set the body of the INotification instance">
		<cfargument name="notificationBody" type="any" required="true">
		<cfscript>
			variables.notificationBody = arguments.notificationBody;
		</cfscript>
	</cffunction>
	
	<cffunction name="getBody" returntype="any" access="public" output="true" description="Get the body of the INotification instance">
		<cfscript>
			return variables.notificationBody;
		</cfscript>
	</cffunction>
	
	<cffunction name="setType" returntype="void" access="public" output="true" description="Set the type of the INotification instance">
		<cfargument name="notificationType" type="string" required="true">
		<cfscript>
			variables.notificationType = arguments.notificationType;
		</cfscript>
	</cffunction>
	
	<cffunction name="getType" returntype="string" access="public" output="true" description="Get the type of the INotification instance">
		<cfscript>
			return variables.notificationType;
		</cfscript>
	</cffunction>

</cfcomponent>