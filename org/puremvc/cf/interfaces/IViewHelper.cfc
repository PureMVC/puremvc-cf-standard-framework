<!---
******************************************************************************
 PureMVC ColdFusion Port by Michael Oddis <michael.oddis@puremvc.org>
 PureMVC - Copyright(c) 2006, 2008 Futurescale, Inc., Some rights reserved.
 Your reuse is governed by the Creative Commons Attribution 3.0 License
******************************************************************************

 The interface definition for IViewHelper.

 The interface definition for IViewHelper. In PureMVC, a Mediator takes a viewComponent as an arguments and 
 Mediates requests on behalf of the viewComponent.
 
 In ColdFusion, a view in most cases consists of an HTML page with ColdFusion tags, functions, ect and has no way to register 
 itself to PureMVC without some help. For each CF/HTML view we create a View Helper which extends IViewHelper to act as our 
 viewComponent. This is possible because IViewHelper extends IViewComponent which represents a viewComponent in
 PureMVC for ColdFusion.

 In PureMVC for ColdFusion implementors assume these responsibilities:

 - Provides methods for setting and getting the application facade.
 - Provides methods for registering and retrieving a Mediator.
 - Provides a method to apply a notification method on the view helper when registered
   as an Observer.
--->
<cfinterface displayname="IViewHelper" 
			 extends="IViewComponent" 
			 hint="The interface definition for IViewHelper. In PureMVC, a Mediator takes a viewComponent as an arguments and Mediates requests on behalf of the viewComponent.
			 	   In ColdFusion, a view in most cases consists of an HTML page with ColdFusion tags, functions, ect and has no way to register itself to PureMVC without some help.
			 	   For each CF/HTML view we create View Helpers which extend IViewHelper and IViewComponent to act as out viewComponent.">
			 	
	<cffunction name="setFacade" access="public" returntype="void" hint="Sets a reference to the facade instance with the view helper.">
		<cfargument name="facade" type="org.puremvc.cf.interfaces.IFacade" required="true" hint="A facade instance.">
	</cffunction>
	
	<cffunction name="getFacade" access="public" returntype="org.puremvc.cf.interfaces.IFacade" hint="Gets the facade instance on the view helper.">
	</cffunction>
	
	<cffunction name="applyNotifyMethod" returntype="void" access="public" output="true" hint="Executes the notifyMethod of an IObserver when a notification is sent from Proxies.">
		<cfargument name="notification" type="org.puremvc.cf.interfaces.INotification" required="true">
	</cffunction>
	
</cfinterface>