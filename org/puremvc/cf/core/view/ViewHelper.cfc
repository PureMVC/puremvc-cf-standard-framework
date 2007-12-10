<cfcomponent displayname="ViewHelper" output="true" implements="org.puremvc.cf.interfaces.IViewHelper">
	
	<cfproperty name="oFacade" type="org.puremvc.cf.patterns.facade.Facade" required="true">
	<cfproperty name="oNotification" type="org.puremvc.cf.patterns.observer.Notification" required="true">
	
	<cfscript>
		variables.oFacade = 0;
		variables.oNotification = 0;
		variables.isPostBack = false;
	</cfscript>
	
	<cffunction name="init" access="public" returntype="void">
		<cfscript>
			this.initializeViewHelper();
		</cfscript>
	</cffunction>
	
	<cffunction name="initializeViewHelper" access="public" returntype="void">
		<cfscript>
			variables.oFacade = application.facadeInstance;
			variables.oNotification = CreateObject("component", "org.puremvc.cf.patterns.observer.Notification");
		</cfscript>
	</cffunction>
	
	<cffunction name="setFacade" access="public" returntype="void">
		<cfargument name="facade" type="org.puremvc.cf.interfaces.IFacade" required="true">
		<cfscript>
			variables.oFacade = arguments.facade;
		</cfscript>
	</cffunction>
	
	<cffunction name="getFacade" access="public" returntype="org.puremvc.cf.patterns.facade.Facade">
		<cfscript>
			return variables.oFacade;
		</cfscript>
	</cffunction>
	
	<cffunction name="getNotification" access="public" returntype="org.puremvc.cf.patterns.observer.Notification">
		<cfscript>
			return variables.oNotification;
		</cfscript>
	</cffunction>
	
	<cffunction name="hasFormBeenPosted" access="public" returntype="boolean">
		<cfscript>
			return variables.isPostBack;
		</cfscript>
	</cffunction>
	
	<cffunction name="handlePostBack" access="public" returntype="void" output="true">
		<cfscript>
		</cfscript>
	</cffunction>
	
</cfcomponent>