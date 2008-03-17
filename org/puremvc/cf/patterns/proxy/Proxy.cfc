<!---
******************************************************************************
 PureMVC ColdFusion Port by Michael Oddis <michael.oddis@puremvc.org>
 PureMVC - Copyright(c) 2006, 2008 Futurescale, Inc., Some rights reserved.
 Your reuse is governed by the Creative Commons Attribution 3.0 License
******************************************************************************
 A base IProxy implementation. 

 In PureMVC, Proxy classes are used to manage parts of the application's data model. 
 
 A Proxy might simply manage a reference to a local data object, in which case interacting with it 
 might involve setting and getting of its data in synchronous fashion.
 
 Proxy classes are also used to encapsulate the application's interaction with remote services to save or 
 retrieve data, in which case, we adopt an asyncronous idiom; setting data (or calling a method) on the 
 Proxy and listening for a Notification to be sent when the Proxy has retrieved the data from the service. 

--->
<cfcomponent extends="org.puremvc.cf.patterns.observer.Notifier"
			 implements="org.puremvc.cf.interfaces.IProxy"
			 output="false"
			 hint="A base IProxy implementation. In PureMVC Framework for ColdFusion, Proxy classes are used to manage parts of the application's data model. ">
			 
	<cfproperty name="proxyName" type="string" default="Proxy" required="true" hint="The name of the proxy.">
	<cfproperty name="data" type="any" default="0" required="true" hint="The data Object">

	<cfscript>
		variables.data = 0;
		variables.proxyName = "Proxy";
	</cfscript>
	
	<cffunction name="init" returntype="void" access="public" output="false" hint="Contructor">
		<cfargument name="proxyName" type="string" required="false">
		<cfargument name="data" type="any" required="false">
		<cfscript>
			if ( IsDefined("arguments.proxyName") ) { this.setProxyName(arguments.ProxyName); }
			if ( IsDefined("arguments.data") ) { this.setData(arguments.data); }
		</cfscript>
	</cffunction>
	
	<cffunction name="setProxyName" returntype="void" access="public" output="false" hint="Sets the name of the proxy.">
		<cfargument name="proxyName" type="string" required="true" hint="The name of the proxy.">
		<cfscript>
			variables.proxyName = arguments.proxyName;
		</cfscript>
	</cffunction>
	
	<cffunction name="getProxyName" returntype="string" access="public" output="false" hint="Gets the name of the proxy.">
		<cfscript>
			return variables.proxyName;
		</cfscript>
	</cffunction>
	
	<cffunction name="setData" returntype="any" access="public" output="false" hint="Set the data object">
		<cfargument name="data" type="any" required="true" hint="The data object.">
		<cfscript>
			variables.data = arguments.data;
		</cfscript>
	</cffunction>
	
	<cffunction name="getData" returntype="any" access="public" output="false" hint="Get the data object">
		<cfscript>
			return variables.data;
		</cfscript>
	</cffunction>
	
</cfcomponent>