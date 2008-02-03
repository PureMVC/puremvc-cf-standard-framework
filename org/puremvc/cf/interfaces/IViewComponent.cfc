<!---
 PureMVC ColdFusion Port by Michael Oddis <michael.oddis@puremvc.org>
 PureMVC - Copyright(c) 2006, 2008 Futurescale, Inc., Some rights reserved.
 Your reuse is governed by the Creative Commons Attribution 3.0 License
--->
<cfinterface name="IViewComponent" displayname="IViewComponent">
	
	<cffunction name="setId" access="public" returntype="void" output="true">
		<cfargument name="componentId" type="string" required="true" hint="The id of the View Component">
	</cffunction>
	
	<cffunction name="getId" access="public" returntype="string" output="true">
	</cffunction>
	
	<cffunction name="setComponentName" access="public" returntype="void" output="true">
		<cfargument name="componentName" type="string" required="true" hint="The name of the View Component">
	</cffunction>
	
	<cffunction name="getComponentName" access="public" returntype="string" output="true">
	</cffunction>
	
</cfinterface>