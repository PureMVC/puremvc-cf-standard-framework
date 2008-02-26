<!---
******************************************************************************
 PureMVC ColdFusion Port by Michael Oddis <michael.oddis@puremvc.org>
 PureMVC - Copyright(c) 2006, 2008 Futurescale, Inc., Some rights reserved.
 Your reuse is governed by the Creative Commons Attribution 3.0 License
******************************************************************************
******************************************************************************
 The interface definition for a PureMVC Controller.
 
 In PureMVC, an IController implementor follows the 'Command and Controller' strategy, and 
 assumes these responsibilities:

 * Remembering which ICommands are intended to handle which INotifications.
 * Registering itself as an IObserver with the View for each INotification that it has an ICommand mapping for.
 * Creating a new instance of the proper ICommand to handle a given INotification when notified by the View.
 * Calling the ICommand's execute method, passing in the INotification.

 * See org.puremvc.interfaces INotification
 * See org.puremvc.interfaces ICommand
******************************************************************************
--->
<cfinterface displayname="IController" hint="The interface definition for a PureMVC Controller.">
	
	<cffunction name="executeCommand" returntype="void" access="public" output="true">
		<cfargument name="notification" type="org.puremvc.cf.interfaces.INotification" required="true" hint="A notification">
	</cffunction>
	
	<cffunction name="registerCommand" returntype="void" access="public" output="true">
		<cfargument name="notificationName" type="string" required="true" hint="The name of the INotification">
		<cfargument name="commandClassRef" type="string" required="true" hint="The Class of the ICommand">
	</cffunction>
	
	<cffunction name="removeCommand" returntype="void" access="public" output="true">
		<cfargument name="notificationName" type="string" required="true" hint="The name of the INotification to remove">
	</cffunction>
	
	<cffunction name="applyNotifyMethod" returntype="void" access="public" output="true">
		<cfargument name="notification" type="org.puremvc.cf.interfaces.INotification" required="true" hint="The Notification supplied by the Observer">
	</cffunction>
	
</cfinterface>