<!---
******************************************************************************
 PureMVC ColdFusion Port by Michael Oddis <michael.oddis@puremvc.org>
 PureMVC - Copyright(c) 2006, 2008 Futurescale, Inc., Some rights reserved.
 Your reuse is governed by the Creative Commons Attribution 3.0 License
******************************************************************************
	In PureMVC, IProxy implementors assume these responsibilities:

	Implement a common method which returns the name of the Proxy.
	Provide methods for setting and getting the data object.
	
	Additionally, IProxys typically:
	
	-Maintain references to one or more pieces of model data.
	-Provide methods for manipulating that data.
	-Generate INotifications when their model data changes.
	-Expose their name as a public static const called NAME, if they are not instantiated multiple times.
	-Encapsulate interaction with local or remote services used to fetch and persist model data.

******************************************************************************
--->
<cfinterface displayname="IProxy" 
			 hint="The interface definition for a PureMVC Proxy.">
	
	<cffunction name="setProxyName" returntype="void" access="public" output="false" hint="Sets the name of the proxy.">
		<cfargument name="proxyName" type="string" required="true" hint="The name of the proxy.">
	</cffunction>
	
	<cffunction name="getProxyName" returntype="string" access="public" output="false" hint="The name of the proxy.">
	</cffunction>
	
	<cffunction name="setData" returntype="any" access="public" output="false" hint="Set the data object">
		<cfargument name="data" type="any" required="true" hint="The data object.">
	</cffunction>
	
	<cffunction name="getData" returntype="any" access="public" output="false" hint="Get the data object">
	</cffunction>

</cfinterface>