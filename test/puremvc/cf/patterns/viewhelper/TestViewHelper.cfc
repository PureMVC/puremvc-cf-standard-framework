<!---
 PureMVC ColdFusion Port by Michael Oddis <michael.oddis@puremvc.org>
 PureMVC - Copyright(c) 2006, 2008 Futurescale, Inc., Some rights reserved.
 Your reuse is governed by the Creative Commons Attribution 3.0 License
--->
<cfcomponent displayname="TestViewHelper" 
			 extends="org.puremvc.cf.patterns.viewHelper.ViewHelper"
			 output="true" >
	
	<cfscript>
		this.testValue = 0;
	</cfscript>
	
	<cffunction name="init" access="public" returntype="org.puremvc.cf.interfaces.IViewHelper">
		<cfscript>
			super.init();
			return this;
		</cfscript>
	</cffunction>
	
	<cffunction name="initializeViewHelper" access="public" returntype="void">
		<cfscript>
			super.initializeViewHelper();
		</cfscript>
	</cffunction>
	
	<cffunction name="updateView" returntype="void" access="public" output="true">
		<cfargument name="viewData" type="any" required="false">
		<cfdump var="#arguments.viewData#" label="In updateView() of TestViewHelper">
		<cfscript>
			this.testValue = arguments.viewData + 5;
		</cfscript>
	</cffunction>
	
</cfcomponent>