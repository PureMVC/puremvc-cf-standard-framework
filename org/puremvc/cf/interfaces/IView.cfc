<!---
 PureMVC ColdFusion Port by Michael Oddis <michael.oddis@puremvc.org>
 PureMVC - Copyright(c) 2006, 2007 Futurescale, Inc., Some rights reserved.
 Your reuse is governed by the Creative Commons Attribution 3.0 License
--->
<cfinterface name="IView" displayname="IView">

	<cffunction name="registerObserver" displayname="registerObserver" returntype="void" access="public" output="true">
		<cfargument name="notificationName" type="string" required="true">
		<cfargument name="observer" type="org.puremvc.cf.interfaces.IObserver" required="true">
	</cffunction>
	
	<cffunction name="notifyObservers" displayname="notifyObservers" returntype="void" access="public" output="true">
		<cfargument name="notification" type="org.puremvc.cf.interfaces.INotification" required="true">
	</cffunction>
	
	<cffunction name="registerMediator" displayname="registerMediator" returntype="void" access="public" output="true">
		<cfargument name="mediator" type="org.puremvc.cf.interfaces.IMediator" required="true">
	</cffunction>
	
	<cffunction name="retrieveMediator" displayname="retrieveMediator" returntype="org.puremvc.cf.interfaces.IMediator" access="public" output="true">
		<cfargument name="mediatorName" type="string" required="true">
	</cffunction>
	
	<cffunction name="removeMediator" displayname="removeMediator" returntype="void" access="public" output="true">
		<cfargument name="mediatorName" type="string" required="true">
	</cffunction>

</cfinterface>