<!---
 PureMVC ColdFusion Port by Michael Oddis <michael.oddis@puremvc.org>
 PureMVC - Copyright(c) 2006, 2007 Futurescale, Inc., Some rights reserved.
 Your reuse is governed by the Creative Commons Attribution 3.0 License
--->
<cfcomponent output="true" 
			 extends="org.puremvc.cf.patterns.observer.Notifier" 
			 implements="org.puremvc.cf.interfaces.IMediator,org.puremvc.cf.interfaces.INotifier">
	
	<cfproperty name="NAME" type="string" required="true">
	<cfproperty name="viewComponent" type="org.puremvc.cf.interfaces.IViewHelper" required="true">
	
	<cfscript>
		this.NAME = 'Mediator';
		
		// The view component
		variables.viewComponent = 0;
	</cfscript>
	
	<cffunction name="init" returntype="void" access="public" output="true">
		<cfargument name="viewComponent" type="org.puremvc.cf.interfaces.IViewHelper" required="false" default="0">
		<cfscript>
			variables.viewComponent = arguments.viewComponent;
		</cfscript>
	</cffunction>
	
	<cffunction name="getMediatorName" returntype="string" access="public" output="true">
		<cfscript>
			return this.NAME;
		</cfscript>
	</cffunction>
	
	<cffunction name="getViewComponent" returntype="org.puremvc.cf.interfaces.IViewHelper" access="public" output="true">
		<cfscript>
			return variables.viewComponent;
		</cfscript>
	</cffunction>
	
	<cffunction name="listNotificationInterests" returntype="array" access="public" output="true">
		<cfscript>
			return ArrayNew(1);
		</cfscript>
	</cffunction>
	
	<cffunction name="handleNotification" returntype="void" access="public" output="true">
		<cfargument name="notification" type="org.puremvc.cf.interfaces.INotification" required="true">
		<cfscript>
		</cfscript>
	</cffunction>
	
</cfcomponent>