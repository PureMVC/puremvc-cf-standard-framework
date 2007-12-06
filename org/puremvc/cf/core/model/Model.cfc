<!---
 PureMVC ColdFusion Port by Michael Oddis <michael.oddis@puremvc.org>
 PureMVC - Copyright(c) 2006, 2007 Futurescale, Inc., Some rights reserved.
 Your reuse is governed by the Creative Commons Attribution 3.0 License
--->
<cfcomponent displayname="Model" output="true" implements="org.puremvc.cf.interfaces.IModel">
	
	<cfproperty name="proxyMap" type="struct" required="true">
	<cfproperty name="SINGLETON_MSG" type="string" required="true">
	<cfproperty name="modelInstance" type="org.puremvc.cf.interfaces.IModel" required="true">
	
	<cfscript>
		this.proxyMap = StructNew();
		this.SINGLETON_MSG = "Model Singleton already constructed!";
	</cfscript>
	
	<cffunction name="getInstance" displayname="getInstance" access="public" output="true" returntype="org.puremvc.cf.interfaces.IModel">
		<!--- <cftrace text="In getInstance() of Model"> --->
		<cfscript>
			if ( NOT StructKeyExists(variables,"modelInstance") )
			{
				variables.modelInstance = CreateObject("Component", "org.puremvc.cf.core.model.Model");
				variables.modelInstance.initializeModel();
			}
			return variables.modelInstance;
		</cfscript>
	</cffunction>
	
	<cffunction name="initializeModel" displayname="initializeModel" access="public" returntype="void">
		<cfscript>
		</cfscript>
	</cffunction>
	
	<cffunction name="registerProxy" returntype="void" access="public" output="true">
		<cfargument name="proxy" type="org.puremvc.cf.interfaces.IProxy" required="true">
		<cfscript>
			this.proxyMap[ arguments.proxy.getProxyName() ] = arguments.proxy;
		</cfscript>
	</cffunction>
	
	<cffunction name="retrieveProxy" returntype="org.puremvc.cf.interfaces.IProxy" access="public" output="true">
		<cfargument name="proxyName" type="string" required="true">
		<cfscript>
			return this.proxyMap[ arguments.proxyName ];
		</cfscript>
	</cffunction>
	
	<cffunction name="removeProxy" returntype="void" access="public" output="true">
		<cfargument name="proxyName" type="string" required="true">
		<cfscript>
			StructDelete(this.proxyMap, arguments.proxyName, false);
		</cfscript>
	</cffunction>
	
</cfcomponent>