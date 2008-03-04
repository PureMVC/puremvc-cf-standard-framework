<!---
******************************************************************************
 PureMVC ColdFusion Port by Michael Oddis <michael.oddis@puremvc.org>
 PureMVC - Copyright(c) 2006, 2008 Futurescale, Inc., Some rights reserved.
 Your reuse is governed by the Creative Commons Attribution 3.0 License
******************************************************************************

 The interface definition for IViewHelper.

 Since the view in an HTML/ColdFusion application has no concept of a view object,
 we must create a ViewHelper CFC in PureMVC_CF which extends IView and acts
 as our view object. A ViewHelper in PureMVC_CF is registered with a Mediator.

 In PureMVC_CF implementors assume these responsibilities:

 - Provides methods for setting and getting the view components ID
 - Provides methods for setting and getting the view name.
 - Provides methods for setting and getting the application facade.
 - Provides methods for registering and retrieving a Mediator.

--->
<cfinterface displayname="IViewHelper" 
			 extends="IViewComponent" 
			 hint="The interface definition for IViewHelper. Since the view in an HTML/ColdFusion application has no concept of a view object, we must create a ViewHelper CFC in PureMVC_CF which extends IView and acts as our view object. A ViewHelper in PureMVC_CF is registered with a Mediator.">
			 	
	<cffunction name="setFacade" access="public" returntype="void" hint="Sets a reference to the facade instance with the view helper.">
		<cfargument name="facade" type="org.puremvc.cf.interfaces.IFacade" required="true" hint="A facade instance.">
	</cffunction>
	
	<cffunction name="getFacade" access="public" returntype="org.puremvc.cf.interfaces.IFacade" hint="Gets the facade instance on the view helper.">
	</cffunction>
	
	<cffunction name="applyNotifyMethod" returntype="void" access="public" output="true" hint="Executes the notifyMethod of an IObserver when a notification is sent from Proxies.">
		<cfargument name="notification" type="org.puremvc.cf.interfaces.INotification" required="true">
	</cffunction>
	
</cfinterface>