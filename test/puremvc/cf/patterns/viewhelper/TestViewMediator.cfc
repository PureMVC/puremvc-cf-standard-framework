<!---
 PureMVC ColdFusion Port by Michael Oddis <michael.oddis@puremvc.org>
 PureMVC - Copyright(c) 2006, 2008 Futurescale, Inc., Some rights reserved.
 Your reuse is governed by the Creative Commons Attribution 3.0 License
--->
<cfcomponent displayname="TestViewMediator" extends="org.puremvc.cf.patterns.mediator.Mediator" output="true">
	
	<cfproperty name="viewComponent" type="org.puremvc.cf.interfaces.IViewComponent" required="true">
	
	<cfscript>
		this.NAME = 'TestViewMediator';
	</cfscript>

	<cffunction name="init" returntype="org.puremvc.cf.interfaces.IMediator" access="public" output="true">
		<cfargument name="viewComponent" type="org.puremvc.cf.interfaces.IViewComponent" required="false" default="0">
		<cfscript>
			super.init(arguments.viewComponent);		
			return this;
		</cfscript>
	</cffunction>
	
	<cffunction name="getMediatorName" returntype="string" access="public" output="true">
		<cfscript>
			if ( IsDefined(GetMetaData(this).displayName) ) { return GetMetaData(this).displayName; } 
			return this.NAME;
		</cfscript>
	</cffunction>
	
	<cffunction name="getViewComponent" returntype="org.puremvc.cf.interfaces.IViewComponent" access="public" output="true">
		<cfscript>
			return variables.viewComponent;
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
		<cfscript>
			if ( arguments.notification.getName() EQ "ABC")
			{
				this.getViewComponent().updateView(arguments.notification.getBody());
			}
		</cfscript>
	</cffunction>
	
</cfcomponent>