<!---
******************************************************************************
 PureMVC ColdFusion Port by Michael Oddis <michael.oddis@puremvc.org>
 PureMVC - Copyright(c) 2006, 2008 Futurescale, Inc., Some rights reserved.
 Your reuse is governed by the Creative Commons Attribution 3.0 License
******************************************************************************

 The interface definition for a PureMVC View.
 
 In PureMVC, the View class assumes these responsibilities:

 - Maintain a cache of IMediator instances.
 - Provide methods for registering, retrieving, and removing IMediators.
 - Managing the observer lists for each INotification in the application.
 - Providing a method for attaching IObservers to an INotification's observer list.
 - Providing a method for broadcasting an INotification.
 - Notifying the IObservers of a given INotification when it broadcast.

--->
<cfinterface displayname="IView" hint="The interface definition for a PureMVC View. In PureMVC, the View class assumes these responsibilities. Maintain a cache of IMediator instances. Provide methods for registering, retrieving, and removing IMediators. Managing the observer lists for each INotification in the application. Providing a method for attaching IObservers to an INotification's observer list. Providing a method for broadcasting an INotification. Notifying the IObservers of a given INotification when it broadcast.">

	<cffunction name="registerObserver" displayname="registerObserver" returntype="void" access="public" output="false" 
				hint="Register an IObserver to be notified of INotifications with a given name.">
		<cfargument name="notificationName" type="string" required="true" hint="The name of the INotifications">
		<cfargument name="observer" type="org.puremvc.cf.interfaces.IObserver" required="true" hint="The IObserver to register">
	</cffunction>
	
	<cffunction name="notifyObservers" displayname="notifyObservers" returntype="void" access="public" output="false" 
				hint="Notify the IObservers for a particular INotification.">
		<cfargument name="notification" type="org.puremvc.cf.interfaces.INotification" required="true" hint="The INotification to notify IObservers">
	</cffunction>
	
	<cffunction name="registerMediator" displayname="registerMediator" returntype="void" access="public" output="false"
				hint="Register an IMediator instance with the View.">
		<cfargument name="mediator" type="org.puremvc.cf.interfaces.IMediator" required="true" hint="A reference to the IMediator instance">
	</cffunction>
	
	<cffunction name="retrieveMediator" displayname="retrieveMediator" returntype="org.puremvc.cf.interfaces.IMediator" access="public" output="false"
				hint="Retrieve an IMediator from the View.">
		<cfargument name="mediatorName" type="string" required="true" hint="The name of the IMediator instance to retrieve.">
	</cffunction>
	
	<cffunction name="removeMediator" displayname="removeMediator" returntype="any" access="public" output="false"
				hint="Remove an IMediator from the View.">
		<cfargument name="mediatorName" type="string" required="true" hint="Name of the IMediator instance to be removed.">
	</cffunction>
	
	<cffunction name="hasMediator" displayname="hasMediator" returntype="boolean" access="public" output="false" hint="Check if a Mediator is registered or not">
		<cfargument name="mediatorName" type="string" required="true" hint="The name of the IMediator instance to retrieve.">
	</cffunction>

</cfinterface>