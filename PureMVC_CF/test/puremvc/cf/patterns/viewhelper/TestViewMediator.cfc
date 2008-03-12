<!---
***************************************************************************
 PureMVC ColdFusion Port by Michael Oddis <michael.oddis@puremvc.org>
 PureMVC - Copyright(c) 2006, 2008 Futurescale, Inc., Some rights reserved.
 Your reuse is governed by the Creative Commons Attribution 3.0 License
***************************************************************************
--->
<cfcomponent displayname="TestViewMediator"
			 extends="org.puremvc.cf.patterns.mediator.Mediator" 
			 output="true">

	<cfscript>
		variables.mediatorName = 'TestViewMediator';
	</cfscript>

	<cffunction name="init" returntype="org.puremvc.cf.interfaces.IMediator" access="public" output="true">
		<cfargument name="mediatorName" type="string" required="false" hint="The name of the mediator" default="">
		<cfargument name="viewComponent" type="org.puremvc.cf.interfaces.IViewComponent" required="false" hint="An instance of IViewComponent">
		<cfscript>
			if (isDefined("arguments.viewComponent"))
			{
				super.init(arguments.mediatorName,arguments.viewComponent);
			} else {
				super.init(arguments.mediatorName);
			}
			return this;
		</cfscript>
	</cffunction>
	
	<cffunction name="listNotificationInterests" returntype="array" access="public" output="true">
		<cfscript>
			// be sure that the mediator has some Observers created
			// in order to test removeMediator
			var interests = ArrayNew(1);
			interests[1] = "ABC";
			interests[2] = "DEF";
			interests[3] = "GHI";
			return interests;
		</cfscript>
	</cffunction>
	
	<cffunction name="handleNotification" returntype="void" access="public" output="true">
		<cfargument name="notification" type="org.puremvc.cf.interfaces.INotification" required="true">
		<!--- <cfdump var="#arguments.notification.getBody()#" label="In handleNotification() of TestViewMediator">
		<cfdump var="#this.getViewComponent()#" label="handleNotification() 1"> --->
		<cfscript>
			if ( arguments.notification.getName() EQ "ABC")
			{
				this.getViewComponent().updateView(arguments.notification.getBody());
			}
		</cfscript>
		<!--- <cfdump var="#this.getViewComponent()#" label="handleNotification() 2"> --->
	</cffunction>
	
</cfcomponent>