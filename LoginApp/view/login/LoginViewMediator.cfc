<!---
 PureMVC ColdFusion Port by Michael Oddis <michael.oddis@puremvc.org>
 PureMVC - Copyright(c) 2006, 2008 Futurescale, Inc., Some rights reserved.
 Your reuse is governed by the Creative Commons Attribution 3.0 License
--->
<cfcomponent displayname="LoginViewMediator" 
			 extends="org.puremvc.cf.patterns.mediator.Mediator" 
			 output="true">
		
	<cfscript>
		variables.mediatorName = 'LoginViewMediator';
	</cfscript>

	<cffunction name="init" returntype="org.puremvc.cf.interfaces.IMediator" access="public" output="true">
		<cfargument name="mediatorName" type="string" required="true" hint="The name of the mediator" default="">
		<cfargument name="viewComponent" type="org.puremvc.cf.interfaces.IViewComponent" required="false" hint="An instance of IViewComponent">
		<cfscript>
			super.init(arguments.mediatorName,arguments.viewComponent);
			return this;
		</cfscript>
	</cffunction>
	
	<cffunction name="onLoginUser" returntype="void" access="public" output="true">
		<cfscript>
		</cfscript>
	</cffunction>
	
	<cffunction name="listNotificationInterests" returntype="array" access="public" output="true">
		<cfscript>
			var interests = ArrayNew(1);
			interests[1] = "USER_LOGIN_RESULT";
			interests[2] = "USER_LOGIN_QUERY_RESULT";
			return interests;
		</cfscript>
	</cffunction>
	
	<cffunction name="handleNotification" returntype="void" access="public" output="true">
		<cfargument name="notification" type="org.puremvc.cf.interfaces.INotification" required="true">
		<cfscript>
			if ( arguments.notification.getName() EQ "USER_LOGIN_RESULT")
			{
				this.getViewComponent().updateView(arguments.notification.getBody());
			} else if ( arguments.notification.getName() EQ "USER_LOGIN_QUERY_RESULT")
			{
				this.getViewComponent().updateViewAsQuery(arguments.notification.getBody());
			}
		</cfscript>
	</cffunction>
	
</cfcomponent>