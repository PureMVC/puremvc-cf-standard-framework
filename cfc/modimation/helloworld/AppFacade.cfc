<cfcomponent extends="org.puremvc.cf.patterns.facade.Facade" implements="org.puremvc.cf.interfaces.IFacade" output="true">
	
	<cffunction name="getInstance" displayname="getInstance" access="public" output="true" returntype="any">
		<!--- <cftrace text="Beginning = getInstance() of AppFacade"> --->
		<cfscript>
			if ( NOT StructKeyExists(application,"facadeInstance") )
			{
				application.facadeInstance = CreateObject("Component", "cfc.modimation.helloworld.AppFacade");
				application.facadeInstance.initializeFacade();
			}
			return application.facadeInstance;
		</cfscript>
	</cffunction>
	
	<cffunction name="initializeController" returntype="void" access="public" output="true">
		<!--- <cftrace text="Beginning - initializeController() of AppFacade"> --->
		<cfscript>
			super.initializeController();
			
			this.registerCommand("STARTUP", "cfc.modimation.helloworld.controller.ApplicationStartupCommand");
		</cfscript>
	</cffunction>

</cfcomponent>