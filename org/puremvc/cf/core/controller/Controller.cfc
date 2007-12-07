<!---
 PureMVC ColdFusion Port by Michael Oddis <michael.oddis@puremvc.org>
 PureMVC - Copyright(c) 2006, 2007 Futurescale, Inc., Some rights reserved.
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
			if ( NOT StructKeyExists(variables,"controllerInstance") )
			{
				variables.controllerInstance = CreateObject("Component", "org.puremvc.cf.core.controller.Controller");
				variables.controllerInstance.initializeController();
			}
			return variables.controllerInstance;
		</cfscript>
	</cffunction>
	
	<cffunction name="initializeController" displayname="initializeController" access="public" returntype="void">
		<cfscript>
			this.view = application.facadeInstance.view;
		</cfscript>
	</cffunction>
	
	<cffunction name="setView" displayname="setView" access="public" returntype="void">
		<cfargument name="view" type="org.puremvc.cf.interfaces.IView" required="true">
		<cfscript>
			this.view = arguments.view;
		</cfscript>
	</cffunction>
	
	<cffunction name="getView" displayname="getView" access="public" returntype="org.puremvc.cf.interfaces.IView">
		<cfscript>
			return this.view;
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
			var commandClassRef = application.facadeInstance.controller.commandMap[arguments.notification.getName()];
			var commandInstance = 0;
			if ( commandClassRef EQ "" ){ return; }
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
	
</cfcomponent>