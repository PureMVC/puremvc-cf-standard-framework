<!---
******************************************************************************
 PureMVC ColdFusion Port by Michael Oddis <michael.oddis@puremvc.org>
 PureMVC - Copyright(c) 2006, 2008 Futurescale, Inc., Some rights reserved.
 Your reuse is governed by the Creative Commons Attribution 3.0 License
******************************************************************************

 The interface definition for a PureMVC Model.

 In PureMVC, IModel implementors provide
 access to IProxy objects by named lookup.
 
 An IModel assumes these responsibilities:

 - Maintain a cache of IProxy instances
 - Provide methods for registering, retrieving, and removing IProxy instances

--->
<cfinterface displayname="IModel" hint="The interface definition for IModel.">

	<cffunction name="registerProxy" returntype="void" access="public" output="true" hint="Register an <code>IProxy</code> instance with the <code>Model</code>.">
		<cfargument name="proxy" type="org.puremvc.cf.interfaces.IProxy" required="true" hint="An object reference to be held by the <code>Model</code>.">
	</cffunction>
	
	<cffunction name="retrieveProxy" returntype="org.puremvc.cf.interfaces.IProxy" access="public" output="true" hint="Retrieve an <code>IProxy</code> instance from the Model.">
		<cfargument name="proxyName" type="string" required="true" hint="A name of a proxy.">
	</cffunction>
	
	<cffunction name="removeProxy" returntype="any" access="public" output="true">
		<cfargument name="proxyName" type="string" required="true" hint="A name of a proxy.">
	</cffunction>
	
	<cffunction name="hasProxy" returntype="boolean" access="public" output="true" hint="Check if a Proxy is registered. Return whether a Proxy is currently registered with the given proxyName.">
		<cfargument name="proxyName" type="string" required="true" hint="The IProxy to remove from the Model.">
	</cffunction>
	
</cfinterface>