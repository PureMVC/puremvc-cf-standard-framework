<cfcomponent displayname="AppViewHelper" output="true" extends="org.puremvc.cf.core.view.ViewHelper">
	
	<cffunction name="init" access="public" returntype="org.puremvc.cf.interfaces.IViewHelper">
		<cfscript>
			super.init();
			return this;
		</cfscript>
	</cffunction>
	
	<cffunction name="initializeViewHelper" access="public" returntype="void">
		<cfscript>
			super.initializeViewHelper();
			
			variables.oNotification.init("STARTUP", this);
			oFacade.notifyObservers(oNotification);
			
			variables.oNotification.init("onSayHello");
			oFacade.notifyObservers(oNotification);
		</cfscript>
	</cffunction>
	
	<cffunction name="doSayHello" returntype="string" access="public" output="true">
		<cfscript>
			return "Hello World! in AppViewHelper()";
		</cfscript>
	</cffunction>

</cfcomponent>