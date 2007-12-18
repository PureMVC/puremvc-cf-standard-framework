<cfcomponent displayname="ViewHelper" 
			 output="true" 
			 implements="org.puremvc.cf.interfaces.IViewHelper,org.flairteam.interfaces.IFactoryObject">
	
	<cfproperty name="oFacade" type="org.puremvc.cf.patterns.facade.Facade" required="true">
	<cfproperty name="viewHelperMap" type="struct" required="true">
	<cfproperty name="oNotification" type="org.puremvc.cf.patterns.observer.Notification" required="true">
	
	<cfscript>
		this.id = "";
		this.listenerMap = {};
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
	
	<cffunction name="addEventListener" access="public" returntype="void" output="true">
		<cfargument name="eventName" type="string" required="true">
		<cfargument name="eventListener" type="any" required="true">
		<cfscript>
			StructInsert(this.listenerMap, arguments.eventName, arguments.eventListener, true);
		</cfscript>
		<cfdump var="#this.listenerMap#">
	</cffunction>
	
	<cffunction name="retrieveEventListener" displayname="retrieveEventListener" returntype="org.puremvc.cf.interfaces.IViewHelper" access="public" output="true">
		<cfargument name="eventName" type="string" required="true">
		<cfscript>
			return this.listenerMap[ arguments.eventName ];
		</cfscript>
	</cffunction>
	
	<cffunction name="removeEventListener" returntype="void" access="public" output="true">
		<cfargument name="eventName" type="string" required="true">
		<cfscript>
			StructDelete(this.listenerMap, arguments.eventName, false);
		</cfscript>
	</cffunction>
	
	<cffunction name="handlePostBack" access="public" returntype="void" output="true">
		<cfscript>
		</cfscript>
	</cffunction>
	
</cfcomponent>