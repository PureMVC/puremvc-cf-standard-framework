<cfcomponent displayname="AppViewHelper" output="true" extends="org.puremvc.cf.core.view.ViewHelper">
	
	<cffunction name="init" access="public" returntype="org.puremvc.cf.interfaces.IViewHelper" output="true">
		<cfscript>
			super.init();
			return this;
		</cfscript>
	</cffunction>
	
	<cffunction name="initializeViewHelper" access="public" returntype="void" output="true">
		<cfscript>
			super.initializeViewHelper();
			this.handlePostBack();
		</cfscript>
	</cffunction>
	
	<cffunction name="handlePostBack" access="public" returntype="void" output="true">
		<cfscript>
			var user = {};
			if (IsDefined("FORM.userName") AND IsDefined("FORM.userPassword"))
			{
				user.firstName = FORM.userName;
				user.lastName = FORM.userPassword;
				
				variables.oNotification.init("onLogin", user);
				oFacade.notifyObservers(oNotification);
				
				variables.isPostBack = true;
			}
		</cfscript>
	</cffunction>
	
	<cffunction name="doSayHello" returntype="string" access="public" output="true">
		<cfscript>
			return "Hello World! in LoginViewHelper()";
		</cfscript>
	</cffunction>

</cfcomponent>