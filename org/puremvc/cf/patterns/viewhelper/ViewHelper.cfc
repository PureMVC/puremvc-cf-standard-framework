<!---
******************************************************************************
 PureMVC ColdFusion Port by Michael Oddis <michael.oddis@puremvc.org>
 PureMVC - Copyright(c) 2006, 2008 Futurescale, Inc., Some rights reserved.
 Your reuse is governed by the Creative Commons Attribution 3.0 License
******************************************************************************

 A Base IViewHelper implementation.

 A ViewHelper is registered with a Mediator in PureMVC for ColdFusion. Mediators and the Controller
 can listen for Notifications sent from a ViewHelper.

 Implementors are responsible for the following:
 
 - Send notifications which are handled by a front controller or mediators registered as observers.
 - Handle postbacks from user gentures from a view.
 - Handle updating properties defined on a view.
 - Handle calls from Mediators.

*****************************************************************************
--->
<cfcomponent displayname="ViewHelper"
			 output="false"
			 implements="org.puremvc.cf.interfaces.IViewHelper,org.puremvc.cf.interfaces.INotifier">
	
	<cfproperty name="id" type="string" required="false" hint="Identifies the view helper object.">
	<cfproperty name="componentName" type="string" required="false" hint="The name of the view component.">
	<cfproperty name="facade" type="org.puremvc.cf.patterns.facade.Facade" required="true" hint="An instance of the facade.">
	<cfproperty name="isPostBack" type="boolean" required="true" default="false" hint="Value which indicates a view has been posted.">
	
	<cfscript>
		variables.id = "ViewHelper";
		variables.componentName = "ViewHelper";
		variables.isPostBack = false;
		variables.facade = application.facadeInstance;
	</cfscript>
	
	<cffunction name="init" access="public" returntype="void" hint="Contructor">
		<cfscript>
			this.initializeViewHelper();
		</cfscript>
	</cffunction>
	
	<cffunction name="initializeViewHelper" access="public" returntype="void" hint="Initializes the View Helper." output="false">
		<cfscript>
		</cfscript>
	</cffunction>
	
	<cffunction name="setId" access="public" returntype="void" output="false" hint="Sets the id of the view componemt.">
		<cfargument name="id" type="string" required="true" hint="The id of the view component">
		<cfscript>
			variables.id = arguments.id;
		</cfscript>
	</cffunction>
	<cffunction name="getId" access="public" returntype="string" output="false" hint="Gets the id of the view component.">
		<cfscript>
			return variables.id;
		</cfscript>
	</cffunction>
	
	<cffunction name="setComponentName" access="public" returntype="void" output="false" hint="Sets the name of the view component">
		<cfargument name="componentName" type="string" required="true" hint="The name of the view component">
		<cfscript>
			variables.componentName = arguments.componentName;
		</cfscript>
	</cffunction>
	<cffunction name="getComponentName" access="public" returntype="string" output="false" hint="Gets the name of the view component.">
		<cfscript>
			return variables.componentName;
		</cfscript>
	</cffunction>
	
	<cffunction name="setFacade" access="public" returntype="void" hint="Sets a reference to the facade instance with the view helper.">
		<cfargument name="facade" type="org.puremvc.cf.interfaces.IFacade" required="true" hint="A facade instance.">
		<cfscript>
			variables.facade = arguments.facade;
		</cfscript>
	</cffunction>
	<cffunction name="getFacade" access="public" returntype="org.puremvc.cf.interfaces.IFacade" hint="Gets the facade instance on the view helper.">
		<cfscript>
			return variables.facade;
		</cfscript>
	</cffunction>
	
	<cffunction name="sendNotification" returntype="void" access="public" output="false" hint="Sends a notification which Observers will act upon.">
		<cfargument name="notificationName" type="string" required="true" hint="The name of the notification instance">
		<cfargument name="notificationBody" type="any" default="0" required="false" hint="The body of the notification instance">
		<cfargument name="notificationType" type="string" default="" required="false" hint="The type of the notification instance">
		<cfscript>
			this.getFacade().sendNotification(arguments.notificationName, arguments.notificationBody, arguments.notificationType);		
		</cfscript>
	</cffunction>
	
	<cffunction name="hasFormBeenPosted" access="public" returntype="boolean" hint="Returns whether the ViewHelper is a Form post transactions.">
		<cfscript>
			return variables.isPostBack;
		</cfscript>
	</cffunction>
	
	<cffunction name="handlePostBack" access="public" returntype="void" output="false" hint="Is with hasBeenPosted to handle post backs from the server.">
		<cfscript>
		</cfscript>
	</cffunction>
	
	<cffunction name="updateView" returntype="void" access="public" output="false" hint="Updates the view and associated properties. Most of the time called from an IMediator instance.">
		<cfscript>
		</cfscript>
	</cffunction>
	
	<cffunction name="applyNotifyMethod" returntype="void" access="public" output="false" hint="Runs the Observer handler of an IViewHelper when registered as an Observer.">
		<cfargument name="notification" type="org.puremvc.cf.interfaces.INotification" required="true">
		<cfscript>
			this.updateView(arguments.notification);
		</cfscript>
	</cffunction>
	
</cfcomponent>