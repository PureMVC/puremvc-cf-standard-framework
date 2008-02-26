<!---
******************************************************************************
 PureMVC ColdFusion Port by Michael Oddis <michael.oddis@puremvc.org>
 PureMVC - Copyright(c) 2006, 2008 Futurescale, Inc., Some rights reserved.
 Your reuse is governed by the Creative Commons Attribution 3.0 License
******************************************************************************

 A Singleton IModel implementation.
 
 In PureMVC, the Model class provides
 access to model objects (Proxies) by named lookup. 
 
 The Model assumes these responsibilities:

 - Maintain a cache of IProxy instances.
 - Provide methods for registering, retrieving, and removing IProxy instances.

 Your application must register IProxy instances with the Model. 
 Typically, you use an ICommand to create and register IProxy 
 instances once the Facade has initialized the Core actors.

 See org.puremvc.patterns.proxy.Proxy Proxy
 See org.puremvc.interfaces.IProxy IProxy
******************************************************************************
--->
<cfcomponent displayname="Model" 
			 implements="org.puremvc.cf.interfaces.IModel"
			 output="true" 
			 hint="A Singleton <code>IModel</code> implementation.">
	
	<cfproperty name="proxyMap" type="struct" required="true" hint="Holds a collection of proxy objects.">
	<cfproperty name="modelInstance" type="org.puremvc.cf.interfaces.IModel" required="true" hint="The instance of the Model.">
	
	<cfscript>
		this.proxyMap = StructNew();
	</cfscript>
	
	<cffunction name="getInstance" displayname="getInstance" access="public" output="true" returntype="org.puremvc.cf.interfaces.IModel"
				hint="<code>Model</code> Singleton Factory method. Returns the Singleton instance.">
		<cfscript>
			if ( NOT StructKeyExists(this, "modelInstance") )
			{
				this.modelInstance = CreateObject("Component", "org.puremvc.cf.core.model.Model");
				this.modelInstance.initializeModel();
			}
			return this.modelInstance;
		</cfscript>
	</cffunction>
	
	<cffunction name="initializeModel" displayname="initializeModel" access="public" returntype="void" 
				hint="Initialize the Singleton <code>Model</code> instance. Called automatically by the constructor.">
		<cfscript>
		</cfscript>
	</cffunction>
	
	<cffunction name="registerProxy" returntype="void" access="public" output="true" hint="Register an <code>IProxy</code> instance with the <code>Model</code>.">
		<cfargument name="proxy" type="org.puremvc.cf.interfaces.IProxy" required="true" hint="An object reference to be held by the <code>Model</code>.">
		<cfscript>
			this.proxyMap[ arguments.proxy.getProxyName() ] = arguments.proxy;
		</cfscript>
	</cffunction>
	
	<cffunction name="retrieveProxy" returntype="org.puremvc.cf.interfaces.IProxy" access="public" output="true" hint="Retrieve an <code>IProxy</code> from the <code>Model</code>.">
		<cfargument name="proxyName" type="string" required="true" hint="A name of a proxy.">
		<cfscript>
			return this.proxyMap[ arguments.proxyName ];
		</cfscript>
	</cffunction>
	
	<cffunction name="removeProxy" returntype="void" access="public" output="true" hint="Remove an <code>IProxy</code> from the <code>Model</code>.">
		<cfargument name="proxyName" type="string" required="true" hint="A name of a proxy.">
		<cfscript>
			StructDelete(this.proxyMap, arguments.proxyName, false);
		</cfscript>
	</cffunction>
	
</cfcomponent>