<cfcomponent displayname="AppViewHelper" 
			 output="true" 
			 extends="org.puremvc.cf.patterns.viewhelper.ViewHelper">
	
	<cfscript>
		variables.id = "AppViewHelper";
		variables.componentName = "AppViewHelper";
	</cfscript>
	
	<cffunction name="init" access="public" returntype="LoginApp.view.AppViewHelper">
		<cfscript>
			super.init();
			return this;
		</cfscript>
	</cffunction>
	
	<cffunction name="initializeViewHelper" access="public" returntype="void" output="true">
		<cfscript>
			super.initializeViewHelper();
			this.sendNotification("STARTUP", this);
		</cfscript>
	</cffunction>
	
	<cffunction name="updateView" returntype="void" access="public" output="true">
		<cfargument name="user" type="any" required="true">
		<cfscript>
			WriteOutput("In AppViewHelper.updateView()<br>");
		</cfscript>
	</cffunction>

</cfcomponent>