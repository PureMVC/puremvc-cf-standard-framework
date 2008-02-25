<!---
 PureMVC ColdFusion Port by Michael Oddis <michael.oddis@puremvc.org>
 PureMVC - Copyright(c) 2006, 2008 Futurescale, Inc., Some rights reserved.
 Your reuse is governed by the Creative Commons Attribution 3.0 License

 The interface definition for IViewComponent.

 Since the view in an HTML/ColdFusion application has no concept of a view object,
 we must create a ViewHelper CFC in PureMVC_CF which implement IViewComponent and acts
 as our view object. A ViewHelper in PureMVC_CF is registered with a Mediator.

 In PureMVC_CF implementors assume these responsibilities:

 - Provides methods for setting and getting the view components ID
 - Provides methods for setting and getting the view components name.
 - Provides methods for setting and getting the application facade.
 - Provides methods for registering and retrieving a Mediator. 

--->
<cfinterface displayname="IViewComponent">
	
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
	
	<cffunction name="setFacade" access="public" returntype="void">
		<cfargument name="facade" type="org.puremvc.cf.interfaces.IFacade" required="true">
	</cffunction>
	
	<cffunction name="getFacade" access="public" returntype="org.puremvc.cf.patterns.facade.Facade">
	</cffunction>
	
	<cffunction name="registerMediator" returntype="void" access="public" output="true">
		<cfargument name="mediator" type="org.puremvc.cf.interfaces.IMediator" required="true">
	</cffunction>
	
	<cffunction name="retrieveMediator" returntype="org.puremvc.cf.interfaces.IMediator" access="public" output="true">
		<cfargument name="mediatorName" type="string" required="true">
	</cffunction>
	
</cfinterface>