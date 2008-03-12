<!---
******************************************************************************
 PureMVC ColdFusion Port by Michael Oddis <michael.oddis@puremvc.org>
 PureMVC - Copyright(c) 2006, 2008 Futurescale, Inc., Some rights reserved.
 Your reuse is governed by the Creative Commons Attribution 3.0 License
******************************************************************************
 A base IObserver implementation.

 An Observer is an object that encapsulates information about an interested object with a method that should 
 be called when a particular INotification is broadcast.
 
 In PureMVC, the Observer class assumes these responsibilities:

 - Encapsulate the notification (callback) method of the interested object.
 - Encapsulate the notification context (this) of the interested object.
 - Provide methods for setting the notification method and context.
 - Provide a method for notifying the interested object.
	 
******************************************************************************
--->
<cfcomponent displayName="Observer" 
			 implements="org.puremvc.cf.interfaces.IObserver"
			 output="true"
			 hint="A base IObserver implementation. An Observer is an object that encapsulates information about an interested object with a method that should be called when a particular INotification is broadcast.">
	
	<cfproperty name="notify" type="string" required="false" hint="Method called when a Notification is broadcasted.">
	<cfproperty name="context" type="any" required="true" hint="The Notification object which contains the notify method.">
	
	<cfscript>
		variables.context = {};
		variables.notify = "";
	</cfscript>
	
	<cffunction name="init" displayname="init" access="public" returntype="org.puremvc.cf.interfaces.IObserver" output="true" hint="Constructor">
		<cfargument name="notifyMethod" type="string" required="false" default="">
		<cfargument name="notifyContext" type="any" required="true">
		<cfscript>
			this.setNotifyMethod(arguments.notifyMethod);
			this.setNotifyContext(arguments.notifyContext);
			return this;
		</cfscript>
	</cffunction>
	
	<cffunction name="setNotifyMethod" displayname="setNotifyMethod" access="public" returntype="void" hint="Set the notify method.">
		<cfargument name="notifyMethod" type="string" required="true" hint="The notify method.">
		<cfscript>
			variables.notify = arguments.notifyMethod;
		</cfscript>	
	</cffunction>
	<cffunction name="getNotifyMethod" displayname="getNotifyMethod" access="public" returntype="string" hint="Get the notify method.">
		<cfscript>
			return variables.notify;
		</cfscript>	
	</cffunction>
	
	<cffunction name="setNotifyContext" displayname="setNotifyContext" access="public" returntype="void" hint="Set the notification context.">
		<cfargument name="notifyContext" type="any" required="true" hint="The context in which the notification was sent.">
		<cfscript>
			variables.context = arguments.notifyContext;
		</cfscript>
	</cffunction>
	<cffunction name="getNotifyContext" displayname="getNotifyContext" access="public" returntype="any" hint="Get the notification context.">
		<cfscript>
			return variables.context;
		</cfscript>
	</cffunction>
	
	<cffunction name="notifyObserver" displayname="notifyObserver" access="public" returntype="void" output="true" hint="Notify the interested object.">
		<cfargument name="notification" type="org.puremvc.cf.interfaces.INotification" required="true" hint="A INotification instance.">
		<cfscript>
			this.getNotifyContext().applyNotifyMethod(arguments.notification);
		</cfscript>
	</cffunction>

	<cffunction name="compareNotifyContext" displayname="compareNotifyContext" access="public" 
				returntype="boolean" output="true"
				hint="Compare an object to the notification context. Returns boolean indicating if the object and the notification context are the same">
		<cfargument name="object" type="any" required="true" hint="The object to compare">
		<cfscript>
			return ( IsObject(arguments.object) == IsObject(variables.context) );
		</cfscript>
	</cffunction>

</cfcomponent>