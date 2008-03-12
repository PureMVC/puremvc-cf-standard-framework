<!---
 PureMVC ColdFusion Port by Michael Oddis <michael.oddis@puremvc.org>
 PureMVC - Copyright(c) 2006, 2008 Futurescale, Inc., Some rights reserved.
 Your reuse is governed by the Creative Commons Attribution 3.0 License
--->
<cfcomponent extends="org.puremvc.cf.patterns.command.SimpleCommand" implements="org.puremvc.cf.interfaces.ICommand" output="false">
	
	<cffunction name="execute" returntype="void" access="public" output="true">
		<cfargument name="notification" type="org.puremvc.cf.interfaces.INotification" required="true">
		<cfscript>
			var appMediator = CreateObject("component", "HelloWorldAjax.view.AppMediator");
			appMediator.init( "AppMediator", notification.getBody() );
			this.getFacade().registerMediator( appMediator );
		</cfscript>
	</cffunction>
	
</cfcomponent>