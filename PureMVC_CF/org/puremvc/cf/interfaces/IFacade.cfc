<!---
 ******************************************************************************
 PureMVC ColdFusion Port by Michael Oddis <michael.oddis@puremvc.org>
 PureMVC - Copyright(c) 2006, 2008 Futurescale, Inc., Some rights reserved.
 Your reuse is governed by the Creative Commons Attribution 3.0 License
******************************************************************************
The interface definition for a PureMVC Facade.

The Facade Pattern suggests providing a single class to act as a central point of communication for a subsystem.

In PureMVC, the Facade acts as an interface between the core MVC actors (Model, View, Controller) and the rest of your application.

--->
<cfinterface displayname="IFacade"
			 extends="INotifier" 
			 hint="The interface definition for a PureMVC Facade. The Facade Pattern suggests providing a single class to act as a central point of communication for a subsystem. In PureMVC, the Facade acts as an interface between the core MVC actors (Model, View, Controller) and the rest of your application.">
	
	<cffunction name="notifyObservers" returntype="void" access="public" output="true" hint="Notify Observers of an INotification.">
		<cfargument name="notification" type="org.puremvc.cf.interfaces.INotification" required="true" hint="The INotification to have the View notify observers.">
	</cffunction>
	
	<cffunction name="registerProxy" returntype="void" access="public" output="true" hint="Register an IProxy with the Model by name.">
		<cfargument name="proxy" type="org.puremvc.cf.interfaces.IProxy" required="true" hint="The IProxy to be registered with the Model.">
	</cffunction>
	
	<cffunction name="retrieveProxy" returntype="org.puremvc.cf.interfaces.IProxy" access="public" output="true" hint="Retrieve a IProxy from the Model by name.">
		<cfargument name="proxyName" type="string" required="true" hint="The name of the IProxy instance to be retrieved.">
	</cffunction>
	
	<cffunction name="removeProxy" returntype="void" access="public" output="true" hint="Remove an IProxy instance from the Model by name.">
		<cfargument name="proxyName" type="string" required="true" hint="The IProxy to remove from the Model.">
	</cffunction>
	
	<cffunction name="hasProxy" returntype="boolean" access="public" output="true" hint="Check if a Proxy is registered. Return whether a Proxy is currently registered with the given proxyName.">
		<cfargument name="proxyName" type="string" required="true" hint="The IProxy to remove from the Model.">
	</cffunction>
	
	<cffunction name="registerCommand" returntype="void" access="public" output="true" hint="Register an ICommand with the Controller.">
		<cfargument name="notificationName" type="string" required="true" hint="The name of the INotification to associate with the ICommand.">
		<cfargument name="commandClassRef" type="string" required="true" hint="A reference to the Class of the ICommand.">
	</cffunction>
	
	<cffunction name="removeCommand" returntype="void" access="public" output="true" hint="Remove a previously registered ICommand to INotification mapping from the Controller.">
		<cfargument name="notificationName" type="string" required="true" hint="The name of the INotification to remove the ICommand mapping for.">
	</cffunction>
	
	<cffunction name="hasCommand" returntype="boolean" access="public" output="true" hint="Check if a Command is registered for a given Notification.">
		<cfargument name="notificationName" type="string" required="true" hint="The INotification name.">
	</cffunction>
	
	<cffunction name="registerMediator" returntype="void" access="public" output="true" hint="Register an IMediator instance with the View.">
		<cfargument name="mediator" type="org.puremvc.cf.interfaces.IMediator" required="true" hint="A reference to the IMediator instance.">
	</cffunction>
	
	<cffunction name="retrieveMediator" returntype="org.puremvc.cf.interfaces.IMediator" access="public" output="true" hint="Retrieve an IMediator instance from the View.">
		<cfargument name="mediatorName" type="string" required="true" hint="the name of the IMediator instance to retrieve">
	</cffunction>
	
	<cffunction name="removeMediator" returntype="any" access="public" output="true" hint="Remove a IMediator instance from the View.">
		<cfargument name="mediatorName" type="string" required="true" hint="Name of the IMediator instance to be removed.">
	</cffunction>
	
	<cffunction name="hasMediator" displayname="hasMediator" returntype="boolean" access="public" output="true" hint="Check if a Mediator is registered or not">
		<cfargument name="mediatorName" type="string" required="true" hint="The name of the IMediator instance to retrieve.">
	</cffunction>
	
	<cffunction name="retrieveFactory" returntype="any" access="public" output="true" hint="Retrieve an IFactory from the Facade.">
		<cfargument name="factoryName" type="string" required="true" hint="The name of the IFactory instance.">
	</cffunction>
	
	<cffunction name="registerFactory" returntype="void" access="public" output="true" hint="Register an IFactory instance with the Facade.">
		<cfargument name="factoryName" type="string" required="true" hint="The name of the IFactory instance used as key if Factory Map.">
		<cfargument name="factory" type="any" required="true" hint="The IFactory instance to register with the Factory Map.">
	</cffunction>
	
</cfinterface>