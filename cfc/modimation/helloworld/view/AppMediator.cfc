<cfcomponent displayname="AppMediator" extends="org.puremvc.cf.patterns.mediator.Mediator" output="true">
	
	<cfproperty name="viewComponent" type="org.puremvc.cf.interfaces.IView" required="true">
	
	<cfscript>
		this.NAME = 'AppMediator';
	</cfscript>

	<cffunction name="init" returntype="org.puremvc.cf.interfaces.IMediator" access="public" output="true">
		<cfargument name="viewComponent" type="org.puremvc.cf.interfaces.IViewHelper" required="false" default="0">
		<cfscript>
			super.init(arguments.viewComponent);		
			return this;
		</cfscript>
	</cffunction>
	
	<cffunction name="getMediatorName" returntype="string" access="public" output="true">
		<cfscript>
			return this.NAME;
		</cfscript>
	</cffunction>
	
	<cffunction name="getViewComponent" returntype="org.puremvc.cf.interfaces.IViewHelper" access="public" output="true">
		<cfscript>
			return variables.viewComponent;
		</cfscript>
	</cffunction>
	
	<cffunction name="listNotificationInterests" returntype="array" access="public" output="true">
		<cfscript>
			var interests = ArrayNew(1);
			interests[1] = "onSayHello";
			interests[2] = "onLogin";
			return interests;
		</cfscript>
	</cffunction>
	
	<cffunction name="handleNotification" returntype="void" access="public" output="true">
		<cfargument name="notification" type="org.puremvc.cf.interfaces.INotification" required="true">
		<cfscript>
			if ( arguments.notification.getName() EQ "onSayHello")
			{
				WriteOutput(this.getViewComponent().doSayHello());
			}
			if ( arguments.notification.getName() EQ "onLogin")
			{
				WriteOutput(arguments.notification.getBody().firstName);
				WriteOutput(arguments.notification.getBody().lastName);
			}
		</cfscript>
	</cffunction>
	
</cfcomponent>