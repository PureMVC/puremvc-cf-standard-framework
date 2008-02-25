<!---
******************************************************************************
 PureMVC ColdFusion Port by Michael Oddis <michael.oddis@puremvc.org>
 PureMVC - Copyright(c) 2006, 2008 Futurescale, Inc., Some rights reserved.
 Your reuse is governed by the Creative Commons Attribution 3.0 License
******************************************************************************
******************************************************************************
 A Singleton IController implementation.
 
 In PureMVC, the Controller class follows the 'Command and Controller' strategy, and assumes 
 these responsibilities:
 
 * Remembering which ICommands are intended to handle which INotifications.
 * Registering itself as an IObserver with the View for each INotification that it has an ICommand mapping for.
 * Creating a new instance of the proper ICommand to handle a given INotification when notified by the View.
 * Calling the ICommand's execute method, passing in the INotification.</LI> 

 Your application must register ICommands with the Controller.
 
 The simplest way is to subclass Facade, and use its initializeController method to add your registrations. 
  
 * See org.puremvc.core.view.View View
 * See org.puremvc.patterns.observer.Observer Observer
 * See org.puremvc.patterns.observer.Notification Notification
 * See org.puremvc.patterns.command.SimpleCommand SimpleCommand
 * See org.puremvc.patterns.command.MacroCommand MacroCommand
******************************************************************************
--->
<cfcomponent displayname="Controller" 
			 implements="org.puremvc.cf.interfaces.IController"
			 output="true"
			 hint="A Singleton IController implementation.">
	
	<cfproperty name="view" type="org.puremvc.cf.interfaces.IView" required="true" hint="Local reference to View">
	<cfproperty name="commandMap" type="struct" required="true" hint="Mapping of Notification names to Command Class references">
	<cfproperty name="controllerInstance" type="org.puremvc.cf.interfaces.IController" required="true" hint="Singleton instance">

	<cfscript>
		// Local reference to View 
		this.view = 0;
		
		// Mapping of Notification names to Command Class references
		this.commandMap = {};
	</cfscript>
	
	<cffunction name="getInstance" displayname="getInstance" access="public" returntype="org.puremvc.cf.interfaces.IController" output="true" 
				hint="Controller Singleton Factory method. Returns the Singleton instance of Controller">
		<cfscript>
			if ( NOT StructKeyExists(this, "controllerInstance" ) )
			{
				this.controllerInstance = CreateObject("Component", "org.puremvc.cf.core.controller.Controller");
				this.controllerInstance.initializeController();
			}
			return this.controllerInstance;
		</cfscript>
	</cffunction>
	
	 <!--- 
	 * Note: If you are using a subclass of View in your application, you should also subclass Controller
	 * and override the initializeController method in the subclass:
	 --->
	<cffunction name="initializeController" displayname="initializeController" access="public" returntype="void" 
				hint="Initialize the Singleton Controller instance. Called automatically by the constructor.">
		<cfscript>
			this.view = application.facadeInstance.view;
		</cfscript>
	</cffunction>
	
	<cffunction name="executeCommand" returntype="void" access="public" output="true" hint="If an ICommand has previously been registered to handle a the given INotification, then it is executed.">
		<cfargument name="notification" type="org.puremvc.cf.interfaces.INotification" required="true" hint="A notification">
		<cfscript>
			var commandClassRef = 0;
			var commandInstance = 0;
			if (StructKeyExists(this.commandMap, arguments.notification.getName()))
			{
				commandClassRef = this.commandMap[arguments.notification.getName()];
			} 
			if ( commandClassRef EQ 0 ){ return; }
			commandInstance = CreateObject("component", commandClassRef);
			commandInstance.execute( arguments.notification );
		</cfscript>
	</cffunction>
	
	 <!--- 
	 * If an ICommand has already been registered to handle INotification's with this name, 
	 * it is no longer used, the new ICommand is used instead.
	 * 
	 * The Observer for the new ICommand is only created if this is the 
	 * first time an ICommand has been regisered for this Notification name. 
	 --->
	<cffunction name="registerCommand" returntype="void" access="public" output="true" hint="I Register a particular ICommand class as the handler for a particular INotification.">
		<cfargument name="notificationName" type="string" required="true" hint="The name of the INotification">
		<cfargument name="commandClassRef" type="string" required="true" hint="The Class of the ICommand">
		<cfscript>
			var observer = CreateObject("component", "org.puremvc.cf.patterns.observer.Observer").init("executeCommand", this);
			this.commandMap[ arguments.notificationName ] = arguments.commandClassRef;
			this.view.registerObserver( arguments.notificationName, observer );
		</cfscript>
	</cffunction>
	
	<cffunction name="removeCommand" returntype="void" access="public" output="true" hint="Remove a previously registered ICommand to INotification mapping.">
		<cfargument name="notificationName" type="string" required="true" hint="The name of the INotification to remove">
		<cfscript>
			StructDelete(this.commandMap, arguments.notificationName, false);
		</cfscript>
	</cffunction>
	
	<cffunction name="applyNotifyMethod" returntype="void" access="public" output="true" hint="Calls a method on the Controller when registered as an Observer.">
		<cfargument name="notification" type="org.puremvc.cf.interfaces.INotification" required="true" hint="The Notification supplied by the Observer">
		<cfscript>
			this.executeCommand(arguments.notification);
		</cfscript>
	</cffunction>
	
</cfcomponent>