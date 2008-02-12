<!---
 PureMVC ColdFusion Port by Michael Oddis <michael.oddis@puremvc.org>
 PureMVC - Copyright(c) 2006, 2008 Futurescale, Inc., Some rights reserved.
 Your reuse is governed by the Creative Commons Attribution 3.0 License
--->
<cfcomponent displayname="Facade" output="true" implements="org.puremvc.cf.interfaces.IFacade">
	
	<cfproperty name="model" type="org.puremvc.cf.interfaces.model.IModel" default="0" required="true">
	<cfproperty name="view" type="org.puremvc.cf.interfaces.view.IView" default="0" required="true">
	<cfproperty name="controller" type="org.puremvc.cf.interfaces.controller.IController" default="0" required="true">
	<cfproperty name="SINGLETON_MSG" type="string" default="Facade Singleton already constructed!" required="true">
	<cfproperty name="facadeInstance" type="org.puremvc.cf.interfaces.IFacade" required="true">
	<cfproperty name="factoryMap" type="struct" required="false">
	
	<cfscript>
		// Private references to Model, View and Controller
		this.model = 0;
		this.controller = 0;
		this.view = 0;
		
		// Holds factories
		this.factoryMap = {};
		
		// Message Constants
		this.SINGLETON_MSG = "Facade Singleton already constructed!";
	</cfscript>
	
	<cffunction name="getInstance" displayname="getInstance" access="public" output="true" returntype="org.puremvc.cf.interfaces.IFacade">
		<cfscript>
			if ( NOT StructKeyExists(application,"facadeInstance") )
			{
				application.facadeInstance = CreateObject("Component", "org.puremvc.cf.patterns.facade.Facade");
				application.facadeInstance.initializeFacade();
			}
			return application.facadeInstance;
		</cfscript>
	</cffunction>
	
	<cffunction name="initializeFacade" displayname="initializeFacade" access="public" returntype="void">
		<cfscript>
			this.initializeFactory();
			this.initializeModel();
			this.initializeView();
			this.initializeController();
		</cfscript>
	</cffunction>
	
	<cffunction name="initializeModel" returntype="void" access="public" output="true">
		<cfscript>
			if (this.model EQ 0)
			{
				this.model = CreateObject("component","org.puremvc.cf.core.model.Model").getInstance();
			}
		</cfscript>
	</cffunction>
	
	<cffunction name="initializeController" returntype="void" access="public" output="true">
		<cfscript>
			if (this.controller EQ 0)
			{
				this.controller = CreateObject("component","org.puremvc.cf.core.controller.Controller").getInstance();
			}
		</cfscript>
	</cffunction>
	
	<cffunction name="initializeView" returntype="void" access="public" output="true">
		<cfscript>
			if (this.view EQ 0)
			{
				this.view = CreateObject("component","org.puremvc.cf.core.view.View").getInstance();
			}
		</cfscript>
	</cffunction>
	
	<cffunction name="initializeFactory" returntype="void" access="public" output="true">
		<cfscript>
		</cfscript>
	</cffunction>
	
	<cffunction name="getModel" returntype="org.puremvc.cf.core.model.IModel" access="public" output="true">
		<cfscript>
			return this.model;
		</cfscript>
	</cffunction>
	
	<cffunction name="getView" returntype="org.puremvc.cf.core.view.IView" access="public" output="true">
		<cfscript>
			return this.view;
		</cfscript>
	</cffunction>
	
	<cffunction name="getController" returntype="org.puremvc.cf.core.controller.IController" access="public" output="true">
		<cfscript>
			return this.controller;
		</cfscript>
	</cffunction>
	
	<cffunction name="registerProxy" returntype="void" access="public" output="true">
		<cfargument name="proxy" type="org.puremvc.cf.interfaces.IProxy" required="true">
		<cfscript>
			this.model.registerProxy( arguments.proxy );
		</cfscript>
	</cffunction>
	
	<cffunction name="retrieveProxy" returntype="org.puremvc.cf.interfaces.IProxy" access="public" output="true">
		<cfargument name="proxyName" type="string" required="true">
		<cfscript>
			return this.model.retrieveProxy( arguments.proxyName );
		</cfscript>
	</cffunction>
	
	<cffunction name="removeProxy" returntype="void" access="public" output="true">
		<cfargument name="proxyName" type="string" required="true">
		<cfscript>
			if ( IsObject(this.model) ) { this.model.removeProxy( arguments.proxyName ); }
		</cfscript>
	</cffunction>
	
	<cffunction name="registerCommand" returntype="void" access="public" output="true">
		<cfargument name="notificationName" type="string" required="true">
		<cfargument name="commandClassRef" type="string" required="true">
		<cfscript>
			this.controller.registerCommand( arguments.notificationName, arguments.commandClassRef );
		</cfscript>
	</cffunction>
	
	<cffunction name="notifyObservers" returntype="void" access="public" output="true">
		<cfargument name="notification" type="org.puremvc.cf.interfaces.INotification" required="true">
		<cfscript>
			if ( IsObject(this.view) ) { this.view.notifyObservers( arguments.notification ); }
		</cfscript>
	</cffunction>
	
	<cffunction name="registerMediator" returntype="void" access="public" output="true">
		<cfargument name="mediator" type="org.puremvc.cf.interfaces.IMediator" required="true">
		<cfscript>
			if ( IsObject(this.view) ) this.view.registerMediator( arguments.mediator );
		</cfscript>
	</cffunction>
	
	<cffunction name="retrieveMediator" returntype="org.puremvc.cf.interfaces.IMediator" access="public" output="true">
		<cfargument name="mediatorName" type="string" required="true">
		<cfscript>
			return this.view.retrieveMediator( arguments.mediatorName );
		</cfscript>
	</cffunction>
	
	<cffunction name="removeMediator" returntype="void" access="public" output="true">
		<cfargument name="mediatorName" type="string" required="true">
		<cfscript>
			if ( IsObject(this.view) ) { this.view.removeMediator( arguments.mediatorName ); }
		</cfscript>
	</cffunction>
	
	<cffunction name="retrieveFactory" returntype="org.puremvc.cf.interfaces.IFactory" access="public" output="true">
		<cfargument name="factoryName" type="string" required="true">
		<cfscript>
		</cfscript>
	</cffunction>
	
	<cffunction name="registerFactory" returntype="void" access="public" output="true">
		<cfargument name="factory" type="org.puremvc.cf.interfaces.IFactory" required="true">
		<cfscript>
		</cfscript>
	</cffunction>

</cfcomponent>