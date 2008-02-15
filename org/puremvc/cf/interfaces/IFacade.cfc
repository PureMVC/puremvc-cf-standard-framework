<!---
 PureMVC ColdFusion Port by Michael Oddis <michael.oddis@puremvc.org>
 PureMVC - Copyright(c) 2006, 2008 Futurescale, Inc., Some rights reserved.
 Your reuse is governed by the Creative Commons Attribution 3.0 License
--->
<cfinterface name="IFacade" displayname="IFacade">
	
	<cffunction name="registerProxy" returntype="void" access="public" output="true">
		<cfargument name="proxy" type="org.puremvc.cf.interfaces.IProxy" required="true">
	</cffunction>
	
	<cffunction name="retrieveProxy" returntype="org.puremvc.cf.interfaces.IProxy" access="public" output="true">
		<cfargument name="proxyName" type="string" required="true">
	</cffunction>
	
	<cffunction name="removeProxy" returntype="void" access="public" output="true">
		<cfargument name="proxyName" type="string" required="true">
	</cffunction>
	
	<cffunction name="registerCommand" returntype="void" access="public" output="true">
		<cfargument name="notificationName" type="string" required="true">
		<cfargument name="commandClassRef" type="string" required="true">
	</cffunction>
	
	<cffunction name="notifyObservers" returntype="void" access="public" output="true">
		<cfargument name="notification" type="org.puremvc.cf.interfaces.INotification" required="true">
	</cffunction>
	
	<cffunction name="registerMediator" returntype="void" access="public" output="true">
		<cfargument name="mediator" type="org.puremvc.cf.interfaces.IMediator" required="true">
	</cffunction>
	
	<cffunction name="retrieveMediator" returntype="org.puremvc.cf.interfaces.IMediator" access="public" output="true">
		<cfargument name="mediatorName" type="string" required="true">
	</cffunction>
	
	<cffunction name="removeMediator" returntype="void" access="public" output="true">
		<cfargument name="mediatorName" type="string" required="true">
	</cffunction>
	
	<cffunction name="retrieveFactory" returntype="any" access="public" output="true">
		<cfargument name="factoryName" type="string" required="true">
	</cffunction>
	
	<cffunction name="registerFactory" returntype="void" access="public" output="true">
		<cfargument name="factoryName" type="string" required="true">
		<cfargument name="factory" type="any" required="true">
	</cffunction>
	
</cfinterface>