<!---
 PureMVC ColdFusion Port by Michael Oddis <michael.oddis@puremvc.org>
 PureMVC - Copyright(c) 2006, 2008 Futurescale, Inc., Some rights reserved.
 Your reuse is governed by the Creative Commons Attribution 3.0 License
--->
<cfcomponent extends="org.puremvc.cf.patterns.observer.Notifier"
			 implements="org.puremvc.cf.interfaces.IProxy"
			 output="true">
			 
	<cfproperty name="proxyName" type="string" default="Proxy" required="true">
	<cfproperty name="data" type="any" default="0" required="true">

	<cfscript>
		variables.data = 0;
		variables.proxyName = "Proxy";
	</cfscript>
	
	<cffunction name="init" returntype="void" access="public" output="true">
		<cfargument name="proxyName" type="string" required="false">
		<cfargument name="data" type="any" required="false">
		<cfscript>
			if ( IsDefined("arguments.proxyName") ) { this.setProxyName(arguments.ProxyName); }
			if ( IsDefined("arguments.data") ) { this.setData(arguments.data); }
		</cfscript>
	</cffunction>
	
	<cffunction name="setProxyName" returntype="void" access="public" output="true">
		<cfargument name="proxyName" type="string" required="true">
		<cfscript>
			variables.proxyName = arguments.proxyName;
		</cfscript>
	</cffunction>
	
	<cffunction name="getProxyName" returntype="string" access="public" output="true">
		<cfscript>
			return variables.proxyName;
		</cfscript>
	</cffunction>
	
	<cffunction name="setData" returntype="any" access="public" output="true">
		<cfargument name="data" type="any" required="true">
		<cfscript>
			variables.data = arguments.data;
		</cfscript>
	</cffunction>
	
	<cffunction name="getData" returntype="any" access="public" output="true">
		<cfscript>
			return variables.data;
		</cfscript>
	</cffunction>
	
</cfcomponent>