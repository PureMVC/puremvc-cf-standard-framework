<!---
******************************************************************************
 PureMVC ColdFusion Port by Michael Oddis <michael.oddis@puremvc.org>
 PureMVC - Copyright(c) 2006, 2008 Futurescale, Inc., Some rights reserved.
 Your reuse is governed by the Creative Commons Attribution 3.0 License
******************************************************************************

 The interface definition for IViewComponent.

 Since the view in an HTML/ColdFusion application has no concept of a view object,
 we must create a ViewHelper CFC in PureMVC_CF which implements IViewComponent and acts
 as our view object. A ViewHelper in PureMVC_CF is registered with a Mediator as a View Component.

 In PureMVC_CF implementors assume these responsibilities:

 - Provides methods for setting and getting the view components ID
 - Provides methods for setting and getting the view components name.
 - Provides methods for setting and getting the application facade.
 - Provides methods for registering and retrieving a Mediator. 

--->
<cfinterface displayname="IViewComponent" hint="The interface definition for IViewComponent.">
	
	<cffunction name="setId" access="public" returntype="void" output="true" hint="Sets the id of the view componemt.">
		<cfargument name="id" type="string" required="true" hint="The id of the view component">
	</cffunction>
	
	<cffunction name="getId" access="public" returntype="string" output="true" hint="Gets the id of the view component.">
	</cffunction>
	
	<cffunction name="setComponentName" access="public" returntype="void" output="true" hint="Sets the name of the view component">
		<cfargument name="componentName" type="string" required="true" hint="The name of the view component">
	</cffunction>
	
	<cffunction name="getComponentName" access="public" returntype="string" output="true" hint="Gets the name of the view component.">
	</cffunction>
	
</cfinterface>