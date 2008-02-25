<!---
******************************************************************************
 PureMVC ColdFusion Port by Michael Oddis <michael.oddis@puremvc.org>
 PureMVC - Copyright(c) 2006, 2008 Futurescale, Inc., Some rights reserved.
 Your reuse is governed by the Creative Commons Attribution 3.0 License
******************************************************************************
******************************************************************************
 * The interface definition for a PureMVC View.
 * 
 * <P>
 * In PureMVC, <code>IView</code> implementors assume these responsibilities:</P>
 * 
 * <P>
 * In PureMVC, the <code>View</code> class assumes these responsibilities:
 * <UL>
 * <LI>Maintain a cache of <code>IMediator</code> instances.</LI>
 * <LI>Provide methods for registering, retrieving, and removing <code>IMediators</code>.</LI>
 * <LI>Managing the observer lists for each <code>INotification</code> in the application.</LI>
 * <LI>Providing a method for attaching <code>IObservers</code> to an <code>INotification</code>'s observer list.</LI>
 * <LI>Providing a method for broadcasting an <code>INotification</code>.</LI>
 * <LI>Notifying the <code>IObservers</code> of a given <code>INotification</code> when it broadcast.</LI>
 * </UL>
 * 
 * See org.puremvc.interfaces.IMediator IMediator
 * See org.puremvc.interfaces.IObserver IObserver
 * See org.puremvc.interfaces.INotification INotification
******************************************************************************
--->
<cfinterface displayname="IView"
			 hint="The interface definition for a PureMVC View.">

	<cffunction name="registerObserver" displayname="registerObserver" returntype="void" access="public" output="true" 
				hint="Register an <code>IObserver</code> to be notified of <code>INotifications</code> with a given name.">
		<cfargument name="notificationName" type="string" required="true" hint="The name of the <code>INotifications</code>">
		<cfargument name="observer" type="org.puremvc.cf.interfaces.IObserver" required="true" hint="The <code>IObserver</code> to register">
	</cffunction>
	
	<cffunction name="notifyObservers" displayname="notifyObservers" returntype="void" access="public" output="true" 
				hint="Notify the <code>IObservers</code> for a particular <code>INotification</code>.">
		<cfargument name="notification" type="org.puremvc.cf.interfaces.INotification" required="true" hint="The <code>INotification</code> to notify <code>IObservers</code>">
	</cffunction>
	
	<cffunction name="registerMediator" displayname="registerMediator" returntype="void" access="public" output="true"
				hint="Register an <code>IMediator</code> instance with the <code>View</code>.">
		<cfargument name="mediator" type="org.puremvc.cf.interfaces.IMediator" required="true" hint="A reference to the <code>IMediator</code> instance">
	</cffunction>
	
	<cffunction name="retrieveMediator" displayname="retrieveMediator" returntype="org.puremvc.cf.interfaces.IMediator" access="public" output="true"
				hint="Retrieve an <code>IMediator</code> from the <code>View</code>.">
		<cfargument name="mediatorName" type="string" required="true" hint="The name of the <code>IMediator</code> instance to retrieve.">
	</cffunction>
	
	<cffunction name="removeMediator" displayname="removeMediator" returntype="void" access="public" output="true"
				hint="Remove an <code>IMediator</code> from the <code>View</code>.">
		<cfargument name="mediatorName" type="string" required="true" hint="Name of the <code>IMediator</code> instance to be removed.">
	</cffunction>

</cfinterface>