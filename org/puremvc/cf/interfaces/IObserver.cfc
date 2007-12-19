<!---
 PureMVC ColdFusion Port by Michael Oddis <michael.oddis@puremvc.org>
 PureMVC - Copyright(c) 2006, 2007 Futurescale, Inc., Some rights reserved.
 Your reuse is governed by the Creative Commons Attribution 3.0 License
--->
<cfinterface name="IObserver" displayname="IObserver">
	
	<!--- 
	/**
	 * Set the notification method.
	 * 
	 * <P>The notification method should take one parameter of type <code>INotification</code></P>
	 * 
	 * @param notifyMethod the notification (callback) method of the interested object
	 */
	 --->
	<cffunction name="setNotifyMethod" displayname="setNotifyMethod" access="public" returntype="void">
		<cfargument name="notifyMethod" type="string" required="true">	
	</cffunction>
	
	<!--- Set the notification context. --->
	<cffunction name="setNotifyContext" displayname="setNotifyContext" access="public" returntype="void">
		<cfargument name="notifyContext" type="any" required="true">	
	</cffunction>
	
	<!---  Notify the interested object. --->
	<cffunction name="notifyObserver" displayname="notifyObserver" access="public" returntype="void" output="true">
		<cfargument name="notification" type="org.puremvc.cf.interfaces.INotification" required="true">	
	</cffunction>
	
</cfinterface>