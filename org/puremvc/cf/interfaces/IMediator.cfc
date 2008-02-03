<!---
 PureMVC ColdFusion Port by Michael Oddis <michael.oddis@puremvc.org>
 PureMVC - Copyright(c) 2006, 2008 Futurescale, Inc., Some rights reserved.
 Your reuse is governed by the Creative Commons Attribution 3.0 License
--->
<cfinterface displayname="IMediator">
	
	<cffunction name="getMediatorName" returntype="string" access="public" output="true">
	</cffunction>
	
	<cffunction name="getViewComponent" returntype="org.puremvc.cf.interfaces.IViewComponent" access="public" output="true">
	</cffunction>
	
	<cffunction name="listNotificationInterests" returntype="array" access="public" output="true">
	</cffunction>
	
	<cffunction name="handleNotification" returntype="void" access="public" output="true">
		<cfargument name="notification" type="org.puremvc.cf.interfaces.INotification" required="true">
	</cffunction>
	
</cfinterface>