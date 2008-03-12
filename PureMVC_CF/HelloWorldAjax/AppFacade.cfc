<!---
 PureMVC ColdFusion Port by Michael Oddis <michael.oddis@puremvc.org>
 PureMVC - Copyright(c) 2006, 2008 Futurescale, Inc., Some rights reserved.
 Your reuse is governed by the Creative Commons Attribution 3.0 License
--->
<cfcomponent extends="org.puremvc.cf.patterns.facade.Facade" 
			 implements="org.puremvc.cf.interfaces.IFacade" 
			 output="true">
	
	<cffunction name="getInstance" displayname="getInstance" access="public" output="true" returntype="org.puremvc.cf.interfaces.IFacade">
		<cfscript>
			if ( NOT StructKeyExists(application,"facadeInstance") )
			{
				application.facadeInstance = CreateObject("component", "HelloWorldAjax.AppFacade");
				application.facadeInstance.initializeFacade();
			}
			return application.facadeInstance;
		</cfscript>
	</cffunction>
	
	<cffunction name="initializeController" returntype="void" access="public" output="true">
		<cfscript>
			super.initializeController();
			this.registerCommand("STARTUP", "HelloWorldAjax.controller.ApplicationStartupCommand");
			this.registerCommand("HELLO_WORLD", "HelloWorldAjax.controller.HelloWorldCommand");
		</cfscript>
	</cffunction>

</cfcomponent>