<!---
 PureMVC ColdFusion Port by Michael Oddis <michael.oddis@puremvc.org>
 PureMVC - Copyright(c) 2006, 2008 Futurescale, Inc., Some rights reserved.
 Your reuse is governed by the Creative Commons Attribution 3.0 License
--->
<cfcomponent displayname="Controller" output="true" implements="org.puremvc.cf.interfaces.IController">
	
	<cfproperty name="view" type="org.puremvc.cf.interfaces.IView" required="true">
	<cfproperty name="commandMap" type="struct" required="true">
	<cfproperty name="SINGLETON_MSG" type="string" required="true">
	
	<cfscript>
		// Local reference to View 
		this.view = 0;
		
		// Mapping of Notification names to Command Class references
		this.commandMap = {};

		// Message Constants
		this.SINGLETON_MSG = "Controller Singleton already constructed!";
	</cfscript>
	
	<cffunction name="getInstance" displayname="getInstance" access="public" returntype="org.puremvc.cf.interfaces.IController" output="true">
		<cfscript>
			if ( NOT StructKeyExists(this, "controllerInstance" ) )
			{
				this.controllerInstance = CreateObject("Component", "org.puremvc.cf.core.controller.Controller");
				this.controllerInstance.initializeController();
			}
			return this.controllerInstance;
		</cfscript>
	</cffunction>
	
	<cffunction name="initializeController" displayname="initializeController" access="public" returntype="void">
		<cfscript>
			this.view = application.facadeInstance.view;
		</cfscript>
	</cffunction>
	
	<cffunction name="registerCommand" returntype="void" access="public" output="true">
		<cfargument name="notificationName" type="string" required="true">
		<cfargument name="commandClassRef" type="string" required="true">
		<cfscript>
			var observer = CreateObject("component", "org.puremvc.cf.patterns.observer.Observer").init("executeCommand", this);
			this.commandMap[ arguments.notificationName ] = arguments.commandClassRef;
			this.view.registerObserver( arguments.notificationName, observer );
		</cfscript>
	</cffunction>
	
	<cffunction name="executeCommand" returntype="void" access="public" output="true">
		<cfargument name="notification" type="org.puremvc.cf.interfaces.INotification" required="true">
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
	
	<cffunction name="removeCommand" returntype="void" access="public" output="true">
		<cfargument name="notificationName" type="string" required="true">
		<cfscript>
			StructDelete(this.commandMap, arguments.notificationName, false);
		</cfscript>
	</cffunction>
	
	<cffunction name="applyNotifyMethod" returntype="void" access="public" output="true">
		<cfargument name="notification" type="org.puremvc.cf.interfaces.INotification" required="true">
		<cfscript>
			this.executeCommand(arguments.notification);
		</cfscript>
	</cffunction>
	
</cfcomponent>