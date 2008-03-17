<!---
 PureMVC ColdFusion Port by Michael Oddis <michael.oddis@puremvc.org>
 PureMVC - Copyright(c) 2006, 2007 Futurescale, Inc., Some rights reserved.
 Your reuse is governed by the Creative Commons Attribution 3.0 License
--->
<cfcomponent displayname="NotificationTestNote"
			 extends="org.puremvc.cf.patterns.observer.notification.Notification"
			 output="false">
				 
	<cfscript>
		this.notificationName = "NotificationTestNote";
	</cfscript>
	
	<cffunction name="init" returntype="void" access="public" output="false" hint="">
		<cfargument name="notificationName" type="string" required="true" hint="Name of the Notification instance">
		<cfargument name="notificationBody" type="any" required="false" hint="Body the Notification body.">
		<cfargument name="notificationType" type="string" required="false" hint="Type the type of the Notification">
		<cfscript>
			super.init(arguments.notificationName, arguments.notificationBody, arguments.notificationType);
		</cfscript>
	</cffunction>
	
	<cffunction name="create" returntype="org.puremvc.cf.interfaces.INotification" access="public" output="false" hint="">
		<cfargument name="notificationBody" type="any" required="false" hint="Body the Notification body.">
		<cfargument name="notificationType" type="string" required="false" hint="Type the type of the Notification">
		<cfscript>
			var note = CreateObject("component","org.puremvc.cf.patterns.observer.Notification");
			note.init(this.notificationName, arguments.notificationBody, arguments.notificationType);
			return note;
		</cfscript>
	</cffunction>
	
</cfcomponent>