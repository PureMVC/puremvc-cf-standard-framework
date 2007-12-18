<!---
 PureMVC ColdFusion Port by Michael Oddis <michael.oddis@puremvc.org>
 PureMVC - Copyright(c) 2006, 2007 Futurescale, Inc., Some rights reserved.
 Your reuse is governed by the Creative Commons Attribution 3.0 License
--->
<cfinterface name="IViewHelper" displayname="IViewHelper">
	
	<cffunction name="handlePostBack" access="public" returntype="void" output="true">
	</cffunction>
	
	<!--- 
	<cffunction name="addEventListener" access="public" returntype="void" output="true">
		<cfargument name="eventName" type="string" required="true">
		<cfargument name="eventListener" type="any" required="true">
	</cffunction>
	
	<cffunction name="removeEventListener" returntype="void" access="public" output="true">
		<cfargument name="eventName" type="string" required="true">
	</cffunction> 
	--->
	
</cfinterface>