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
			
			this.handlePostBack();
		</cfscript>
	</cffunction>
	
	<cffunction name="handlePostBack" access="public" returntype="void">
		<cfscript>
			var user = {};
			if (IsDefined("FORM.userName") AND IsDefined("FORM.userPassword"))
			{
				user.firstName = FORM.userName;
				user.lastName = FORM.userPassword;
				
				variables.oNotification.init("onLogin", user);
				oFacade.notifyObservers(oNotification);
			}
		</cfscript>
	</cffunction>
	
	<cffunction name="doSayHello" returntype="string" access="public" output="true">
		<cfscript>
			return "Hello World! in AppViewHelper()";
		</cfscript>
	</cffunction>

</cfcomponent>