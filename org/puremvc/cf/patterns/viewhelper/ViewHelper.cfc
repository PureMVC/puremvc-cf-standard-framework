<!---
 PureMVC ColdFusion Port by Michael Oddis <michael.oddis@puremvc.org>
 PureMVC - Copyright(c) 2006, 2008 Futurescale, Inc., Some rights reserved.
 Your reuse is governed by the Creative Commons Attribution 3.0 License
--->
<cfcomponent displayname="ViewHelper" 
			 output="true" 
			 implements="org.puremvc.cf.interfaces.IViewHelper,org.flairteam.interfaces.IFactoryObject">
	
	<cfproperty name="id" type="string" required="false" hint="Identifies the View Helper object.">
	<cfproperty name="name" type="string" required="false" hint="The name of the View Helper.">
	<cfproperty name="oFacade" type="org.puremvc.cf.patterns.facade.Facade" required="true">
	<cfproperty name="oNotification" type="org.puremvc.cf.patterns.observer.Notification" required="true">
	<cfproperty name="isPostBack" type="boolean" required="true" default="false">
	<cfproperty name="listenerMap" type="struct" required="true">
	
	<cfscript>
		variables.id = "";
		variables.name = "";
		variables.oFacade = 0;
		variables.oNotification = 0;
		variables.isPostBack = false;
		this.listenerMap = {};
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
	
	<cffunction name="setId" access="public" returntype="void" output="true">
		<cfargument name="componentId" type="string" required="true" hint="The id of the View Component">
		<cfscript>
			variables.id = arguments.componentId;
		</cfscript>
	</cffunction>
	
	<cffunction name="getId" access="public" returntype="string" output="true">
		<cfscript>
			return variables.id;
		</cfscript>
	</cffunction>
	
	<cffunction name="setComponentName" access="public" returntype="void" output="true">
		<cfargument name="componentName" type="string" required="true" hint="The name of the View Component">
		<cfscript>
			variables.name = arguments.componentName;
		</cfscript>
	</cffunction>
	
	<cffunction name="getComponentName" access="public" returntype="string" output="true">
		<cfscript>
			if (len(variables.name)) { return GetMetaData(this).name; } 
			variables.name = arguments.componentName;
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