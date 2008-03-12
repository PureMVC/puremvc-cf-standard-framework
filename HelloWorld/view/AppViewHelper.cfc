<cfcomponent displayname="AppViewHelper" 
			 output="true" 
			 extends="org.puremvc.cf.patterns.viewhelper.ViewHelper">
	
	<cfscript>
		variables.id = "AppViewHelper";
		variables.componentName = "AppViewHelper";
	</cfscript>
	
	<cffunction name="init" access="public" returntype="org.puremvc.cf.interfaces.IViewHelper">
		<cfscript>
			super.init();
			return this;
		</cfscript>
	</cffunction>
	
	<cffunction name="initializeViewHelper" access="public" returntype="void" output="true">
		<cfscript>
			super.initializeViewHelper();
			this.sendNotification("STARTUP", this);
			this.handlePostBack();
		</cfscript>
	</cffunction>
	
	<cffunction name="handlePostBack" access="public" returntype="void" output="true">
		<cfscript>
			if (IsDefined("FORM.btnSubmit"))
			{
				this.sendNotification("HELLO_WORLD");
			}
		</cfscript>
	</cffunction>
	
	<cffunction name="updateView" returntype="void" access="public" output="true">
		<cfscript>
			WriteOutput("Hello! Welcome to PureMVC for ColdFusion<br>");
		</cfscript>
	</cffunction>

</cfcomponent>