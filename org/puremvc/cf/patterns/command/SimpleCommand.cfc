<!---
*************************************************************************************
 PureMVC ColdFusion Port by Michael Oddis <michael.oddis@puremvc.org>
 PureMVC - Copyright(c) 2006, 2008 Futurescale, Inc., Some rights reserved.
 Your reuse is governed by the Creative Commons Attribution 3.0 License
*************************************************************************************
 A base ICommand implementation.

 Your subclass should override the execute method where your business logic will handle the INotification.
--->
<cfcomponent displayname="SimpleCommand" 
			 extends="org.puremvc.cf.patterns.observer.Notifier" 
			 implements="org.puremvc.cf.interfaces.ICommand,org.puremvc.cf.interfaces.INotifier" 
			 output="false"
			 hint="A base ICommand implementation.">
	<!---
	 	Fulfill the use-case initiated by the given INotification.
	 	
		In the Command Pattern, an application use-case typically begins with some user action, which results in an 
		INotification being broadcast, which is handled by business logic in the execute method of an ICommand.
	--->
	<cffunction name="execute" returntype="void" access="public" output="false" hint="Execute the ICommand's logic to handle a given INotification.">
		<cfargument name="notification" type="org.puremvc.cf.interfaces.INotification" required="true" hint="An INotification to handle.">
		<cfscript>
		</cfscript>
	</cffunction>
	
	<cffunction name="applyNotifyMethod" returntype="void" access="public" output="false" hint="Runs the Observer handler of an ICommand when registered as an Observer.">
		<cfargument name="notification" type="org.puremvc.cf.interfaces.INotification" required="true" hint="A Notification to execute.">
		<cfscript>
			this.execute(arguments.notification);
		</cfscript>
	</cffunction>
	
</cfcomponent>