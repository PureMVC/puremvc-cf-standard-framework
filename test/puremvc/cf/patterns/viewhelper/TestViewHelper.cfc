<!---
 PureMVC ColdFusion Port by Michael Oddis <michael.oddis@puremvc.org>
 PureMVC - Copyright(c) 2006, 2008 Futurescale, Inc., Some rights reserved.
 Your reuse is governed by the Creative Commons Attribution 3.0 License
--->
<cfcomponent displayname="TestViewHelper" 
			 extends="org.puremvc.cf.patterns.viewHelper.ViewHelper"
			 output="false" >
	
	<cfscript>
		this.testValue = 0;
	</cfscript>
	
	<cffunction name="init" access="public" returntype="org.puremvc.cf.interfaces.IViewHelper">
		<cfscript>
			super.init();
			return this;
		</cfscript>
	</cffunction>
	
	<cffunction name="initializeViewHelper" access="public" returntype="void" output="false">
		<cfscript>
			super.initializeViewHelper();
		</cfscript>
	</cffunction>
	
	<cffunction name="updateView" returntype="void" access="public" output="false">
		<cfargument name="viewData" type="any" required="false">
		<cfscript>
			this.testValue = arguments.viewData + 5;
		</cfscript>
	</cffunction>
	
</cfcomponent>