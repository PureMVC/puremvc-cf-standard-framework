<cfcomponent displayname="Application" hint="HelloWorld" output="true">
	
	<cfscript>
		this.name = "HelloWorld";
		this.sessionManagement = true;
		this.sessionTimeout = CreateTimeSpan(0,0,20,0);
	</cfscript>
	
	<cffunction name="onApplicationStart" displayname="On Application Start" hint="Application start" access="public" output="true" returntype="boolean">
	   	<cfscript>
			var done = true;
		</cfscript>
		<cfreturn done>
	</cffunction>

	<cffunction name="onSessionStart" displayname="On Session Start" hint="Session start" access="public" output="true" returntype="boolean">
		<cfscript>
			var done = true;
		</cfscript>
		<cfreturn done>
	</cffunction>
	
	<cffunction name="onSessionEnd" displayname="On Session End" hint="Session end" access="public" output="true" returntype="boolean">
		<cfscript>
			var done = true;
		</cfscript>
		<cfreturn done>
	</cffunction>
	
	<cffunction name="onRequestStart" displayname="On Request Start" hint="Request start" access="public" output="true" returntype="boolean">
		<cfscript>
			var done = true;
		</cfscript>
		<cfscript>
			/* Use to clear the facadeInstance. Especially useful when changing examples. */
			if (IsDefined("url.initApp") AND url.initApp )
			{
				if ( StructKeyExists(application,"facadeInstance") )
				{
					StructDelete(application,"facadeInstance");
				}
			}
		</cfscript>
		
		<!--- Hello World Example Facade --->
		<cfinvoke component="HelloWorld.AppFacade" 
				  method="getInstance" 
				  returnvariable="facade">

		<cfreturn done>
	</cffunction>
	
	<cffunction name="onRequestEnd" displayname="On Request End" hint="Request end" access="public" output="true" returntype="boolean">
	   	<cfscript>
			var done = true;
		</cfscript>
		<cfreturn done>
	</cffunction>
	
</cfcomponent>