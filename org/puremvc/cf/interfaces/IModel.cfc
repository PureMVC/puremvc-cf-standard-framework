<!---
 PureMVC ColdFusion Port by Michael Oddis <michael.oddis@puremvc.org>
 PureMVC - Copyright(c) 2006, 2008 Futurescale, Inc., Some rights reserved.
 Your reuse is governed by the Creative Commons Attribution 3.0 License
--->
<cfinterface name="IModel" displayname="IModel">

	<cffunction name="registerProxy" returntype="void" access="public" output="true">
		<cfargument name="proxy" type="org.puremvc.cf.interfaces.IProxy" required="true">
	</cffunction>
	
	<cffunction name="retrieveProxy" returntype="org.puremvc.cf.interfaces.IProxy" access="public" output="true">
		<cfargument name="proxyName" type="string" required="true">
	</cffunction>
	
	<cffunction name="removeProxy" returntype="void" access="public" output="true">
		<cfargument name="proxyName" type="string" required="true">
	</cffunction>
	
</cfinterface>