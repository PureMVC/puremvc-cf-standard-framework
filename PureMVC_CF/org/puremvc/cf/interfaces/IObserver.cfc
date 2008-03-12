<!---
******************************************************************************
 PureMVC ColdFusion Port by Michael Oddis <michael.oddis@puremvc.org>
 PureMVC - Copyright(c) 2006, 2008 Futurescale, Inc., Some rights reserved.
 Your reuse is governed by the Creative Commons Attribution 3.0 License
******************************************************************************

The interface definition for a PureMVC Observer.

In PureMVC, IObserver implementors assume these responsibilities:

- Encapsulate the notification (callback) method of the interested object.
- Encapsulate the notification context (this) of the interested object.
- Provide methods for setting the interested object' notification method and context.
- Provide a method for notifying the interested object.


PureMVC does not rely upon underlying event models such as the one provided with Flash,
and ActionScript 3 does not have an inherent event model.

The Observer Pattern as implemented within PureMVC exists to support event driven communication
between the application and the actors of the MVC triad.

An Observer is an object that encapsulates information about an interested object with a notification method that
should be called when an INotification is broadcast. The Observer then acts as a proxy for notifying the interested object.

Observers can receive Notifications by having their notifyObserver method invoked, passing in an object implementing the INotification interface, such
as a subclass of Notification.
	 
--->
<cfinterface displayname="IObserver" hint="The interface definition for IObserver.">

	<cffunction name="setNotifyMethod" displayname="setNotifyMethod" access="public" returntype="void" hint="Sets the notification callback method.">
		<cfargument name="notifyMethod" type="string" required="true" hint="The notification (callback) method of the interested object.">	
	</cffunction>
	
	<!--- Set the notification context. --->
	<cffunction name="setNotifyContext" displayname="setNotifyContext" access="public" returntype="void" hint="Sets the notification contect">
		<cfargument name="notifyContext" type="any" required="true" hint="The notification context (this) of the interested object.">	
	</cffunction>
	
	<!---  Notify the interested object. --->
	<cffunction name="notifyObserver" displayname="notifyObserver" access="public" returntype="void" output="true" hint="Notify the interested object.">
		<cfargument name="notification" type="org.puremvc.cf.interfaces.INotification" required="true" hint="The INotification to pass to the interested object's notification method.">	
	</cffunction>
	
</cfinterface>