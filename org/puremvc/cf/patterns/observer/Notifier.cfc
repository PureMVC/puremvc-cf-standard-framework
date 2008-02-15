<!---
 PureMVC ColdFusion Port by Michael Oddis <michael.oddis@puremvc.org>
 PureMVC - Copyright(c) 2006, 2008 Futurescale, Inc., Some rights reserved.
 Your reuse is governed by the Creative Commons Attribution 3.0 License

 /*
 * A Base INotifier implementation.
 * 
 * MacroCommand, Command, Mediator, Proxy, and ViewHelper 
 * all have a need to send Notifications.
 * 
 * The INotifier interface provides a common method called
 * sendNotification that relieves implementation code of 
 * the necessity to actually construct Notifications.
 * 
 * The Notifier class, which all of the above mentioned classes
 * extend, provides an initialized reference to the Facade
 * Singleton, which is required for the convienience method
 * for sending Notifications, but also eases implementation as these
 * classes have frequent Facade interactions and usually require
 * access to the facade anyway.
 * 
 * see org.puremvc.patterns.facade.Facade
 * see org.puremvc.patterns.mediator.Mediator
 * see org.puremvc.patterns.proxy.Proxy
 * see org.puremvc.patterns.command.SimpleCommand
 * see org.puremvc.patterns.command.MacroCommand
 * see org.puremvc.patterns.viewHelper.ViewHelper
 */
--->
<cfcomponent name="Notifier" displayname="Notifier" output="true" hint="Send an INotification">
	
	<cfproperty name="facade" type="org.puremvc.cf.interfaces.IFacade" default="0" required="true" hint="Concrete implementation of IFacade.">

	<cfscript>
		variables.facade = application.facadeInstance;
	</cfscript>
	
	<cffunction name="sendNotification" returntype="void" access="public" output="true" hint="Sends a notification which Observers will act upon.">
		<cfargument name="notificationName" type="string" required="true">
		<cfargument name="notificationBody" type="any" default="0" required="false">
		<cfargument name="notificationType" type="string" default="" required="false">
		<cfscript>
			var notification = CreateObject("component","org.puremvc.cf.patterns.observer.Notification");			
			notification.init(arguments.notificationName, arguments.notificationBody, arguments.notificationType);
			variables.facade.notifyObservers(notification);
		</cfscript>
	</cffunction>
	
	<cffunction name="applyNotifyMethod" returntype="void" access="public" output="true" hint="Used to execute the method to handle the notification sent from Proxies.">
		<cfargument name="notification" type="org.puremvc.cf.interfaces.INotification" required="true">
		<cfscript>
			this.handleNotification(arguments.notification);
		</cfscript>
	</cffunction>
	
	<cffunction name="getFacade" access="public" returntype="org.puremvc.cf.interfaces.IFacade">
		<cfscript>
			return variables.facade;
		</cfscript>
	</cffunction>

</cfcomponent>