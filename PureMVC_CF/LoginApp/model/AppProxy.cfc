<!---
 PureMVC ColdFusion Port by Michael Oddis <michael.oddis@puremvc.org>
 PureMVC - Copyright(c) 2006, 2008 Futurescale, Inc., Some rights reserved.
 Your reuse is governed by the Creative Commons Attribution 3.0 License
--->
<cfcomponent displayname="AppProxy" 
			 extends="org.puremvc.cf.patterns.proxy.Proxy" 
			 implements="org.puremvc.cf.interfaces.IProxy" output="true">
	
	<cfscript>
		variables.proxyName = "AppProxy";
	</cfscript>
	
	<cffunction name="init" returntype="org.puremvc.cf.interfaces.IProxy" access="public" output="false">
		<cfargument name="proxyName" type="string" required="false">
		<cfargument name="data" type="any" required="false">
		<cfscript>
			super.init();
			return this;
		</cfscript>
	</cffunction>
	
	<cffunction name="getEchoDelegate" returntype="LoginApp.model.common.EchoDelegate" access="public" output="true">
		<cfscript>
			return CreateObject("component","LoginApp.model.common.EchoDelegate").init();
		</cfscript>
	</cffunction>
	
</cfcomponent>