<!---
******************************************************************************
 PureMVC ColdFusion Port by Michael Oddis <michael.oddis@puremvc.org>
 PureMVC - Copyright(c) 2006, 2008 Futurescale, Inc., Some rights reserved.
 Your reuse is governed by the Creative Commons Attribution 3.0 License
******************************************************************************

The interface definition for a PureMVC Controller.

In PureMVC, an IController implementor follows the 'Command and Controller' strategy, and 
assumes these responsibilities:

- Remembering which ICommands are intended to handle which INotifications.
- Registering itself as an IObserver with the View for each INotification that it has an ICommand mapping for.
- Creating a new instance of the proper ICommand to handle a given INotification when notified by the View.
- Calling the ICommand's execute method, passing in the INotification.

******************************************************************************
--->
<cfinterface displayname="IController"
			 hint="The interface definition for a PureMVC Controller. In PureMVC, an IController implementor follows the 'Command and Controller' strategy, and assumes these responsibilities. Remembering which ICommands are intended to handle which INotifications. Registering itself as an IObserver with the View for each INotification that it has an ICommand mapping for. Creating a new instance of the proper ICommand to handle a given INotification when notified by the View. Calling the ICommand's execute method, passing in the INotification.">
	
	<cffunction name="registerCommand" returntype="void" access="public" output="true" hint="Register a particular ICommand class as the handler for a particular INotification.">
		<cfargument name="notificationName" type="string" required="true" hint="The name of the INotification">
		<cfargument name="commandClassRef" type="string" required="true" hint="The Class of the ICommand">
	</cffunction>
	
	<cffunction name="executeCommand" returntype="void" access="public" output="true" hint="Execute the ICommand previously registered as the handler for INotifications with the given notification name.">
		<cfargument name="notification" type="org.puremvc.cf.interfaces.INotification" required="true" hint="The INotification to execute the associated ICommand for.">
	</cffunction>
	
	<cffunction name="removeCommand" returntype="void" access="public" output="true" hint="Remove a previously registered ICommand to INotification mapping.">
		<cfargument name="notificationName" type="string" required="true" hint="The name of the INotification to remove">
	</cffunction>
	
	<cffunction name="hasCommand" returntype="void" access="public" output="true" hint="Check if a Command is registered for a given Notification. Returns whether a Command is currently registered for the given notificationName">
		<cfargument name="notificationName" type="string" required="true" hint="The name of the Notification">
	</cffunction>
	
	<cffunction name="applyNotifyMethod" returntype="void" access="public" output="true" hint="Executes the notifyMethod of an IObserver when a notification is sent from Proxies.">
		<cfargument name="notification" type="org.puremvc.cf.interfaces.INotification" required="true">
	</cffunction>
	
</cfinterface>