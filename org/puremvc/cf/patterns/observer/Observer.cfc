<!---
 PureMVC ColdFusion Port by Michael Oddis <michael.oddis@puremvc.org>
 PureMVC - Copyright(c) 2006, 2007 Futurescale, Inc., Some rights reserved.
 Your reuse is governed by the Creative Commons Attribution 3.0 License
--->
<cfcomponent output="true" implements="org.puremvc.cf.interfaces.IObserver">
	
	<cfproperty name="notify" type="string" required="true">
	<cfproperty name="context" type="any" required="true">
	
	<cffunction name="init" displayname="init" access="public" returntype="org.puremvc.cf.interfaces.IObserver" output="true">
		<cfargument name="notifyMethod" type="string" required="true">
		<cfargument name="notifyContext" type="any" required="true">
		<cfscript>
			this.setNotifyMethod(arguments.notifyMethod);
			this.setNotifyContext(arguments.notifyContext);
			return this;
		</cfscript>
	</cffunction>
	
	<cffunction name="setNotifyMethod" displayname="setNotifyMethod" access="public" returntype="void">
		<cfargument name="notifyMethod" type="string" required="true">
		<cfscript>
			variables.notify = arguments.notifyMethod;
		</cfscript>	
	</cffunction>
	
	<cffunction name="getNotifyMethod" displayname="getNotifyMethod" access="public" returntype="variablename">
		<cfscript>
			return variables.notify;
		</cfscript>	
	</cffunction>
	
	<!--- Set the notification context. --->
	<cffunction name="setNotifyContext" displayname="setNotifyContext" access="public" returntype="void">
		<cfargument name="notifyContext" type="any" required="true">
		<cfscript>
			variables.context = arguments.notifyContext;
		</cfscript>
	</cffunction>
	
	<!--- Get the notification context. --->
	<cffunction name="getNotifyContext" displayname="getNotifyContext" access="public" returntype="any">
		<cfscript>
			return variables.context;
		</cfscript>
	</cffunction>
	
	<!---  Notify the interested object. --->
	<cffunction name="notifyObserver" displayname="notifyObserver" access="public" returntype="void" output="true">
		<cfargument name="notification" type="org.puremvc.cf.interfaces.INotification" required="true">
		<cfscript>
			var thisObject = this.getNotifyContext();
			var methodStr = this.getNotifyMethod();
			var method = thisObject[methodStr];
			//var method = thisObject[this.getNotifyMethod()];
			method(arguments.notification);
		</cfscript>
		<cfdump var="#thisObject#">
		<cfdump var="#methodStr#">
		<cfdump var="#method#">
		<!--- <cftrace text="End - notifyObserver() of Observer"> --->
	</cffunction>
		
</cfcomponent>