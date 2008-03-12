<!---
******************************************************************************
 PureMVC ColdFusion Port by Michael Oddis <michael.oddis@puremvc.org>
 PureMVC - Copyright(c) 2006, 2008 Futurescale, Inc., Some rights reserved.
 Your reuse is governed by the Creative Commons Attribution 3.0 License
******************************************************************************

 The interface definition for a PureMVC Notifier.

 MacroCommand, SimpleCommand, Command, Mediator, Proxy, and ViewHelper all have a need to send Notifications. 
 
 The INotifier interface provides a common method called sendNotification that relieves implementation code of 
 the necessity to actually construct Notifications.
 
 The Notifier class, which all of the above mentioned classes extend, also provides an initialized reference to 
 the Facade Singleton, which is required for the convienience method for sending Notifications, but also eases 
 implementation as these classes have frequent Facade interactions and usually require access to the facade anyway.
	 
--->
<cfinterface displayname="INotifier" hint="The interface definition for INotifier. MacroCommand, SimpleCommand, Command, Mediator, Proxy, and ViewHelper all have a need to send Notifications.">	
	
	<cffunction name="sendNotification" returntype="void" access="public" output="true" hint="Convenience method to prevent having to construct new notification instances in our implementation code.">
		<cfargument name="notificationName" type="string" required="true">
		<cfargument name="notificationBody" type="any" default="0" required="false">
		<cfargument name="notificationType" type="string" default="" required="false">
	</cffunction>

</cfinterface>