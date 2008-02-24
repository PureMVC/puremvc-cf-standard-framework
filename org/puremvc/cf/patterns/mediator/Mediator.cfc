<!---
 PureMVC ColdFusion Port by Michael Oddis <michael.oddis@puremvc.org>
 PureMVC - Copyright(c) 2006, 2008 Futurescale, Inc., Some rights reserved.
 Your reuse is governed by the Creative Commons Attribution 3.0 License

 A Base IMediator implementation.
--->
<cfcomponent displayname="Mediator"  
			 extends="org.puremvc.cf.patterns.observer.Notifier" 
			 implements="org.puremvc.cf.interfaces.IMediator,org.puremvc.cf.interfaces.INotifier"
			 output="true"
			 hint="Base IMediator implementation.">

	<cfproperty name="mediatorName" type="string" required="true" hint="The name of the Mediator. Typically, a Mediator will be written to serve one specific control or group controls and so, will not have a need to be dynamically named.">
	<cfproperty name="viewComponent" type="org.puremvc.cf.interfaces.IViewComponent" required="true">
	
	<cfscript>
		variables.mediatorName = 'Mediator';
		variables.viewComponent = 0;
	</cfscript>
	
	<cffunction name="init" returntype="void" access="public" output="true">
		<cfargument name="viewComponent" type="org.puremvc.cf.interfaces.IViewComponent" required="false">
		<cfscript>
			if (isDefined("arguments.viewComponent")) { variables.viewComponent = arguments.viewComponent; }
		</cfscript>
	</cffunction>
	
	<cffunction name="setMediatorName" returntype="void" access="public" output="true" hint="Sets the name of the Mediator">
		<cfargument name="mediatorName" type="string" required="false">
		<cfscript>
			variables.mediatorName = arguments.mediatorName;
		</cfscript>
	</cffunction>
	
	<cffunction name="getMediatorName" returntype="string" access="public" output="true" hint="Gets the name of the Mediator">
		<cfscript>
			if ( IsDefined(GetMetaData(this).DISPLAYNAME) ) { return GetMetaData(this).DISPLAYNAME; } 
			return variables.mediatorName;
		</cfscript>
	</cffunction>
	
	<cffunction name="getViewComponent" returntype="org.puremvc.cf.interfaces.IViewComponent" access="public" output="true">
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