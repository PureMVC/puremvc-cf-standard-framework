<cfcomponent extends="org.puremvc.cf.patterns.command.SimpleCommand" implements="org.puremvc.cf.interfaces.ICommand" output="true">
	
	<cffunction name="execute" returntype="void" access="public" output="true">
		<cfargument name="notification" type="org.puremvc.cf.interfaces.INotification" required="true">
		<cfscript>
			application.facadeInstance.registerProxy( CreateObject("component", "cfc.modimation.helloworld.model.AppProxy").init() );
		</cfscript>
	</cffunction>
	
</cfcomponent>