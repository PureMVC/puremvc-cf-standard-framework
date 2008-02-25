<!---
******************************************************************************
 PureMVC ColdFusion Port by Michael Oddis <michael.oddis@puremvc.org>
 PureMVC - Copyright(c) 2006, 2008 Futurescale, Inc., Some rights reserved.
 Your reuse is governed by the Creative Commons Attribution 3.0 License
******************************************************************************
/**
 * The interface definition for a PureMVC Model.
 * 
 * <P>
 * In PureMVC, <code>IModel</code> implementors provide
 * access to <code>IProxy</code> objects by named lookup. </P>
 * 
 * <P>
 * An <code>IModel</code> assumes these responsibilities:</P>
 * 
 * <UL>
 * <LI>Maintain a cache of <code>IProxy</code> instances</LI>
 * <LI>Provide methods for registering, retrieving, and removing <code>IProxy</code> instances</LI>
 * </UL>
 */
--->
<cfinterface displayname="IModel">

	<cffunction name="registerProxy" returntype="void" access="public" output="true" hint="Register an <code>IProxy</code> instance with the <code>Model</code>.">
		<cfargument name="proxy" type="org.puremvc.cf.interfaces.IProxy" required="true" hint="An object reference to be held by the <code>Model</code>.">
	</cffunction>
	
	<cffunction name="retrieveProxy" returntype="org.puremvc.cf.interfaces.IProxy" access="public" output="true" hint="Retrieve an <code>IProxy</code> instance from the Model.">
		<cfargument name="proxyName" type="string" required="true" hint="A name of a proxy.">
	</cffunction>
	
	<cffunction name="removeProxy" returntype="void" access="public" output="true">
		<cfargument name="proxyName" type="string" required="true" hint="A name of a proxy.">
	</cffunction>
	
</cfinterface>