<!---
 PureMVC ColdFusion Port by Michael Oddis <michael.oddis@puremvc.org>
 PureMVC - Copyright(c) 2006, 2007 Futurescale, Inc., Some rights reserved.
 Your reuse is governed by the Creative Commons Attribution 3.0 License
--->
<cfcomponent output="true" implements="org.puremvc.cf.interfaces.IObserver">
	
	<cfproperty name="notify" type="string" required="true">
	<cfproperty name="context" type="any" required="true">
	
	<cfscript>
		variables.context = {};
	</cfscript>
	
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
	
	<cffunction name="getNotifyMethod" displayname="getNotifyMethod" access="public" returntype="string">
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
			var method = this.getNotifyMethod();
			if (method EQ "handleNotification")
			{
				thisObject.handleNotification(arguments.notification);
			} else if (method EQ "executeCommand") {
				thisObject.executeCommand(arguments.notification);
			} else if (method EQ "viewTestMethod") {
				thisObject.viewTestMethod(arguments.notification);
			} else if (method EQ "observerTestMethod") {
				thisObject.observerTestMethod(arguments.notification);
			}
		</cfscript>
	</cffunction>
	
	<!--- 
	/**
	 * Compare an object to the notification context. 
	 * 
	 * @param object the object to compare
	 * @return boolean indicating if the object and the notification context are the same
	 */
	 --->
	<cffunction name="compareNotifyContext" displayname="compareNotifyContext" access="public" returntype="boolean" output="true">
		<cfargument name="object" type="any" required="true">
		<cfscript>
			return ( IsObject(arguments.object) == IsObject(variables.context) );
		</cfscript>
	</cffunction>

</cfcomponent>