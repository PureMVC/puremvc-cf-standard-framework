<!---
 ******************************************************************************
 PureMVC ColdFusion Port by Michael Oddis <michael.oddis@puremvc.org>
 PureMVC - Copyright(c) 2006, 2008 Futurescale, Inc., Some rights reserved.
 Your reuse is governed by the Creative Commons Attribution 3.0 License
******************************************************************************
******************************************************************************
 * The interface definition for a PureMVC Facade.
 *
 * The Facade Pattern suggests providing a single
 * class to act as a central point of communication 
 * for a subsystem.
 * 
 * In PureMVC, the Facade acts as an interface between
 * the core MVC actors (Model, View, Controller) and
 * the rest of your application.
 * 
 * See org.puremvc.interfaces.IModel IModel
 * See org.puremvc.interfaces.IView IView
 * See org.puremvc.interfaces.IController IController
 * See org.puremvc.interfaces.ICommand ICommand
 * See org.puremvc.interfaces.INotification INotification
******************************************************************************
--->
<cfinterface displayname="IFacade" hint="The interface definition for a PureMVC Facade.">
	
	<cffunction name="notifyObservers" returntype="void" access="public" output="true" hint="Notify <code>Observer</code>s of an <code>INotification</code>.">
		<cfargument name="notification" type="org.puremvc.cf.interfaces.INotification" required="true" hint="The <code>INotification</code> to have the <code>View</code> notify observers.">
	</cffunction>
	
	<cffunction name="registerProxy" returntype="void" access="public" output="true" hint="Register an <code>IProxy</code> with the <code>Model</code> by name.">
		<cfargument name="proxy" type="org.puremvc.cf.interfaces.IProxy" required="true" hint="The <code>IProxy</code> to be registered with the <code>Model</code>.">
	</cffunction>
	
	<cffunction name="retrieveProxy" returntype="org.puremvc.cf.interfaces.IProxy" access="public" output="true" hint="Retrieve a <code>IProxy</code> from the <code>Model</code> by name.">
		<cfargument name="proxyName" type="string" required="true" hint="The name of the <code>IProxy</code> instance to be retrieved.">
	</cffunction>
	
	<cffunction name="removeProxy" returntype="void" access="public" output="true" hint="Remove an <code>IProxy</code> instance from the <code>Model</code> by name.">
		<cfargument name="proxyName" type="string" required="true" hint="The <code>IProxy</code> to remove from the <code>Model</code>.">
	</cffunction>
	
	<cffunction name="registerCommand" returntype="void" access="public" output="true" hint="Register an <code>ICommand</code> with the <code>Controller</code>.">
		<cfargument name="notificationName" type="string" required="true" hint="The name of the <code>INotification</code> to associate with the <code>ICommand</code>.">
		<cfargument name="commandClassRef" type="string" required="true" hint="A reference to the <code>Class</code> of the <code>ICommand</code>.">
	</cffunction>
	
	<cffunction name="registerMediator" returntype="void" access="public" output="true" hint="Register an <code>IMediator</code> instance with the <code>View</code>.">
		<cfargument name="mediator" type="org.puremvc.cf.interfaces.IMediator" required="true" hint="A reference to the <code>IMediator</code> instance.">
	</cffunction>
	
	<cffunction name="retrieveMediator" returntype="org.puremvc.cf.interfaces.IMediator" access="public" output="true" hint="Retrieve an <code>IMediator</code> instance from the <code>View</code>.">
		<cfargument name="mediatorName" type="string" required="true" hint="the name of the <code>IMediator</code> instance to retrieve">
	</cffunction>
	
	<cffunction name="removeMediator" returntype="void" access="public" output="true" hint="Remove a <code>IMediator</code> instance from the <code>View</code>.">
		<cfargument name="mediatorName" type="string" required="true" hint="Name of the <code>IMediator</code> instance to be removed.">
	</cffunction>
	
	<cffunction name="retrieveFactory" returntype="any" access="public" output="true" hint="Retrieve an <code>IFactory</code> from the <code>Facade</code>.">
		<cfargument name="factoryName" type="string" required="true" hint="The name of the <code>IFactory</code> instance.">
	</cffunction>
	
	<cffunction name="registerFactory" returntype="void" access="public" output="true" hint="Register an <code>IFactory</code> instance with the Facade.">
		<cfargument name="factoryName" type="string" required="true" hint="The name of the <code>IFactory</code> instance used as key if Factory Map.">
		<cfargument name="factory" type="any" required="true" hint="The <code>IFactory</code> instance to register with the Factory Map.">
	</cffunction>
	
</cfinterface>