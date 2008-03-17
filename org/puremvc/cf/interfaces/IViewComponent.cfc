<!---
******************************************************************************
 PureMVC ColdFusion Port by Michael Oddis <michael.oddis@puremvc.org>
 PureMVC - Copyright(c) 2006, 2008 Futurescale, Inc., Some rights reserved.
 Your reuse is governed by the Creative Commons Attribution 3.0 License
******************************************************************************

 The interface definition for IViewComponent.
 
 In PureMVC for ColdFusion, a Mediator takes a viewComponent as an argument and Mediates requests on behalf of the 
 viewComponent. 

 In PureMVC for ColdFusion implementors assume these responsibilities:

 - Provides methods for setting and getting the view components ID
 - Provides methods for setting and getting the view components name. 

--->
<cfinterface displayname="IViewComponent" hint="The interface definition for IViewComponent.">
	
	<cffunction name="setId" access="public" returntype="void" output="false" hint="Sets the id of the view componemt.">
		<cfargument name="id" type="string" required="true" hint="The id of the view component">
	</cffunction>
	
	<cffunction name="getId" access="public" returntype="string" output="false" hint="Gets the id of the view component.">
	</cffunction>
	
	<cffunction name="setComponentName" access="public" returntype="void" output="false" hint="Sets the name of the view component">
		<cfargument name="componentName" type="string" required="true" hint="The name of the view component">
	</cffunction>
	
	<cffunction name="getComponentName" access="public" returntype="string" output="false" hint="Gets the name of the view component.">
	</cffunction>
	
</cfinterface>