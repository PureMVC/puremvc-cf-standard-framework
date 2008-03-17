<!---
******************************************************************************
 PureMVC ColdFusion Port by Michael Oddis <michael.oddis@puremvc.org>
 PureMVC - Copyright(c) 2006, 2008 Futurescale, Inc., Some rights reserved.
 Your reuse is governed by the Creative Commons Attribution 3.0 License
******************************************************************************

 The interface definition for a PureMVC Notification.

 PureMVC does not rely upon underlying event models such as the one provided with Flash, and ActionScript 3 does 
 not have an inherent event model.
 
 The Observer Pattern as implemented within PureMVC exists to support event-driven communication between the 
 application and the actors of the MVC triad.
 
 Notifications are not meant to be a replacement for Events in Flex/Flash/AIR. Generally, IMediator implementors
 place event listeners on their view components, which they then handle in the usual way. This may lead to the 
 broadcast of Notifications to trigger ICommands or to communicate with other IMediators. IProxy and ICommand 
 instances communicate with each other and IMediators by broadcasting INotifications.</P>
 
 A key difference between Flash Events and PureMVC Notifications is that Events follow the 'Chain of Responsibility' 
 pattern, 'bubbling' up the display hierarchy until some parent component handles the Event, while PureMVC 
 Notifications follow a 'Publish/Subscribe' pattern. PureMVC classes need not be related to each other in a 
 parent/child relationship in order to communicate with one another using Notifications.

--->
<cfinterface displayname="INotification" hint="The interface definition for INotification.">
	
	<cffunction name="getName" returntype="string" access="public" output="false" hint="Get the name of the INotification instance. No setter, should be set by constructor only.">
	</cffunction>
	
	<cffunction name="setBody" returntype="void" access="public" output="false" hint="Set the body of the INotification instance.">
		<cfargument name="notificationBody" type="any" required="true">
	</cffunction>
	
	<cffunction name="getBody" returntype="any" access="public" output="false" hint="Get the body of the INotification instance.">
	</cffunction>
	
	<cffunction name="setType" returntype="void" access="public" output="false" hint="Set the type of the INotification instance">
		<cfargument name="notificationType" type="string" required="true">
	</cffunction>
	
	<cffunction name="getType" returntype="string" access="public" output="false" hint="Get the type of the INotification instance.">
	</cffunction>
	
</cfinterface>