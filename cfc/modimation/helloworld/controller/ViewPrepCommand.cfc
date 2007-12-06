<cfcomponent extends="org.puremvc.cf.patterns.command.SimpleCommand" implements="org.puremvc.cf.interfaces.ICommand" output="true">
	
	<cffunction name="execute" returntype="void" access="public" output="true">
		<cfargument name="notification" type="org.puremvc.cf.interfaces.INotification" required="true">
		<cfscript>
			var appMediator = CreateObject("component", "cfc.modimation.helloworld.view.AppMediator");
			appMediator.init( notification.getBody() );
			application.facadeInstance.registerMediator( appMediator );
		</cfscript>
		<!--- <cftrace text="End - execute() of ViewPrepCommand"> --->
	</cffunction>
	
</cfcomponent>