<cfcomponent displayname="AppMediator" 
			 extends="org.puremvc.cf.patterns.mediator.Mediator" 
			 output="true">
	
	<cfscript>
		variables.mediatorName = 'AppMediator';
	</cfscript>

	<cffunction name="init" returntype="org.puremvc.cf.interfaces.IMediator" access="public" output="true">
		<cfargument name="mediatorName" type="string" required="true" hint="The name of the mediator" default="">
		<cfargument name="viewComponent" type="org.puremvc.cf.interfaces.IViewComponent" required="false" hint="An instance of IViewComponent">
		<cfscript>
			super.init(arguments.mediatorName,arguments.viewComponent);
			return this;
		</cfscript>
	</cffunction>
	
	<cffunction name="listNotificationInterests" returntype="array" access="public" output="true">
		<cfscript>
			var interests = ArrayNew(1);
			interests[1] = "HELLO_WORLD_RESULT";
			return interests;
		</cfscript>
	</cffunction>
	
	<cffunction name="handleNotification" returntype="void" access="public" output="true">
		<cfargument name="notification" type="org.puremvc.cf.interfaces.INotification" required="true">
		<cfscript>
			if ( arguments.notification.getName() EQ "HELLO_WORLD_RESULT")
			{
				this.getViewComponent().updateView();
			}
			if ( arguments.notification.getName() EQ "sayHello")
			{
				this.getViewComponent().updateView();
			}
		</cfscript>
	</cffunction>
	
</cfcomponent>