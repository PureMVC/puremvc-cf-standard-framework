<!---
 PureMVC ColdFusion Port by Michael Oddis <michael.oddis@puremvc.org>
 PureMVC - Copyright(c) 2006, 2008 Futurescale, Inc., Some rights reserved.
 Your reuse is governed by the Creative Commons Attribution 3.0 License
--->
<cfinterface name="IViewHelper" 
			 displayname="IViewHelper" 
			 extends="org.puremvc.cf.interfaces.IViewComponent">
	
	<cffunction name="handlePostBack" access="public" returntype="void" output="true">
	</cffunction>
	
</cfinterface>