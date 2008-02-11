<!---
 PureMVC ColdFusion Port by Michael Oddis <michael.oddis@puremvc.org>
 PureMVC - Copyright(c) 2006, 2008 Futurescale, Inc., Some rights reserved.
 Your reuse is governed by the Creative Commons Attribution 3.0 License
--->
<cfinterface name="IFactoryObject" displayName="IFactoryObject">
	
	<cffunction name="getObject" access="public" returntype="org.puremvc.cf.interfaces.IFactoryObject" output="true" hint="I get a factory object">
		<cfargument name="objectName" required="true" type="string" />
	</cffunction>
	
</cfinterface>