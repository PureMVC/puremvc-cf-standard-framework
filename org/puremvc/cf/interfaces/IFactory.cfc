<!---
 PureMVC ColdFusion Port by Michael Oddis <michael.oddis@puremvc.org>
 PureMVC - Copyright(c) 2006, 2008 Futurescale, Inc., Some rights reserved.
 Your reuse is governed by the Creative Commons Attribution 3.0 License
--->
<cfinterface name="IFactory" displayName="IFactory">
			
	<cffunction name="getObject" access="public" returntype="org.puremvc.cf.interfaces.IFactoryObject" output="true" hint="I get an object">
		<cfargument name="objectName" required="true" type="string" />
	</cffunction>
	
	<cffunction name="factoryMethod" access="public" displayname="factoryMethod" hint="" returntype="org.puremvc.cf.interfaces.IFactoryObject" output="true">
		<cfargument name="objectName" required="true" type="string">
	</cffunction>
	
</cfinterface>