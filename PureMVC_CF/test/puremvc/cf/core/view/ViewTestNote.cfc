<cfcomponent output="false" extends="org.puremvc.cf.patterns.observer.Notification">

	<cfscript>
		this.NAME = "ViewTestNote";
	</cfscript>

	<cffunction name="init" output="true" returntype="ViewTestNote">
		<cfargument name="notificationName" type="string" required="true" hint="Name of the Notification instance">
		<cfargument name="notificationBody" type="any" required="false" hint="Body the Notification body.">
		<cfscript>
			super.init(arguments.notificationName, arguments.notificationBody);
		</cfscript>
		<cfreturn this>
	</cffunction>
	
	<cffunction name="create" output="true" returntype="org.puremvc.cf.interfaces.INotification">
		<cfargument name="notificationBody" type="any" required="false" hint="Body the Notification body.">
		<cfscript>
			var notification = CreateObject("component","org.puremvc.cf.patterns.observer.Notification");
			notification.init(this.NAME, arguments.notificationBody);
			return notification;
		</cfscript>
	</cffunction>

</cfcomponent>