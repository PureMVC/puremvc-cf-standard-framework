<!---
***************************************************************************
 PureMVC ColdFusion Port by Michael Oddis <michael.oddis@puremvc.org>
 PureMVC - Copyright(c) 2006, 2008 Futurescale, Inc., Some rights reserved.
 Your reuse is governed by the Creative Commons Attribution 3.0 License
***************************************************************************

 A Base IMediator implementation.
--->
<cfcomponent displayname="Mediator"  
			 extends="org.puremvc.cf.patterns.observer.Notifier" 
			 implements="org.puremvc.cf.interfaces.IMediator,org.puremvc.cf.interfaces.INotifier"
			 output="false"
			 hint="Base IMediator implementation.">

	<cfproperty name="mediatorName" type="string" required="true" hint="The name of the Mediator. Typically, a Mediator will be written to serve one specific control or group controls and so, will not have a need to be dynamically named.">
	<cfproperty name="viewComponent" type="org.puremvc.cf.interfaces.IViewComponent" required="true" hint="The View Componen. In many case a ViewHelper.">
	
	<cfscript>
		variables.mediatorName = "";
		variables.viewComponent = 0;
	</cfscript>
	
	<cffunction name="init" returntype="void" access="public" output="false" hint="Constructor">
		<cfargument name="mediatorName" type="string" required="false" hint="The name of the mediator" default="">
		<cfargument name="viewComponent" type="org.puremvc.cf.interfaces.IViewComponent" required="false" hint="An instance of IViewComponent">
		<cfscript>
			variables.mediatorName = IIF( arguments.mediatorName != "", DE(arguments.mediatorName), DE(GetMetaData(this).DISPLAYNAME) ); 
			if (isDefined("arguments.viewComponent")) { this.setViewComponent(arguments.viewComponent); }
		</cfscript>		
	</cffunction>
	
	<cffunction name="setMediatorName" returntype="void" access="public" output="false" hint="Sets the name of the Mediator">
		<cfargument name="mediatorName" type="string" required="true">
		<cfscript>
			variables.mediatorName = arguments.mediatorName; 
		</cfscript>
	</cffunction>
	
	<cffunction name="getMediatorName" returntype="string" access="public" output="false" hint="Gets the name of the Mediator">
		<cfscript>
			return variables.mediatorName;
		</cfscript>
	</cffunction>
	
	<cffunction name="setViewComponent" returntype="void" access="public" output="false" hint="Sets the View Component on the Mediator.">
		<cfargument name="viewComponent" type="org.puremvc.cf.interfaces.IViewComponent" required="true" hint="The name of the ViewComponent.">
		<cfscript>
			variables.viewComponent = arguments.viewComponent;
		</cfscript>
	</cffunction>
	
	<cffunction name="getViewComponent" returntype="org.puremvc.cf.interfaces.IViewComponent" access="public" output="false" hint="Gets the View Component for the Mediator.">
		<cfscript>
			return variables.viewComponent;
		</cfscript>
	</cffunction>
	
	<cffunction name="listNotificationInterests" returntype="array" access="public" output="false" hint="Gets an array of notification interests.">
		<cfscript>
			return ArrayNew(1);
		</cfscript>
	</cffunction>
	
	<cffunction name="handleNotification" returntype="void" access="public" output="false" hint="Handle INotifications. Typically this will be handled in a switch statement, with one 'case' entry per INotification the Mediator is interested in.">
		<cfargument name="notification" type="org.puremvc.cf.interfaces.INotification" required="true" hint="An INotification instance.">
		<cfscript>
		</cfscript>
	</cffunction>
	
	<cffunction name="applyNotifyMethod" returntype="void" access="public" output="false" hint="Runs the Observer handler of an IMediator when registered as an Observer.">
		<cfargument name="notification" type="org.puremvc.cf.interfaces.INotification" required="true" hint="An INotification instance.">
		<cfscript>
			this.handleNotification(arguments.notification);
		</cfscript>
	</cffunction>
	
	<cffunction name="onRegister" returntype="void" access="public" output="false" hint="Called by the View when the Mediator is registered ">
		<cfscript>
		</cfscript>
	</cffunction>
	
	<cffunction name="onRemove" returntype="void" access="public" output="false" hint="Called by the View when the Mediator is removed ">
		<cfscript>
		</cfscript>
	</cffunction>
	
</cfcomponent>