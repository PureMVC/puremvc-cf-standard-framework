<!---
 PureMVC ColdFusion Port by Michael Oddis <michael.oddis@puremvc.org>
 PureMVC - Copyright(c) 2006, 2008 Futurescale, Inc., Some rights reserved.
 Your reuse is governed by the Creative Commons Attribution 3.0 License
--->
<cfcomponent displayname="ViewHelper"
			 output="true" 
			 extends="org.puremvc.cf.patterns.observer.Notifier"
			 implements="org.puremvc.cf.interfaces.IViewHelper,org.puremvc.cf.interfaces.IFactoryObject">
	
	<cfproperty name="id" type="string" required="false" hint="Identifies the View Helper object.">
	<cfproperty name="name" type="string" required="false" hint="The name of the View Helper.">
	<cfproperty name="facade" type="org.puremvc.cf.patterns.facade.Facade" required="true">
	<cfproperty name="isPostBack" type="boolean" required="true" default="false">
	<cfproperty name="listenerMap" type="struct" required="true">
	
	<cfscript>
		variables.id = "";
		variables.name = "";
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
			if ( IsDefined(GetMetaData(this).displayName) ) { return GetMetaData(this).displayName; } 
			return variables.name;
		</cfscript>
	</cffunction>
	
	<cffunction name="registerMediator" returntype="void" access="public" output="true">
		<cfargument name="mediator" type="org.puremvc.cf.interfaces.IMediator" required="true">
		<cfscript>
			this.getFacade().registerMediator(arguments.mediator);
		</cfscript>
	</cffunction>
	
	<cffunction name="retrieveMediator" returntype="org.puremvc.cf.interfaces.IMediator" access="public" output="true">
		<cfargument name="mediatorName" type="string" required="true">
		<cfscript>
			return this.getFacade().retrieveMediator(arguments.mediatorName);
		</cfscript>
	</cffunction>
	
	<cffunction name="getObject" returntype="org.puremvc.cf.interfaces.IFactoryObject" access="public" output="true">
		<cfargument name="objectName" required="true" type="string" />
		<cfscript>
			return this.getFacade().getFactory().getObject(arguments.objectName);
		</cfscript>
	</cffunction>
	
	<cffunction name="setFacade" access="public" returntype="void">
		<cfargument name="facade" type="org.puremvc.cf.interfaces.IFacade" required="true">
		<cfscript>
			variables.facade = arguments.facade;
		</cfscript>
	</cffunction>
	
	<cffunction name="getFacade" access="public" returntype="org.puremvc.cf.patterns.facade.Facade">
		<cfscript>
			return variables.facade;
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