<!---
 ******************************************************************************
 PureMVC ColdFusion Port by Michael Oddis <michael.oddis@puremvc.org>
 PureMVC - Copyright(c) 2006, 2008 Futurescale, Inc., Some rights reserved.
 Your reuse is governed by the Creative Commons Attribution 3.0 License
******************************************************************************

 A base Singleton <code>IFacade implementation.
 
 In PureMVC, the <code>Facade class assumes these responsibilities:

 * Initializing the Model, View and Controller Singletons. 
 * Providing all the methods defined by the IModel, IView, & IController interfaces.
 * Providing the ability to override the specific Model, View and Controller Singletons created. 
 * Providing a single point of contact to the application for registering Commands and notifying Observers
 
 Example usage:

 <cfcomponent extends="org.puremvc.cf.patterns.facade.Facade" 
			 implements="org.puremvc.cf.interfaces.IFacade" 
			 output="false">
	
	<!--- Override Singleton Factory method --->
	<cffunction name="getInstance" displayname="getInstance" access="public" output="false" returntype="any">
		<cfscript>
			if ( NOT StructKeyExists(application,"facadeInstance") )
			{
				application.facadeInstance = CreateObject("component", "HelloWorld.AppFacade");
				application.facadeInstance.initializeFacade();
			}
			return application.facadeInstance;
		</cfscript>
	</cffunction>
	
	<!--- Optional initialization hook for Facade --->
	<cffunction name="initializeFacade" displayname="initializeFacade" access="public" returntype="void" output="false">
		<cfscript>
			// Always call the super class initilizeFacade()
			super.initializeFacade()
		</cfscript>
	</cffunction>
	
	<!--- Optional initialization hook for Model --->
	<cffunction name="initializeModel" displayname="initializeModel" access="public" returntype="void" output="false">
		<cfscript>
			// Always call the super class initilizeFacade()
			super.initializeFacade()
		</cfscript>
	</cffunction>
	
	<!--- Optional initialization hook for Controller --->
	<cffunction name="initializeController" displayName="initializeController" returntype="void" access="public" output="false">
		<cfscript>
			// Always call the super class initializeController()
			super.initializeController();
			//Register commands.
			this.registerCommand("STARTUP", "HelloWorld.controller.ApplicationStartupCommand");
			this.registerCommand("HELLO_WORLD", "HelloWorld.controller.HelloWorldCommand");
		</cfscript>
	</cffunction>

 </cfcomponent>
--->
<cfcomponent displayname="Facade" 
			 implements="org.puremvc.cf.interfaces.IFacade"
			 output="true"
			 Hint="A base Singleton IFacade implementation.">
	
	<cfproperty name="model" type="org.puremvc.cf.interfaces.model.IModel" default="0" required="true">
	<cfproperty name="view" type="org.puremvc.cf.interfaces.view.IView" default="0" required="true">
	<cfproperty name="controller" type="org.puremvc.cf.interfaces.controller.IController" default="0" required="true">
	<cfproperty name="facadeInstance" type="org.puremvc.cf.interfaces.IFacade" required="true">
	<cfproperty name="factoryMap" type="struct" required="false">
	
	<cfscript>
		// Private references to Model, View and Controller
		this.model = 0;
		this.controller = 0;
		this.view = 0;
		
		// Holds factories
		this.factoryMap = {};
	</cfscript>
	
	<cffunction name="getInstance" displayname="getInstance" access="public" output="true" returntype="org.puremvc.cf.interfaces.IFacade" hint="Facade Singleton Factory method. Returns an instance of the Facade.">
		<cfscript>
			if ( NOT StructKeyExists(application,"facadeInstance") )
			{
				application.facadeInstance = CreateObject("Component", "org.puremvc.cf.patterns.facade.Facade");
				application.facadeInstance.initializeFacade();
			}
			return application.facadeInstance;
		</cfscript>
	</cffunction>
	
	<cffunction name="initializeFacade" displayname="initializeFacade" access="public" returntype="void" hint="Initialize the Singleton Facade instance. Called automatically by the constructor. Override in your subclass to do any subclass specific initializations. Be sure to call super.initializeFacade(), though.">
		<cfscript>
			this.initializeModel();
			this.initializeView();
			this.initializeController();
		</cfscript>
	</cffunction>
	
	<!--- 
	****************************************************************************************
	Called by the initializeFacade method.
	
	Override this method in your subclass of Facade if one or both of the following are true:
	
	- You wish to initialize a different IModel.
	- You have Proxys to register with the Model that do not retrieve a reference to the Facade at construction time. 
	
	If you don't want to initialize a different IModel, call super.initializeModel() at the beginning of your method, then register Proxys.
	
	Note: This method is rarely overridden; in practice you are more likely to use a Command to create and register Proxys with the Model, 
	since Proxys with mutable data will likely need to send INotifications and thus will likely want to fetch a reference to the Facade 
	during their construction.
	--->
	<cffunction name="initializeModel" returntype="void" access="public" output="true" hint="Initialize the Model.">
		<cfscript>
			if (this.model EQ 0)
			{
				this.model = CreateObject("component","org.puremvc.cf.core.model.Model").getInstance();
			}
		</cfscript>
	</cffunction>
	
	<!---
	****************************************************************************************
	 Called by the initializeFacade method.
	 
	 Override this method in your subclass of Facade if one or both of the following are true:
	 
	 - You wish to initialize a different IController.
	 - You have Commands to register with the Controller at startup.
	 - If you don't want to initialize a different IController, call super.initializeController() at the beginning of your method, then register Commands.
	****************************************************************************************
	--->
	<cffunction name="initializeController" returntype="void" access="public" output="true" hint="Initialize the Controller.">
		<cfscript>
			if (this.controller EQ 0)
			{
				this.controller = CreateObject("component","org.puremvc.cf.core.controller.Controller").getInstance();
			}
		</cfscript>
	</cffunction>
	
	<!---
	**************************************************************************************** 
	Called by the initializeFacade method.
	
	Override this method in your subclass of Facade if one or both of the following are true:
	
	- You wish to initialize a different IView.
	- You have Observers to register with the View
	- If you don't want to initialize a different IView, call super.initializeView() at the beginning of your method, then register IMediator instances.
	
	Note: This method is rarely overridden; in practice you are more likely to use a Command to create and register Mediators with the View, since 
	IMediator instances will need to send INotifications and thus will likely want to fetch a reference to the Facade during their construction. 
	****************************************************************************************
	--->
	<cffunction name="initializeView" returntype="void" access="public" output="true" hint="Initialize the View. Called by the initializeFacade method.">
		<cfscript>
			if (this.view EQ 0)
			{
				this.view = CreateObject("component","org.puremvc.cf.core.view.View").getInstance();
			}
		</cfscript>
	</cffunction>
	
	<cffunction name="initializeFactory" returntype="void" access="public" output="true" hint="An Abstact method which should not be called directly. Override this method in your subclass of Facade if you wish to incorporate an Object Factory into the framework. ">
		<cfthrow type="Custom" message="Abstract method: must be overridden in a subclass" />
	</cffunction>
	
	<cffunction name="registerProxy" returntype="void" access="public" output="true" hint="Register an IProxy with the Model by name.">
		<cfargument name="proxy" type="org.puremvc.cf.interfaces.IProxy" required="true" hint="The IProxy to be registered with the Model.">
		<cfscript>
			this.model.registerProxy( arguments.proxy );
		</cfscript>
	</cffunction>
	
	<cffunction name="retrieveProxy" returntype="org.puremvc.cf.interfaces.IProxy" access="public" output="true" hint="Retrieve a IProxy from the Model by name.">
		<cfargument name="proxyName" type="string" required="true" hint="The name of the IProxy instance to be retrieved.">
		<cfscript>
			return this.model.retrieveProxy( arguments.proxyName );
		</cfscript>
	</cffunction>
	
	<cffunction name="removeProxy" returntype="void" access="public" output="true" hint="Remove an IProxy instance from the Model by name.">
		<cfargument name="proxyName" type="string" required="true" hint="The IProxy to remove from the Model.">
		<cfscript>
			if ( IsObject(this.model) && this.hasProxy(arguments.proxyName) ) { this.model.removeProxy( arguments.proxyName ); }
		</cfscript>
	</cffunction>
	
	<cffunction name="hasProxy" returntype="boolean" access="public" output="true" hint="Check if a Proxy is registered. Return whether a Proxy is currently registered with the given proxyName.">
		<cfargument name="proxyName" type="string" required="true" hint="The IProxy to remove from the Model.">
		<cfscript>
			return model.hasProxy(arguments.proxyName);
		</cfscript>
	</cffunction>
	
	<cffunction name="registerCommand" returntype="void" access="public" output="true" hint="Register an ICommand with the Controller.">
		<cfargument name="notificationName" type="string" required="true" hint="The name of the INotification to associate with the ICommand.">
		<cfargument name="commandClassRef" type="string" required="true" hint="A reference to the Class of the ICommand.">
		<cfscript>
			this.controller.registerCommand( arguments.notificationName, arguments.commandClassRef );
		</cfscript>
	</cffunction>
	
	<cffunction name="removeCommand" returntype="void" access="public" output="true" hint="Remove a previously registered ICommand to INotification mapping from the Controller.">
		<cfargument name="notificationName" type="string" required="true" hint="The name of the INotification to remove the ICommand mapping for.">
		<cfscript>
			this.controller.removeCommand(arguments.notificationName);
		</cfscript>
	</cffunction>
	
	<cffunction name="hasCommand" returntype="boolean" access="public" output="true" hint="Check if a Command is registered for a given Notification.">
		<cfargument name="notificationName" type="string" required="true" hint="The INotification name.">
		<cfscript>
			return this.model.hasCommand(arguments.notificationName);
		</cfscript>
	</cffunction>
	
	<cffunction name="registerMediator" returntype="void" access="public" output="true" hint="Register an IMediator instance with the View.">
		<cfargument name="mediator" type="org.puremvc.cf.interfaces.IMediator" required="true" hint="A reference to the IMediator instance.">
		<cfscript>
			if ( IsObject(this.view) ) this.view.registerMediator( arguments.mediator );
		</cfscript>
	</cffunction>
	
	<cffunction name="retrieveMediator" returntype="org.puremvc.cf.interfaces.IMediator" access="public" output="true" hint="Retrieve an IMediator instance from the View.">
		<cfargument name="mediatorName" type="string" required="true" hint="the name of the IMediator instance to retrieve">
		<cfscript>
			return this.view.retrieveMediator( arguments.mediatorName );
		</cfscript>
	</cffunction>
	
	<cffunction name="removeMediator" returntype="any" access="public" output="true" hint="Remove a IMediator instance from the View.">
		<cfargument name="mediatorName" type="string" required="true" hint="Name of the IMediator instance to be removed.">
		<cfscript>
			var mediator = 0;
			if ( IsObject(this.view) ) { mediator = this.view.removeMediator( arguments.mediatorName ); }
			return mediator;
		</cfscript>
	</cffunction>
	
	<cffunction name="hasMediator" displayname="hasMediator" returntype="boolean" access="public" output="true" hint="Check if a Mediator is registered or not">
		<cfargument name="mediatorName" type="string" required="true" hint="The name of the IMediator instance to retrieve.">
		<cfscript>
			this.view.hasMediator(arguments.mediatorName);
		</cfscript>
	</cffunction>
	
	<cffunction name="retrieveFactory" returntype="any" access="public" output="true" hint="Retrieve an IFactory from the Facade.">
		<cfargument name="factoryName" type="string" required="true" hint="The name of the IFactory instance.">
		<cfthrow type="Custom" message="Abstract method: must be overridden in a subclass" />
	</cffunction>
	
	<cffunction name="registerFactory" returntype="void" access="public" output="true" hint="Register an IFactory instance with the Facade.">
		<cfargument name="factoryName" type="string" required="true" hint="The name of the IFactory instance used as key if Factory Map.">
		<cfargument name="factory" type="any" required="true" hint="The IFactory instance to register with the Factory Map.">
		<cfthrow type="Custom" message="Abstract method: must be overridden in a subclass" />
	</cffunction>
	
	<cffunction name="sendNotification" returntype="void" access="public" output="true" hint="Sends a notification which Observers will act upon.">
		<cfargument name="notificationName" type="string" required="true">
		<cfargument name="notificationBody" type="any" default="0" required="false">
		<cfargument name="notificationType" type="string" default="" required="false">
		<cfscript>
			var notification = CreateObject("component","org.puremvc.cf.patterns.observer.Notification");			
			notification.init(arguments.notificationName, arguments.notificationBody, arguments.notificationType);
			this.notifyObservers(notification);
		</cfscript>
	</cffunction>
	
	<cffunction name="notifyObservers" returntype="void" access="public" output="true" hint="Notify Observers of an INotification.">
		<cfargument name="notification" type="org.puremvc.cf.interfaces.INotification" required="true" hint="The INotification to have the View notify observers.">
		<cfscript>
			if ( IsObject(this.view) ) { this.view.notifyObservers( arguments.notification ); }
		</cfscript>
	</cffunction>
	
	<!--- Accessors --->
	
	<cffunction name="getModel" returntype="org.puremvc.cf.core.model.IModel" access="public" output="true" hint="Get an IModel instance of the Facade.">
		<cfscript>
			return this.model;
		</cfscript>
	</cffunction>
	
	<cffunction name="getView" returntype="org.puremvc.cf.core.view.IView" access="public" output="true" hint="Get an IView instance of the Facade.">
		<cfscript>
			return this.view;
		</cfscript>
	</cffunction>
	
	<cffunction name="getController" returntype="org.puremvc.cf.core.controller.IController" access="public" output="true" hint="Get a IController instance of the Facade.">
		<cfscript>
			return this.controller;
		</cfscript>
	</cffunction>

</cfcomponent>