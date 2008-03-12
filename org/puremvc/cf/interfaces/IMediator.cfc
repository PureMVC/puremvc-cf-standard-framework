<!---
******************************************************************************
 PureMVC ColdFusion Port by Michael Oddis <michael.oddis@puremvc.org>
 PureMVC - Copyright(c) 2006, 2008 Futurescale, Inc., Some rights reserved.
 Your reuse is governed by the Creative Commons Attribution 3.0 License
******************************************************************************

 The interface definition for a PureMVC Mediator.
 
 In PureMVC, IMediator implementors assume these responsibilities:
 
 - Implement a common method which returns a list of all INotifications the IMediator has interest in.
 - Implement a common notification (callback) method.
 
 Additionally, IMediators typically:
 
 Act as an intermediary between one or more view components such as text boxes or 
 list controls, maintaining references and coordinating their behavior. In ColdFusion-based 
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

 <cfcomponent displayname="LoginViewMediator" 
			 extends="org.puremvc.cf.patterns.mediator.Mediator" 
			 output="true">
		
	<cfscript>
		variables.mediatorName = 'LoginViewMediator';
	</cfscript>

	<cffunction name="init" returntype="org.puremvc.cf.interfaces.IMediator" access="public" output="true">
		<cfargument name="mediatorName" type="string" required="true" hint="The name of the mediator" default="">
		<cfargument name="viewComponent" type="org.puremvc.cf.interfaces.IViewComponent" required="false" hint="An instance of IViewComponent">
		<cfscript>
			super.init(arguments.mediatorName,arguments.viewComponent);
			return this;
		</cfscript>
	</cffunction>
	
	<cffunction name="onLoginUser" returntype="void" access="public" output="true">
		<cfscript>
		</cfscript>
	</cffunction>
	
	<cffunction name="listNotificationInterests" returntype="array" access="public" output="true">
		<cfscript>
			var interests = ArrayNew(1);
			interests[1] = "USER_LOGIN_RESULT";
			interests[2] = "USER_LOGIN_QUERY_RESULT";
			return interests;
		</cfscript>
	</cffunction>
	
	<cffunction name="handleNotification" returntype="void" access="public" output="true">
		<cfargument name="notification" type="org.puremvc.cf.interfaces.INotification" required="true">
		<cfscript>
			if ( arguments.notification.getName() EQ "USER_LOGIN_RESULT")
			{
				this.getViewComponent().updateView(arguments.notification.getBody());
			} else if ( arguments.notification.getName() EQ "USER_LOGIN_QUERY_RESULT")
			{
				this.getViewComponent().updateViewAsQuery(arguments.notification.getBody());
			}
		</cfscript>
	</cffunction>
	
 </cfcomponent>

******************************************************************************
--->
<cfinterface displayname="IMediator" 
			 hint="The interface definition for a PureMVC Mediator.">
	
	<cffunction name="setMediatorName" returntype="void" access="public" output="true" hint="Sets the name of the Mediator">
		<cfargument name="mediatorName" type="string" required="true">
	</cffunction>
	
	<cffunction name="getMediatorName" returntype="string" access="public" output="true" hint="Get the IMediator instance name">
	</cffunction>
	
	<cffunction name="setViewComponent" returntype="void" access="public" output="true" hint="Sets the Mediator''s view component.">
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