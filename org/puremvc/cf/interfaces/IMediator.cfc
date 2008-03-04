<!---
******************************************************************************
 PureMVC ColdFusion Port by Michael Oddis <michael.oddis@puremvc.org>
 PureMVC - Copyright(c) 2006, 2008 Futurescale, Inc., Some rights reserved.
 Your reuse is governed by the Creative Commons Attribution 3.0 License
******************************************************************************

 The interface definition for a PureMVC Mediator.
 
 In PureMVC, IMediator implementors assume these responsibilities:
 
 - Implement a common method which returns a list of all INotifications 
 - the IMediator has interest in.
 - Implement a common notification (callback) method.
 
 Additionally, IMediators typically:
 
 Act as an intermediary between one or more ViewHelper components such as text boxes or 
 list controls, maintaining references and coordinating their behavior. In Flash-based 
 apps, this is often the place where event listeners are added to view components, and 
 their handlers implemented. Respond to and generate INotifications, interacting with of 
 the rest of the PureMVC app.

 When an IMediator is registered with the IView, the IView will call the IMediator's 
 listNotificationInterests method. The IMediator will return an Array of INotification names which 
 it wishes to be notified about.
 
 The IView will then create an Observer object encapsulating that IMediator's (handleNotification) 
 method and register it as an Observer for each INotification name returned by 
 listNotificationInterests.
 
 A concrete IMediator implementor usually looks something like this:

******************************************************************************
--->
<cfinterface displayname="IMediator" 
			 hint="The interface definition for a PureMVC Mediator.">
	
	<cffunction name="setMediatorName" returntype="void" access="public" output="true" hint="Sets the name of the Mediator">
		<cfargument name="mediatorName" type="string" required="true">
	</cffunction>
	
	<cffunction name="getMediatorName" returntype="string" access="public" output="true" hint="Get the IMediator instance name">
	</cffunction>
	
	<cffunction name="setViewComponent" returntype="void" access="public" output="true">
		<cfargument name="viewComponent" type="org.puremvc.cf.interfaces.IViewComponent" required="true">
	</cffunction>
	
	<cffunction name="getViewComponent" returntype="org.puremvc.cf.interfaces.IViewComponent" access="public" output="true" hint="Get the IMediator's view component.">
	</cffunction>
	
	<cffunction name="listNotificationInterests" returntype="array" access="public" output="true" hint="List INotification interests.">
	</cffunction>
	
	<cffunction name="handleNotification" returntype="void" access="public" output="true" hint="Handle an INotification.">
		<cfargument name="notification" type="org.puremvc.cf.interfaces.INotification" required="true">
	</cffunction>
	
	<cffunction name="applyNotifyMethod" returntype="void" access="public" output="true" hint="Runs the Observer handler of an IMediator when registered as an Observer.">
		<cfargument name="notification" type="org.puremvc.cf.interfaces.INotification" required="true">
	</cffunction>
	
	<cffunction name="onRegister" returntype="void" access="public" output="true" hint="Called by the View when the Mediator is registered">
	</cffunction>
	
	<cffunction name="onRemove" returntype="void" access="public" output="true" hint="Called by the View when the Mediator is removed">
	</cffunction>
	
</cfinterface>