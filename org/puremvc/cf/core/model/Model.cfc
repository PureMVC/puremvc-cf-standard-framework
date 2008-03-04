<!---
******************************************************************************
 PureMVC ColdFusion Port by Michael Oddis <michael.oddis@puremvc.org>
 PureMVC - Copyright(c) 2006, 2008 Futurescale, Inc., Some rights reserved.
 Your reuse is governed by the Creative Commons Attribution 3.0 License
******************************************************************************
--->
<cfcomponent displayname="Model" 
			 implements="org.puremvc.cf.interfaces.IModel"
			 output="true" 
			 hint="A Singleton IModel implementation. In PureMVC, the Model class provides access to model objects (Proxies) by named lookup. The Model assumes these responsibilities. Maintain a cache of IProxy instances. Provide methods for registering, retrieving, and removing IProxy instances. Your application must register IProxy instances with the Model. Typically, you use an ICommand to create and register IProxy instances once the Facade has initialized the Core actors.">
	
	<cfproperty name="proxyMap" type="struct" required="true" hint="Holds a collection of proxy objects.">
	<cfproperty name="modelInstance" type="org.puremvc.cf.interfaces.IModel" required="true" hint="The instance of the Model.">
	
	<cfscript>
		this.proxyMap = StructNew();
	</cfscript>
	
	<cffunction name="getInstance" displayname="getInstance" access="public" output="true" returntype="org.puremvc.cf.interfaces.IModel"
				hint="Model Singleton Factory method. Returns the Singleton instance.">
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
				hint="Initialize the Singleton Model instance. Called automatically by the constructor.">
		<cfscript>
		</cfscript>
	</cffunction>
	
	<cffunction name="registerProxy" returntype="void" access="public" output="true" hint="Register an IProxy instance with the Model.">
		<cfargument name="proxy" type="org.puremvc.cf.interfaces.IProxy" required="true" hint="An object reference to be held by the Model.">
		<cfscript>
			this.proxyMap[ arguments.proxy.getProxyName() ] = arguments.proxy;
		</cfscript>
	</cffunction>
	
	<cffunction name="retrieveProxy" returntype="org.puremvc.cf.interfaces.IProxy" access="public" output="true" hint="Retrieve an IProxy from the Model.">
		<cfargument name="proxyName" type="string" required="true" hint="A name of a proxy.">
		<cfscript>
			return this.proxyMap[ arguments.proxyName ];
		</cfscript>
	</cffunction>
	
	<cffunction name="removeProxy" returntype="any" access="public" output="true" hint="Remove an IProxy from the Model.">
		<cfargument name="proxyName" type="string" required="true" hint="A name of a proxy.">
		<cfscript>
			var proxy = 0;
			if (this.hasProxy(arguments.proxyName)) 
			{ 
				proxy = this.retrieveProxy(arguments.proxyName);
				StructDelete(this.proxyMap, arguments.proxyName, true);
				return proxy;
			}
			return proxy;
		</cfscript>
	</cffunction>
	
	<cffunction name="hasProxy" returntype="boolean" access="public" output="true" hint="Check if a Proxy is registered. Return whether a Proxy is currently registered with the given proxyName.">
		<cfargument name="proxyName" type="string" required="true" hint="The IProxy to remove from the Model.">
		<cfscript>
			return StructKeyExists(this.proxyMap,arguments.proxyName);
		</cfscript>
	</cffunction>
	
</cfcomponent>